Class {
	#name : #MOObjectObjectRelation,
	#superclass : #Object,
	#instVars : [
		'to',
		'name',
		'slot'
	],
	#category : #'Moxing-Core'
}

{ #category : #testing }
MOObjectObjectRelation >> hasValue [

	to ifNil: [ ^ false ].
	slot isToMany ifTrue: [ to ifEmpty: [ ^ false ] ].
	^ true
]

{ #category : #accessing }
MOObjectObjectRelation >> name [
	^ name
]

{ #category : #accessing }
MOObjectObjectRelation >> name: aString [ 
	name := aString
]

{ #category : #accessing }
MOObjectObjectRelation >> printOn: aStream [

	aStream
		nextPutAll: '=[';
		nextPutAll: name capitalized;
		nextPutAll: ']=>'.
	to printOn: aStream
]

{ #category : #'meta-object-protocol' }
MOObjectObjectRelation >> read: aMOModelMethodBuilder [

	^ aMOModelMethodBuilder perform: slot name
]

{ #category : #accessing }
MOObjectObjectRelation >> slot [
	^ slot
]

{ #category : #accessing }
MOObjectObjectRelation >> slot: aMOContainmentSlot [ 
	slot := aMOContainmentSlot
]

{ #category : #accessing }
MOObjectObjectRelation >> to [
	^ to
]

{ #category : #accessing }
MOObjectObjectRelation >> to: anUndefinedObject [ 
	to := anUndefinedObject
]

{ #category : #writing }
MOObjectObjectRelation >> write: anObject to: aDestination [

	slot isToMany ifTrue: [ 
		((self read: aDestination) includes: anObject) ifTrue: [ self halt ].
		slot shouldAccept: anObject into: aDestination .
		(self read: aDestination) add: anObject.

		^ self ].

	aDestination perform: slot name , ':' withArguments: { anObject }
]
