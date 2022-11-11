Class {
	#name : #MOObjectInstance,
	#superclass : #Object,
	#instVars : [
		'#holder => MOPropertySlot',
		'#type => MOPropertySlot',
		'#state => MOPropertySlot'
	],
	#category : #'Moxing-Core'
}

{ #category : #'instance creation' }
MOObjectInstance class >> newInstanceFromModel [

	^ self new
]

{ #category : #enumerating }
MOObjectInstance >> allEndingWith: aString ifPresentDo: aFullBlockClosure [

	^ state keys
		  select: [ :a | a endsWith: aString ]
		  thenCollect: [ :e | aFullBlockClosure value: (state at: e) ]
]

{ #category : #accessing }
MOObjectInstance >> allProperties [

	^ (self class allSlots
		  select: [ :slot | slot class = MOPropertySlot ]
		  thenCollect: [ :slot | slot read: self ])  
]

{ #category : #accessing }
MOObjectInstance >> at: aName [

	^ state at: aName ifAbsent: [ 
		  (state associations detect: [ :a | (self sanitize: a key) = aName ])
			  value ]
]

{ #category : #accessing }
MOObjectInstance >> at: name put: aValue [ 
	state at: name put: aValue 
]

{ #category : #accessing }
MOObjectInstance >> finalize [

	| objs |
	state ifNil: [ 
		self class allSlots do: [ :slot | slot write: nil to: self ].
		^ self ].
	objs := state values select: [ :a | a isMOObject ].
	state removeAll.
	self class allSlots do: [ :slot | slot write: nil to: self ].
	objs do: #finalize.
	self becomeForward:{}
]

{ #category : #accessing }
MOObjectInstance >> holder [
	^ holder
]

{ #category : #accessing }
MOObjectInstance >> holder: aHolder [  
	holder := aHolder
]

{ #category : #initialization }
MOObjectInstance >> initialize [
	
	self class initializeSlots: self.
	super initialize.
]

{ #category : #accessing }
MOObjectInstance >> isMOObject [

	^ true
]

{ #category : #accessing }
MOObjectInstance >> isStaticDefinition [

	^ false
]

{ #category : #accessing }
MOObjectInstance >> name [
	^ holder name 
]

{ #category : #'as yet unclassified' }
MOObjectInstance >> objectEntries [

	^ state values select: [ :e | e isMOObject ]
]

{ #category : #accessing }
MOObjectInstance >> sanitize: aString [

	^ { #/. #-. #\. ' ' }
		  inject: aString
		  into: [ :acc :each | acc copyReplaceAll: each with: '_' ]
]

{ #category : #accessing }
MOObjectInstance >> state [

	^ state ifNil: [ state := Dictionary new ].
	
]

{ #category : #accessing }
MOObjectInstance >> type [
	^ type
]

{ #category : #accessing }
MOObjectInstance >> type: aType [ 
	 type := aType 
]

{ #category : #accessing }
MOObjectInstance >> with: aName ifPresentDo: aBlock [

	| val |
	val := state at: aName ifAbsent: [ 
		       (state associations
			        detect: [ :a | (self sanitize: a key) = aName ]
			        ifNone: [ ^ self ]) value ].

	^ aBlock value: val
]
