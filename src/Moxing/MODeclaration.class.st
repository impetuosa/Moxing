Class {
	#name : #MODeclaration,
	#superclass : #Object,
	#instVars : [
		'#parent => MOParentSlot'
	],
	#category : #'Moxing-Core'
}

{ #category : #'instance creation' }
MODeclaration class >> new [
	^ self error: 'must give model'
]

{ #category : #'instance creation' }
MODeclaration class >> newInstanceFromModel [ 
	^ super new
]

{ #category : #accessing }
MODeclaration >> acceptVisitor: aVisitor [
	self subclassResponsibility 
]

{ #category : #traverse }
MODeclaration >> allCandidateRelations [

	^ (self class allSlots select: [ :slot | 
		   slot class = MOCandidateSlot ]) flatCollect: [ :slot | 
		  slot readAllRelations: self ]
]

{ #category : #traverse }
MODeclaration >> allContainmentRelations [

	^ (self class allSlots select: [ :slot | 
		   slot class = MOContainmentSlot ]) flatCollect: [ :slot | 
		  slot readAllRelations: self ]
]

{ #category : #traverse }
MODeclaration >> allContainments [

	^ ((self class allSlots select: [ :slot | 
		    slot class = MOContainmentSlot ]) flatCollect: [ :slot | 
		   slot readAll: self ])
	  , (self allExpressions select: [ :expr | expr isReference not ])
]

{ #category : #traverse }
MODeclaration >> allExpressionRelations [

	^ (self class allSlots select: [ :slot | 
		   slot class = MOExpressionSlot ]) flatCollect: [ :slot | 
		  slot readAllRelations: self ]
]

{ #category : #traverse }
MODeclaration >> allExpressionRelationsSelectValue: aBlock [

	^ (self class allSlots select: [ :slot | 
		   slot class = MOExpressionSlot ]) flatCollect: [ :slot | 
		  slot readAllRelations: self selecting: aBlock ]
]

{ #category : #traverse }
MODeclaration >> allExpressions [

	^ ((self class allSlots select: [ :slot | 
		    slot class = MOExpressionSlot ]) flatCollect: [ :slot | 
		   slot readAll: self ]) 
]

{ #category : #traverse }
MODeclaration >> allProperties [

	^ (self class allSlots
		  select: [ :slot | slot class = MOPropertySlot ]
		  thenCollect: [ :slot | slot read: self ])  
]

{ #category : #traverse }
MODeclaration >> allPropertyRelations [

	^ self class allSlots
		  select: [ :slot | slot class = MOPropertySlot ]
		  thenCollect: [ :slot | 
			  MODeclarationStructuralRelation new
				  from: self to: (slot read: self);
				  name: slot name;
				  slot: slot;
				  yourself ]
]

{ #category : #traverse }
MODeclaration >> allReferenceRelations [

	^ (self class allSlots select: [ :slot | 
		   slot class = MOReferenceSlot ]) flatCollect: [ :slot | 
		  slot readAllRelations: self ]
]

{ #category : #traverse }
MODeclaration >> allReferences [

	^ ((self class allSlots select: [ :slot | 
		    slot class = MOReferenceSlot ]) flatCollect: [ :slot | 
		   slot readAll: self ])
	  , (self allExpressions asOrderedCollection select: [ :expr | 
			   expr isReference ])
]

{ #category : #traverse }
MODeclaration >> allRelations [

	^ self allContainmentRelations , self allExpressionRelations
	  , self allReferenceRelations , self allPropertyRelations
	  , self allCandidateRelations
]

{ #category : #'as yet unclassified' }
MODeclaration >> compareName: aString [

	^ self name = aString or: [ self name = (self sanitize: aString) ]
]

{ #category : #'as yet unclassified' }
MODeclaration >> doForceNameToBeSanitized [

	self isRenamable ifFalse: [ ^ self error: ' Cannot ' ].
	self name: (self sanitize: self name)
]

{ #category : #traverse }
MODeclaration >> initialize [

	super initialize.
	self class initializeSlots: self
]

{ #category : #testing }
MODeclaration >> isClassType [
	^ false .
]

{ #category : #testing }
MODeclaration >> isDatasource [
	^ false
]

{ #category : #testing }
MODeclaration >> isDeclaration [
  ^false
]

{ #category : #testing }
MODeclaration >> isInvocation [

	^ false
]

{ #category : #traverse }
MODeclaration >> isMOObject [
	^ true  
]

{ #category : #testing }
MODeclaration >> isMethodExtension [
^ false 
]

{ #category : #testing }
MODeclaration >> isPackage [
	^ false
]

{ #category : #testing }
MODeclaration >> isParametrizable [

	^ false
]

{ #category : #testing }
MODeclaration >> isPrimitiveType [ 

	^ false
]

{ #category : #testing }
MODeclaration >> isReference [
	^ false
]

{ #category : #traverse }
MODeclaration >> isStaticDefinition [
	 ^ true 
]

{ #category : #testing }
MODeclaration >> isType [
	^ false
]

{ #category : #testing }
MODeclaration >> isTypeReference [

	^ false
]

{ #category : #initialization }
MODeclaration >> isWriter [ 
	^ false
]

{ #category : #accessing }
MODeclaration >> parent [
	^ parent
]

{ #category : #accessing }
MODeclaration >> parent: aParent [
	parent := aParent.
	
]

{ #category : #'as yet unclassified' }
MODeclaration >> parentForContext [

	^ self parent
]

{ #category : #'as yet unclassified' }
MODeclaration >> relationNamed: aString [

	^ (self relationsNamed: aString) first
]

{ #category : #'as yet unclassified' }
MODeclaration >> relationsNamed: aString [

	^ (self class allSlots detect: [ :slot | slot name = aString ]) 
		  readAllRelations: self
]

{ #category : #'as yet unclassified' }
MODeclaration >> sanitize: aString [

	^ { #/. #-. #\. ' ' }
		  inject: aString
		  into: [ :acc :each | acc copyReplaceAll: each with: '_' ]
]

{ #category : #'as yet unclassified' }
MODeclaration >> sanitizedName [

	^ self sanitize: self name
]

{ #category : #initialization }
MODeclaration >> setAsParentOf: aMOAnnotationInstance [ 
	aMOAnnotationInstance parent: self 
]

{ #category : #'as yet unclassified' }
MODeclaration >> setterNameFor: aMOBlock [

	| slots |
	slots := self class allSlots select: [ :a | 
		         (a read: self) = aMOBlock ].
	self assert: slots size = 1.
	^ slots first name , ':'
]
