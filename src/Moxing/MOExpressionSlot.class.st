"
I am a simple variable. 
I should be either a containment relation or a reference relation. 
if (expression) 
if (var)
if (var == 3)
"
Class {
	#name : #MOExpressionSlot,
	#superclass : #MOOneOrManySlot,
	#category : #'Moxing-Core-Slots'
}

{ #category : #asserting }
MOExpressionSlot >> acceptRule: aRule forRelation: aRelationObject readingValues: aFullBlockClosure into: aWriter [

	^ aRule
		  applyOnExpression: aRelationObject
		  readingValues: aFullBlockClosure
		  into: aWriter
]

{ #category : #asserting }
MOExpressionSlot >> shouldAcceptSingleValue: aValue into: anObject [

	^ aValue isNil or: [ aValue isKindOf: MOObject ]
]
