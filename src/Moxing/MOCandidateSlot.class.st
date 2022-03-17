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
MOCandidateSlot >> shouldAccept: aValue into: anObject [

	^ aValue
		  ifNil: [ true ]
		  ifNotNil: [ anObject refersToObjectsLike: aValue ]
]
