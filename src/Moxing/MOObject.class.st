Class {
	#name : #MOObject,
	#superclass : #Object,
	#instVars : [
		'#holder => MOPropertySlot',
		'#type => MOPropertySlot',
		'#state => MOPropertySlot'
	],
	#category : #'Moxing-Core'
}

{ #category : #'instance creation' }
MOObject class >> newInstanceFromModel [

	^ self new
]

{ #category : #accessing }
MOObject >> allProperties [

	^ (self class allSlots
		  select: [ :slot | slot class = MOPropertySlot ]
		  thenCollect: [ :slot | slot read: self ])  
]

{ #category : #accessing }
MOObject >> at: aName [

	^ state at: aName ifAbsent: [ 
		  (state associations detect: [ :a | (self sanitize: a key) = aName ])
			  value ]
]

{ #category : #accessing }
MOObject >> at: name put: aValue [ 
	state at: name put: aValue 
]

{ #category : #accessing }
MOObject >> finalize [

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
MOObject >> holder [
	^ holder
]

{ #category : #accessing }
MOObject >> holder: aHolder [  
	holder := aHolder
]

{ #category : #initialization }
MOObject >> initialize [
	
	self class initializeSlots: self.
	super initialize.
]

{ #category : #accessing }
MOObject >> isMOObject [

	^ true
]

{ #category : #accessing }
MOObject >> isStaticDefinition [

	^ false
]

{ #category : #accessing }
MOObject >> name [
	^ holder name 
]

{ #category : #accessing }
MOObject >> sanitize: aString [

	^ { #/. #-. #\. ' ' }
		  inject: aString
		  into: [ :acc :each | acc copyReplaceAll: each with: '_' ]
]

{ #category : #accessing }
MOObject >> state [

	^ state ifNil: [ state := Dictionary new ].
	
]

{ #category : #accessing }
MOObject >> type [
	^ type
]

{ #category : #accessing }
MOObject >> type: aType [ 
	 type := aType 
]
