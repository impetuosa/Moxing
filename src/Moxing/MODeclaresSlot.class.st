"
I am just a regular variable. 
The important thing is that i am recogniced as holding contained entity. 
All the slots of my kind in a node design a child in a tree structure. 
"
Class {
	#name : #MODeclaresSlot,
	#superclass : #MOOneOrManySlot,
	#category : #'Moxing-Core-Slots'
}

{ #category : #visiting }
MODeclaresSlot >> acceptRule: aRule forRelation: aRelationObject readingValues: aFullBlockClosure bindingWithCandidates: anOtherBlock into: aWriter [

	^ aRule
		  applyOnDeclaration: aRelationObject
		  readingValues: aFullBlockClosure
		  bindingWithCandidates: anOtherBlock
		  into: aWriter
]

{ #category : #visiting }
MODeclaresSlot >> acceptVisitor: aVisitor forRelation: aRelationInstance [

	^ aVisitor visitDeclaresRelation: aRelationInstance
]

{ #category : #asserting }
MODeclaresSlot >> shouldAcceptSingleValue: aValue into: anObject [

	aValue == anObject ifTrue: [ ^ false ].
	aValue isStonReference ifTrue: [ ^ true ].
	^ aValue isNil or: [ anObject canDeclare: aValue with: self ]
	
]
