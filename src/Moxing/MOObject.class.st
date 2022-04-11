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
MOObject >> at: name put: aValue [ 
	state at: name put: aValue 
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
MOObject >> isStaticDefinition [

	^ false
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
