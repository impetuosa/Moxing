Class {
	#name : #MODeclarationStructuralRelation,
	#superclass : #Object,
	#instVars : [
		'from',
		'to',
		'name',
		'slot'
	],
	#category : #'Moxing-Core'
}

{ #category : #'as yet unclassified' }
MODeclarationStructuralRelation class >> nullRelationTo: aMOPackage [

	^ MONullDeclarationRelation new to: aMOPackage
]

{ #category : #visiting }
MODeclarationStructuralRelation >> acceptRule: aMOModelCopy readingValues: aFullBlockClosure bindingWithCandidates: anOtherBlock into: aMOMethodWriter [

	^ slot
		  acceptRule: aMOModelCopy
		  forRelation: self
		  readingValues: aFullBlockClosure
		  bindingWithCandidates: anOtherBlock
		  into: aMOMethodWriter
]

{ #category : #accessing }
MODeclarationStructuralRelation >> from [
	^ from
]

{ #category : #accessing }
MODeclarationStructuralRelation >> from: aFrom to: aTo [ 
	from := aFrom. 
	to := aTo
]

{ #category : #testing }
MODeclarationStructuralRelation >> hasValue [

	to ifNil: [ ^ false ].
	slot isToMany ifTrue: [ to ifEmpty: [ ^ false ] ].
	^ true
]

{ #category : #testing }
MODeclarationStructuralRelation >> isExpression [

	^ to isExpression
]

{ #category : #accessing }
MODeclarationStructuralRelation >> isReference [

	^ to isReference
]

{ #category : #accessing }
MODeclarationStructuralRelation >> name [
	^ name
]

{ #category : #accessing }
MODeclarationStructuralRelation >> name: aString [ 
	name := aString
]

{ #category : #accessing }
MODeclarationStructuralRelation >> printOn: aStream [

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
MODeclarationStructuralRelation >> read: aMOModelMethodBuilder [

	^ aMOModelMethodBuilder perform: slot name
]

{ #category : #testing }
MODeclarationStructuralRelation >> relationName [
  ^slot name
]

{ #category : #accessing }
MODeclarationStructuralRelation >> slot [
	^ slot
]

{ #category : #accessing }
MODeclarationStructuralRelation >> slot: aMOContainmentSlot [ 
	slot := aMOContainmentSlot
]

{ #category : #accessing }
MODeclarationStructuralRelation >> to [
	^ to
]

{ #category : #accessing }
MODeclarationStructuralRelation >> to: aMOClass [ 
	to := aMOClass
]

{ #category : #writing }
MODeclarationStructuralRelation >> write: anObject to: aDestination [

	slot isToMany ifTrue: [ 
		((self read: aDestination) includes: anObject) ifTrue: [ self halt ].
		slot shouldAccept: anObject into: aDestination.
		(self read: aDestination) add: anObject.

		^ self ].

	aDestination perform: slot name , ':' withArguments: { anObject }
]
