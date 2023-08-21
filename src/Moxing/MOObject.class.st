"
Basic abstract class to all the models 
"
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
MOObject class >> isRenamable [

	^ (self canUnderstand: #name:) and: [ self canUnderstand: #name ]
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

{ #category : #query }
MOObject >> allCandidateRelations [

	^ (self class allSlots select: [ :slot | 
		   slot class = MORefereeSlot ]) flatCollect: [ :slot | 
		  slot readAllRelations: self ]
]

{ #category : #query }
MOObject >> allCandidates [

	^ (self class allSlots select: [ :slot | 
		   slot class = MORefereeSlot ]) flatCollect: [ :slot | 
		  slot readAll: self ]
]

{ #category : #query }
MOObject >> allContainments [

	^ self allDeclares, self allStates
]

{ #category : #query }
MOObject >> allDeclares [

	^ (self class allSlots select: [ :slot | slot class = MODeclaresSlot ]) 
		  flatCollect: [ :slot | slot readAll: self ]
]

{ #category : #query }
MOObject >> allDeclaresRelations [

	^ (self class allSlots select: [ :slot | 
		   slot class = MODeclaresSlot ]) flatCollect: [ :slot | 
		  slot readAllRelations: self ]
]

{ #category : #query }
MOObject >> allExpressesRelations [

	^ (self class allSlots select: [ :slot | 
		   slot class = MOExpressesSlot ]) flatCollect: [ :slot | 
		  slot readAllRelations: self ]
]

{ #category : #query }
MOObject >> allExpressionRelationsSelectValue: aBlock [

	^ (self class allSlots select: [ :slot | 
		   slot class = MOExpressesSlot ]) flatCollect: [ :slot | 
		  slot readAllRelations: self selecting: aBlock ]
]

{ #category : #query }
MOObject >> allExpressions [

	^ ((self class allSlots select: [ :slot | 
		    slot class = MOExpressesSlot ]) flatCollect: [ :slot | 
		   slot readAll: self ]) 
]

{ #category : #query }
MOObject >> allOntologicalRelations [

	^ self allParentRelations , self allDeclaresRelations
	  , self allStatesRelations , self allExpressesRelations
	  , self allRefersRelations , self allPropertyRelations
	  , self allCandidateRelations
]

{ #category : #query }
MOObject >> allParentRelations [

	^ self class allSlots
		  select: [ :slot | slot class = MOParentSlot ]
		  thenCollect: [ :slot | 
			  MODeclarationStructuralRelation new
				  from: self to: (slot read: self);
				  name: slot name;
				  slot: slot;
				  yourself ]
]

{ #category : #query }
MOObject >> allProperties [

	^ (self class allSlots
		  select: [ :slot | slot class = MOPropertySlot ]
		  thenCollect: [ :slot | slot read: self ])  
]

{ #category : #query }
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

{ #category : #query }
MOObject >> allReferences [
	^ (self class allSlots select: [ :slot | 
		   slot class = MORefersSlot ]) flatCollect: [ :slot | 
		  slot readAll: self ]
]

{ #category : #query }
MOObject >> allRefersRelations [
	^ (self class allSlots select: [ :slot | 
		   slot class = MORefersSlot ]) flatCollect: [ :slot | 
		  slot readAllRelations: self ]
]

{ #category : #query }
MOObject >> allRelations [

	^ self allDeclaresRelations , self allStatesRelations
	  , self allExpressesRelations , self allRefersRelations
	  , self allPropertyRelations , self allCandidateRelations
]

{ #category : #query }
MOObject >> allStates [

	^ (self class allSlots select: [ :slot | slot class = MOStatesSlot ]) 
		  flatCollect: [ :slot | slot readAll: self ]
]

{ #category : #query }
MOObject >> allStatesRelations [

	^ (self class allSlots select: [ :slot | slot class = MOStatesSlot ]) 
		  flatCollect: [ :slot | slot readAllRelations: self ]
]

{ #category : #query }
MOObject >> childrenForTree [

	^ self allContainments removeDuplicates.
]

{ #category : #comparing }
MOObject >> compareName: aString [

	^ self name = aString or: [ self name = (self sanitize: aString) ]
]

{ #category : #query }
MOObject >> containsSourceCodeEntities [

	^ false
]

{ #category : #fixing }
MOObject >> doForceNameToBeSanitized [
	self isRenamable ifFalse: [ ^ self error: ' Cannot ' ].
	self name: (self sanitize: self name)
]

{ #category : #query }
MOObject >> existsOnlyInParentContext [

	^ false
]

{ #category : #query }
MOObject >> finalize [

	| relations |
	relations := self allRelations.
	self class allSlots do: [ :slot | slot write: nil to: self ].
	relations do: [ :r | r to finalize ].
	self becomeForward: {}
]

{ #category : #query }
MOObject >> fixture [

	^( self class allSlots collect: [ :slot | 
		  slot -> (slot isCorrect: self) ]) 
]

{ #category : #query }
MOObject >> incorrectRelations [

	^ (self class allSlots reject: [ :slot | slot isCorrect: self ]) 
		  flatCollect: [ :s | s readAllRelations: self ]
]

{ #category : #query }
MOObject >> incorrectSlots [

	^ self class allSlots reject: [ :slot | slot isCorrect: self ]
]

{ #category : #query }
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

{ #category : #query }
MOObject >> isCorrect [

	| incorrect |
	incorrect := self incorrectSlots.
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

{ #category : #query }
MOObject >> isDeclarationUnit [

	^ false
]

{ #category : #testing }
MOObject >> isDefinedInLibrary [

	^ false
]

{ #category : #testing }
MOObject >> isExpression [

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

{ #category : #query }
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
MOObject >> isNamedArgument [

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

{ #category : #query }
MOObject >> isRenamable [

	^ self class isRenamable
]

{ #category : #testing }
MOObject >> isReturn [

	^ false
]

{ #category : #query }
MOObject >> isRootDeclaration [ 
	 ^ false
]

{ #category : #query }
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

{ #category : #query }
MOObject >> isStaticDefinition [
	 ^ true 
]

{ #category : #testing }
MOObject >> isStructure [

	^ false
]

{ #category : #testing }
MOObject >> isTable [

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

	parent := aParent
]

{ #category : #accessing }
MOObject >> parentForContext [

	^ (self parent isNil or: [ 
		   self parent isDeclaration or: [ self parent isRootDeclaration ] ])
		  ifTrue: [ self parent ]
		  ifFalse: [ self parent parentForContext ]
]

{ #category : #accessing }
MOObject >> parentName [

	^ (parent respondsTo: #name)
		  ifFalse: [ 'no-parent' ]
		  ifTrue: [ parent name ]
]

{ #category : #accessing }
MOObject >> producesParseableCode [
	^ false
]

{ #category : #accessing }
MOObject >> relationNamed: aString [

	^ (self relationsNamed: aString) first
]

{ #category : #accessing }
MOObject >> relationsNamed: aString [

	^ (self class allSlots detect: [ :slot | slot name = aString ]) 
		  readAllRelations: self
]

{ #category : #'instance creation' }
MOObject >> sanitize: aString [

	^ self class sanitize: aString
]

{ #category : #'instance creation' }
MOObject >> sanitizedName [

	^ self sanitize: self name
]

{ #category : #initialization }
MOObject >> setAsParentOf: aMOAnnotationInstance [ 
	aMOAnnotationInstance parent: self 
]

{ #category : #'instance creation' }
MOObject >> setterNameFor: aMOBlock [

	| slots |
	slots := self class allSlots select: [ :a | 
		         (a read: self) = aMOBlock ].
	self assert: slots size = 1.
	^ slots first name , ':'
]

{ #category : #query }
MOObject >> shouldPopulateRelations [

	^ true
]
