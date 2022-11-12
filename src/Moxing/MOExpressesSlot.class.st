"
I am a simple variable. 
I should be either a containment relation or a reference relation. 
if (expression) 
if (var)
if (var == 3)
"
Class {
	#name : #MOExpressesSlot,
	#superclass : #MOOneOrManySlot,
	#category : #'Moxing-Core-Slots'
}

{ #category : #asserting }
MOExpressesSlot >> acceptRule: aRule forRelation: aRelationObject readingValues: aFullBlockClosure bindingWithCandidates: anOtherBlock into: aWriter [

	^ aRule
		  applyOnExpression: aRelationObject
		  readingValues: aFullBlockClosure
		  bindingWithCandidates: anOtherBlock
		  into: aWriter
]

{ #category : #visiting }
MOExpressesSlot >> acceptVisitor: aSPOntologyExtractor forRelation: aMODeclarationStructuralRelation [

	^ aSPOntologyExtractor visitExpressesRelation:
		  aMODeclarationStructuralRelation
]

{ #category : #asserting }
MOExpressesSlot >> shouldAcceptSingleValue: aValue into: anObject [
	aValue isStonReference ifTrue: [ ^ true ].
	^ aValue isNil or: [ anObject canExpress: aValue with: self ]
	
]
