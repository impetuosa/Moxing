Class {
	#name : #MORefereeSlot,
	#superclass : #MORelationSlot,
	#category : #'Moxing-Core-Slots'
}

{ #category : #visiting }
MORefereeSlot >> acceptRule: aRule forRelation: aRelationObject readingValues: aFullBlockClosure bindingWithCandidates: anOtherBlock into: aWriter [

	^ aRule
		  applyOnReferee: aRelationObject
		  readingValues: aFullBlockClosure
		  bindingWithCandidates: anOtherBlock
		  into: aWriter
]

{ #category : #visiting }
MORefereeSlot >> acceptVisitor: aSPOntologyExtractor forRelation: aMODeclarationStructuralRelation [

	^ aSPOntologyExtractor visitRefereeRelation:
		  aMODeclarationStructuralRelation
]

{ #category : #testing }
MORefereeSlot >> isToMany [

	^ false
]

{ #category : #visiting }
MORefereeSlot >> readAllRelations: anObject selecting: aBlock [

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
MORefereeSlot >> shouldAccept: aValue into: anObject [

	^ aValue isNil or: [ anObject canUseAsReferee: aValue with: self ] 
]
