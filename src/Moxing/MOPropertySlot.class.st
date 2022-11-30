"
I am just a regular variable slot.
I do represent the fact that my content does not lead to model instances but mostly to basic properties. Such as a name, anchor etc. 
"
Class {
	#name : #MOPropertySlot,
	#superclass : #InstanceVariableSlot,
	#category : #'Moxing-Core-Slots'
}

{ #category : #visiting }
MOPropertySlot >> acceptRule: aRule forRelation: aRelationObject readingValues: aFullBlockClosure bindingWithCandidates: anOtherBlock into: aWriter [

	^ aRule
		  applyOnProperty: aRelationObject
		  readingValues: aFullBlockClosure
		  bindingWithCandidates: anOtherBlock
		  into: aWriter
]

{ #category : #visiting }
MOPropertySlot >> acceptVisitor: aSPOntologyExtractor forRelation: aMODeclarationStructuralRelation [

	^ aSPOntologyExtractor visitPropertyRelation:
		  aMODeclarationStructuralRelation
]

{ #category : #testing }
MOPropertySlot >> isCorrect: anObject [

	^ self should: anObject accept: (self read: anObject)
]

{ #category : #testing }
MOPropertySlot >> isMOSlot [

	^ true
]

{ #category : #testing }
MOPropertySlot >> isNoneValue: aCollection [

	^ aCollection isCollection
		  ifTrue: [ aCollection isEmptyOrNil ]
		  ifFalse: [ aCollection isNil ]
]

{ #category : #testing }
MOPropertySlot >> isToMany [
	^ false 
]

{ #category : #testing }
MOPropertySlot >> should: anObject accept: aValue [

	aValue isStonReference ifTrue: [ ^ true ].
	^ aValue isNil or: [ anObject canBeDescribedBy: aValue with: self ]
]
