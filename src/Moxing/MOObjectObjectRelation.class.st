Class {
	#name : #MOObjectObjectRelation,
	#superclass : #Object,
	#instVars : [
		'from',
		'to',
		'name',
		'slot'
	],
	#category : #'Moxing-Core'
}

{ #category : #visiting }
MOObjectObjectRelation >> acceptRule: aMOModelCopy readingValues: aFullBlockClosure into: aMOMethodWriter [

	^ slot
		  acceptRule: aMOModelCopy
		  forRelation: self
		  readingValues: aFullBlockClosure
		  into: aMOMethodWriter
]

{ #category : #accessing }
MOObjectObjectRelation >> from [
	^ from
]

{ #category : #accessing }
MOObjectObjectRelation >> from: aFrom to: aTo [ 
	from := aFrom. 
	to := aTo
]

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
		nextPutAll: '(';
		print: from;
		nextPutAll: ')=[';
		nextPutAll: name capitalized;
		nextPutAll: ']=>';
		nextPutAll: '(';
		print: to;
		nextPutAll: ')'
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
MOObjectObjectRelation >> to: aMOClass [ 
	to := aMOClass
]

{ #category : #writing }
MOObjectObjectRelation >> write: anObject to: aDestination [

	| selector |
	selector := slot name = #write
		            ifTrue: [ #setWriteVariable ]
		            ifFalse: [ slot name ].
	slot isToMany ifTrue: [ 
		((self read: aDestination) includes: anObject) ifTrue: [ self halt ].
		slot shouldAccept: anObject into: aDestination.
		(self read: aDestination) add: anObject.

		^ self ].

	aDestination perform: selector, ':' withArguments: { anObject }
]
