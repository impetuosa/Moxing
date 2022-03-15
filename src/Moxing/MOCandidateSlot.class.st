Class {
	#name : #MOCandidateSlot,
	#superclass : #MORelationSlot,
	#category : #'Moxing-Core-Slots'
}

{ #category : #visiting }
MOCandidateSlot >> acceptRule: aRule forRelation: aRelationObject readingValues: aFullBlockClosure into: aWriter [

	^ aRule
		  applyOnCandidate: aRelationObject
		  readingValues: aFullBlockClosure
		  into: aWriter
]

{ #category : #visiting }
MOCandidateSlot >> shouldAccept: aValue into: anObject [

	^ aValue
		  ifNil: [ true ]
		  ifNotNil: [ anObject refersToObjectsLike: aValue ]
]
