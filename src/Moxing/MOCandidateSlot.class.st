Class {
	#name : #MOCandidateSlot,
	#superclass : #MORelationSlot,
	#category : #'Moxing-Core-Slots'
}

{ #category : #visiting }
MOCandidateSlot >> acceptRule: aRule forRelation: aRelationObject readingValues: aFullBlockClosure bindingWithCandidates: anOtherBlock into: aWriter [

	^ aRule
		  applyOnCandidate: aRelationObject
		  readingValues: aFullBlockClosure
		  bindingWithCandidates: anOtherBlock
		  into: aWriter
]

{ #category : #testing }
MOCandidateSlot >> isToMany [

	^ false
]

{ #category : #visiting }
MOCandidateSlot >> readAllRelations: anObject selecting: aBlock [

	| value |
	value := self read: anObject.
	^ (aBlock value: value)
		  ifTrue: [ 
			  { (MODeclarationStructuralRelation new
				   from: anObject to: value;
				   name: self name;
				   slot: self;
				   yourself) } ]
		  ifFalse: [ {  } ]
]

{ #category : #visiting }
MOCandidateSlot >> shouldAccept: aValue into: anObject [
	^ aValue
		  ifNil: [ true ]
		  ifNotNil: [ anObject refersToObjectsLikeOrStonRef: aValue ]
]
