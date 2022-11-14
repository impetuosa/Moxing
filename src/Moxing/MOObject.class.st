Class {
	#name : #MOObject,
	#superclass : #Object,
	#instVars : [
		'#parent => MOParentSlot'
	],
	#category : #'Moxing-Core'
}

{ #category : #'instance creation' }
MOObject class >> fromSton: stonReader [
	"Create a new instance and delegate decoding to instance side.
	Override only when new instance should be created directly (see implementors). "
	
	^ self newInstanceFromModel
		fromSton: stonReader;
		yourself
]

{ #category : #'instance creation' }
MOObject class >> new [
	^ self error: 'must give model'
]

{ #category : #'instance creation' }
MOObject class >> newInstanceFromModel [ 
	^ super new
]

{ #category : #'instance creation' }
MOObject class >> sanitize: aString [

	| sn |
	aString ifNil: [ ^ nil ].
	aString ifEmpty: [ ^ aString ].
	sn := { #/. #-. #\. ' ' }
		      inject: aString
		      into: [ :acc :each | acc copyReplaceAll: each with: '_' ].
	^ sn first isDigit
		  ifTrue: [ '_' , sn ]
		  ifFalse: [ sn ]
]

{ #category : #accessing }
MOObject >> acceptVisitor: aVisitor [
	self subclassResponsibility 
]

{ #category : #traverse }
MOObject >> allCandidateRelations [

	^ (self class allSlots select: [ :slot | 
		   slot class = MORefereeSlot ]) flatCollect: [ :slot | 
		  slot readAllRelations: self ]
]

{ #category : #traverse }
MOObject >> allCandidates [

	^ (self class allSlots select: [ :slot | 
		   slot class = MORefereeSlot ]) flatCollect: [ :slot | 
		  slot readAll: self ]
]

{ #category : #traverse }
MOObject >> allContainments [

	^ (self class allSlots select: [ :slot | 
		   slot class = MODeclaresSlot ]) flatCollect: [ :slot | 
		  slot readAll: self ]
]

{ #category : #traverse }
MOObject >> allDeclaresRelations [

	^ (self class allSlots select: [ :slot | 
		   slot class = MODeclaresSlot ]) flatCollect: [ :slot | 
		  slot readAllRelations: self ]
]

{ #category : #traverse }
MOObject >> allExpressesRelations [

	^ (self class allSlots select: [ :slot | 
		   slot class = MOExpressesSlot ]) flatCollect: [ :slot | 
		  slot readAllRelations: self ]
]

{ #category : #traverse }
MOObject >> allExpressionRelationsSelectValue: aBlock [

	^ (self class allSlots select: [ :slot | 
		   slot class = MOExpressesSlot ]) flatCollect: [ :slot | 
		  slot readAllRelations: self selecting: aBlock ]
]

{ #category : #traverse }
MOObject >> allExpressions [

	^ ((self class allSlots select: [ :slot | 
		    slot class = MOExpressesSlot ]) flatCollect: [ :slot | 
		   slot readAll: self ]) 
]

{ #category : #traverse }
MOObject >> allProperties [

	^ (self class allSlots
		  select: [ :slot | slot class = MOPropertySlot ]
		  thenCollect: [ :slot | slot read: self ])  
]

{ #category : #traverse }
MOObject >> allPropertyRelations [

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
MOObject >> allReferences [
	^ (self class allSlots select: [ :slot | 
		   slot class = MORefersSlot ]) flatCollect: [ :slot | 
		  slot readAll: self ]
]

{ #category : #traverse }
MOObject >> allRefersRelations [
	^ (self class allSlots select: [ :slot | 
		   slot class = MORefersSlot ]) flatCollect: [ :slot | 
		  slot readAllRelations: self ]
]

{ #category : #traverse }
MOObject >> allRelations [

	^ self allDeclaresRelations , self allStatesRelations
	  , self allExpressesRelations , self allRefersRelations
	  , self allPropertyRelations , self allCandidateRelations
]

{ #category : #traverse }
MOObject >> allStatesRelations [

	^ (self class allSlots select: [ :slot | slot class = MOStatesSlot ]) 
		  flatCollect: [ :slot | slot readAllRelations: self ]
]

{ #category : #traverse }
MOObject >> childrenForTree [

	^ self allContainments removeDuplicates.
]

{ #category : #'as yet unclassified' }
MOObject >> compareName: aString [

	^ self name = aString or: [ self name = (self sanitize: aString) ]
]

{ #category : #traverse }
MOObject >> containsSourceCodeEntities [

	^ false
]

{ #category : #'as yet unclassified' }
MOObject >> doForceNameToBeSanitized [

	self isRenamable ifFalse: [ ^ self error: ' Cannot ' ].
	self name: (self sanitize: self name)
]

{ #category : #traverse }
MOObject >> existsOnlyInParentContext [

	^ false
]

{ #category : #traverse }
MOObject >> finalize [

	| relations |
	relations := self allRelations.
	self class allSlots do: [ :slot | slot write: nil to: self ].
	relations do: [ :r | r to finalize ].
	self becomeForward: {}
]

{ #category : #traverse }
MOObject >> initialize [

	super initialize.
	self class initializeSlots: self
]

{ #category : #testing }
MOObject >> isAngularComponent [

	^ false
]

{ #category : #testing }
MOObject >> isArtefact [
^ false
]

{ #category : #testing }
MOObject >> isAssignment [

	^ false
]

{ #category : #testing }
MOObject >> isBinaryOperation [

	^ false
]

{ #category : #testing }
MOObject >> isClassLike [
	^ false .
]

{ #category : #testing }
MOObject >> isClassType [
	^ false .
]

{ #category : #traverse }
MOObject >> isCorrect [

	| incorrect |
	incorrect := self class allSlots reject: [ :slot | 
		             slot isCorrect: self ].
	"
	incorrect first isCorrect: self 
	"
	^ incorrect size = 0
]

{ #category : #testing }
MOObject >> isDatasource [
	^ false
]

{ #category : #testing }
MOObject >> isDeclaration [
  ^false
]

{ #category : #testing }
MOObject >> isDeclarationOrDeclarationUnit [

	^ self isDeclaration or: [ self isDeclarationUnit ]
]

{ #category : #traverse }
MOObject >> isDeclarationUnit [

	^ false
]

{ #category : #testing }
MOObject >> isDefinedInLibrary [

	^ false
]

{ #category : #testing }
MOObject >> isFunction [

	^ false
]

{ #category : #testing }
MOObject >> isInTheContextOfA: aClass [

	| current |
	current := self.
	[ 
	current species = aClass or: [ 
		current species = MOModel or: [ current isNil ] ] ] whileFalse: [ 
		current := current parent ].
	^ current species = aClass
]

{ #category : #testing }
MOObject >> isInvocable [
	 ^ false 
]

{ #category : #testing }
MOObject >> isInvocation [

	^ false
]

{ #category : #testing }
MOObject >> isMOBlock [
	^ false
]

{ #category : #testing }
MOObject >> isMOLiteral [

	^ false
]

{ #category : #traverse }
MOObject >> isMOObject [
	^ true  
]

{ #category : #testing }
MOObject >> isMethod [

	^ false
]

{ #category : #testing }
MOObject >> isMethodExtension [
^ false 
]

{ #category : #testing }
MOObject >> isMethodInvocation [

	^ false
]

{ #category : #accessing }
MOObject >> isModelOrDerivative [

	^ false
]

{ #category : #testing }
MOObject >> isModule [

	^ false
]

{ #category : #testing }
MOObject >> isPackage [
	^ false
]

{ #category : #testing }
MOObject >> isParametrizable [

	^ false
]

{ #category : #testing }
MOObject >> isPragma [
	 ^ false 
]

{ #category : #testing }
MOObject >> isPrimitiveType [ 

	^ false
]

{ #category : #testing }
MOObject >> isProcedure [
^ false.
]

{ #category : #testing }
MOObject >> isQuery [

	^ false
]

{ #category : #testing }
MOObject >> isReference [
	^ false
]

{ #category : #testing }
MOObject >> isReturn [

	^ false
]

{ #category : #traverse }
MOObject >> isRootDeclaration [ 
	 ^ false
]

{ #category : #traverse }
MOObject >> isSameEntity: anOtherDeclaration [

	^ self = anOtherDeclaration
]

{ #category : #testing }
MOObject >> isStatement [

	^ false
]

{ #category : #testing }
MOObject >> isStatementExpression [

	^ false
]

{ #category : #traverse }
MOObject >> isStaticDefinition [
	 ^ true 
]

{ #category : #testing }
MOObject >> isStructure [

	^ false
]

{ #category : #testing }
MOObject >> isType [
	^ false
]

{ #category : #testing }
MOObject >> isTypeReference [

	^ false
]

{ #category : #testing }
MOObject >> isTypedReference [
	^ false
]

{ #category : #testing }
MOObject >> isUnaryOperation [

	^ false
]

{ #category : #testing }
MOObject >> isVariable [

	^ false
]

{ #category : #testing }
MOObject >> isWidget [

	^ false
]

{ #category : #initialization }
MOObject >> isWriter [ 
	^ false
]

{ #category : #accessing }
MOObject >> parent [
	^ parent
]

{ #category : #accessing }
MOObject >> parent: aParent [
	parent := aParent.
	
]

{ #category : #'as yet unclassified' }
MOObject >> parentForContext [

	^ (self parent isNil or: [ 
		   self parent isDeclaration or: [ self parent isRootDeclaration ] ])
		  ifTrue: [ self parent ]
		  ifFalse: [ self parent parentForContext ]
]

{ #category : #accessing }
MOObject >> producesParseableCode [
	^ false
]

{ #category : #'as yet unclassified' }
MOObject >> relationNamed: aString [

	^ (self relationsNamed: aString) first
]

{ #category : #'as yet unclassified' }
MOObject >> relationsNamed: aString [

	^ (self class allSlots detect: [ :slot | slot name = aString ]) 
		  readAllRelations: self
]

{ #category : #'as yet unclassified' }
MOObject >> sanitize: aString [

	^ self class sanitize: aString
]

{ #category : #'as yet unclassified' }
MOObject >> sanitizedName [

	^ self sanitize: self name
]

{ #category : #initialization }
MOObject >> setAsParentOf: aMOAnnotationInstance [ 
	aMOAnnotationInstance parent: self 
]

{ #category : #'as yet unclassified' }
MOObject >> setterNameFor: aMOBlock [

	| slots |
	slots := self class allSlots select: [ :a | 
		         (a read: self) = aMOBlock ].
	self assert: slots size = 1.
	^ slots first name , ':'
]

{ #category : #traverse }
MOObject >> shouldPopulateRelations [

	^ true
]
