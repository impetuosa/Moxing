"
Structural relation. I represent a relation: From, To and slot type. The slot type describes the kind of relation. 

"
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
MODeclarationStructuralRelation class >> nullCandidateRelationTo: anUndefinedObject [

	^ MONullDeclarationRelation new
		  slot: #referee => MORefereeSlot;
		  to: anUndefinedObject;
		  yourself
]

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

{ #category : #visiting }
MODeclarationStructuralRelation >> acceptVisitor: aVisitor [

	^ slot acceptVisitor: aVisitor forRelation: self
]

{ #category : #accessing }
MODeclarationStructuralRelation >> from [

	<doc: 'Returns the source (from) of the relationship.'>
	^ from
]

{ #category : #accessing }
MODeclarationStructuralRelation >> from: aMOAlias [ 
	<doc: 'Sets the source (from) of the relationship.'>
	from := aMOAlias
]

{ #category : #accessing }
MODeclarationStructuralRelation >> from: aFrom to: aTo [ 
	<doc: 'sets the source (from) and target (to) of the relationship.'>
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
MODeclarationStructuralRelation >> isContainment [ 
	<doc: 'Tests if the relation is a declaration relation.'>
	 ^ slot class = MODeclaresSlot
]

{ #category : #testing }
MODeclarationStructuralRelation >> isExpression [
	<doc: 'Tests if the relation is a expression relation.'>
	^ to isExpression
]

{ #category : #accessing }
MODeclarationStructuralRelation >> isReference [
	<doc: 'Tests if the relation is a referential relation.'>
	^ to isReference
]

{ #category : #testing }
MODeclarationStructuralRelation >> isToMany [
	<doc: 'Responds if the relations is to many or not.'>
	^ slot isToMany
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

	<doc: 'Reads the content from a gven object.'>
	^ aMOModelMethodBuilder perform: slot name
]

{ #category : #testing }
MODeclarationStructuralRelation >> relationName [

	<doc: 'Relation name.'>
	^ slot name
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
	<doc: 'returns the target (to) of the relationship.'>
	^ to
]

{ #category : #accessing }
MODeclarationStructuralRelation >> to: aMOClass [

	<doc: 'sets the target (to) of the relationship.'>
	(aMOClass = nil and: [ 
		 ({ 
			  MOPropertySlot.
			  MORefereeSlot } anySatisfy: [ :c | slot species = c ]) not ]) 
		ifTrue: [ self halt ].
	to := aMOClass
]

{ #category : #writing }
MODeclarationStructuralRelation >> write: anObject to: aDestination [

	<doc: 'Sets the given object into a destination.'>
	slot isToMany ifTrue: [ 
		((self read: aDestination) includes: anObject) ifTrue: [ self halt ].
		slot shouldAccept: anObject into: aDestination.
		(self read: aDestination) add: anObject.

		^ self ].

	aDestination perform: slot name , ':' withArguments: { anObject }
]
