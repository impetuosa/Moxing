"
I am just a regular variable. 
The important thing is that i am recogniced as holding contained entity. 
All the slots of my kind in a node design a child in a tree structure. 
"
Class {
	#name : #MOContainmentSlot,
	#superclass : #MOOneOrManySlot,
	#category : #'Moxing-Core-Slots'
}

{ #category : #visiting }
MOContainmentSlot >> acceptRule: aRule forRelation: aRelationObject readingValues: aFullBlockClosure bindingWithCandidates: anOtherBlock into: aWriter [

	^ aRule
		  applyOnContainment: aRelationObject
		  readingValues: aFullBlockClosure
		  bindingWithCandidates: anOtherBlock
		  into: aWriter
]

{ #category : #asserting }
MOContainmentSlot >> shouldAcceptSingleValue: aValue into: anObject [

	aValue == anObject ifTrue: [ ^ false ].
	aValue isStonReference ifTrue: [ ^ true ].
	^ aValue isNil or: [ aValue isReference not ]
]
