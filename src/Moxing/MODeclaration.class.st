Class {
	#name : #MODeclaration,
	#superclass : #Object,
	#instVars : [
		'#parent => MOParentSlot'
	],
	#category : #'Moxing-Core'
}

{ #category : #'instance creation' }
MODeclaration class >> fromSton: stonReader [
	"Create a new instance and delegate decoding to instance side.
	Override only when new instance should be created directly (see implementors). "
	
	^ self newInstanceFromModel
		fromSton: stonReader;
		yourself
]

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
MODeclaration >> allCandidates [

	^ (self class allSlots select: [ :slot | 
		   slot class = MOCandidateSlot ]) flatCollect: [ :slot | 
		  slot readAll: self ]
]

{ #category : #traverse }
MODeclaration >> allContainmentRelations [

	^ (self class allSlots select: [ :slot | 
		   slot class = MOContainmentSlot ]) flatCollect: [ :slot | 
		  slot readAllRelations: self ]
]

{ #category : #traverse }
MODeclaration >> allContainments [

	^ (self class allSlots select: [ :slot | 
		   slot class = MOContainmentSlot ]) flatCollect: [ :slot | 
		  slot readAll: self ]
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

	^ (self class allSlots select: [ :slot | 
		   slot class = MOReferenceSlot ]) flatCollect: [ :slot | 
		  slot readAll: self ]
]

{ #category : #traverse }
MODeclaration >> allRelations [

	^ self allContainmentRelations , self allExpressionRelations
	  , self allReferenceRelations , self allPropertyRelations
	  , self allCandidateRelations
]

{ #category : #traverse }
MODeclaration >> childrenForTree [

	^ self allContainments
]

{ #category : #'as yet unclassified' }
MODeclaration >> compareName: aString [

	^ self name = aString or: [ self name = (self sanitize: aString) ]
]

{ #category : #traverse }
MODeclaration >> containsSourceCodeEntities [

	^ false
]

{ #category : #'as yet unclassified' }
MODeclaration >> doForceNameToBeSanitized [

	self isRenamable ifFalse: [ ^ self error: ' Cannot ' ].
	self name: (self sanitize: self name)
]

{ #category : #traverse }
MODeclaration >> finalize [

	| relations |
	relations := self allRelations.
	self class allSlots do: [ :slot | slot write: nil to: self ].
	relations do: [ :r | r to finalize ]
]

{ #category : #traverse }
MODeclaration >> initialize [

	super initialize.
	self class initializeSlots: self
]

{ #category : #testing }
MODeclaration >> isAngularComponent [

	^ false
]

{ #category : #testing }
MODeclaration >> isAssignment [

	^ false
]

{ #category : #testing }
MODeclaration >> isBinaryOperation [

	^ false
]

{ #category : #testing }
MODeclaration >> isClassLike [
	^ false .
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

{ #category : #traverse }
MODeclaration >> isDeclarationUnit [

	^ false
]

{ #category : #testing }
MODeclaration >> isDefinedInLibrary [

	^ false
]

{ #category : #testing }
MODeclaration >> isInTheContextOfA: aClass [

	| current |
	current := self.
	[ 
	current species = aClass or: [ 
		current species = MOModel or: [ current isNil ] ] ] whileFalse: [ 
		current := current parent ].
	^ current species = aClass
]

{ #category : #testing }
MODeclaration >> isInvocable [
	 ^ false 
]

{ #category : #testing }
MODeclaration >> isInvocation [

	^ false
]

{ #category : #testing }
MODeclaration >> isMOBlock [
	^ false
]

{ #category : #testing }
MODeclaration >> isMOLiteral [

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

{ #category : #accessing }
MODeclaration >> isModelOrDerivative [

	^ false
]

{ #category : #testing }
MODeclaration >> isModule [

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
MODeclaration >> isPragma [
	 ^ false 
]

{ #category : #testing }
MODeclaration >> isPrimitiveType [ 

	^ false
]

{ #category : #testing }
MODeclaration >> isQuery [

	^ false
]

{ #category : #testing }
MODeclaration >> isReference [
	^ false
]

{ #category : #testing }
MODeclaration >> isReturn [

	^ false
]

{ #category : #traverse }
MODeclaration >> isRootDeclaration [ 
	 ^ false
]

{ #category : #traverse }
MODeclaration >> isSameEntity: anOtherDeclaration [

	^ self = anOtherDeclaration
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

{ #category : #testing }
MODeclaration >> isUnaryOperation [

	^ false
]

{ #category : #testing }
MODeclaration >> isWidget [

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

	^ (self parent isNil or: [ 
		   self parent isDeclaration or: [ self parent isRootDeclaration ] ])
		  ifTrue: [ self parent ]
		  ifFalse: [ self parent parentForContext ]
]

{ #category : #accessing }
MODeclaration >> producesParseableCode [
	^ false
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

	| sn |
	aString ifNil: [ ^ nil ].
	sn := { #/. #-. #\. ' ' }
		      inject: aString
		      into: [ :acc :each | acc copyReplaceAll: each with: '_' ].
	^ sn first isDigit
		  ifTrue: [ '_' , sn ]
		  ifFalse: [ sn ]
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
