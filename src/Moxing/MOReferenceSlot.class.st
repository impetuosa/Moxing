"
I am just a normal variable slot. 
I do represent the fact that i am holding a reference object. 
Reference objects understand #candidate message and return the object defining what the reference means: 
TypeReference object's candidate is a Type object.  
"
Class {
	#name : #MOReferenceSlot,
	#superclass : #MOOneOrManySlot,
	#category : #'Moxing-Core-Slots'
}

{ #category : #asserting }
MOReferenceSlot >> acceptRule: aRule forRelation: aRelationObject readingValues: aFullBlockClosure bindingWithCandidates: anOtherBlock into: aWriter [

	^ aRule
		  applyOnReference: aRelationObject
		  readingValues: aFullBlockClosure
		  bindingWithCandidates: anOtherBlock
		  into: aWriter
]

{ #category : #visiting }
MOReferenceSlot >> acceptVisitor: aSPOntologyExtractor forRelation: aMODeclarationStructuralRelation [

	^ aSPOntologyExtractor visitReferenceRelation:
		  aMODeclarationStructuralRelation
]

{ #category : #asserting }
MOReferenceSlot >> shouldAcceptSingleValue: aValue into: anObject [

	aValue isStonReference ifTrue: [ ^ true ].
	^ aValue isNil or: [ aValue isReference ]
]
