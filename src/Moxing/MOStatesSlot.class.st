Class {
	#name : #MOStatesSlot,
	#superclass : #MOOneOrManySlot,
	#category : #'Moxing-Core-Slots'
}

{ #category : #visiting }
MOStatesSlot >> acceptRule: aRule forRelation: aRelationObject readingValues: aFullBlockClosure bindingWithCandidates: anOtherBlock into: aWriter [

	^ aRule
		  applyOnStatement: aRelationObject
		  readingValues: aFullBlockClosure
		  bindingWithCandidates: anOtherBlock
		  into: aWriter
]

{ #category : #visiting }
MOStatesSlot >> acceptVisitor: aSPOntologyExtractor forRelation: aMODeclarationStructuralRelation [

	^ aSPOntologyExtractor visitStatesRelation:
		  aMODeclarationStructuralRelation
]

{ #category : #visiting }
MOStatesSlot >> shouldAcceptSingleValue: aValue into: anObject [

	aValue isStonReference ifTrue: [ ^ true ].
	^ aValue isNil or: [ anObject canState: aValue with: self ]
	
]
