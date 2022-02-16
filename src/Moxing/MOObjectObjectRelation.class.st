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
		((self slot read: aDestination) includes: anObject ) ifTrue: [ self halt ].
		(self slot read: aDestination) add: anObject .
"		self assert:
			((self slot read: aDestination) anySatisfy: [ :a | a == anObject ]).
"		^ self ].
	slot write: anObject to: aDestination
]
