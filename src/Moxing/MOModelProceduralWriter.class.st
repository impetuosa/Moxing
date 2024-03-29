"
I define the basic idea of a procedural writer. 
A procedural writer is a tree-kind of writer. 
I have subwritters that knows me. 
I allow to give composition of the things built by me and my subwritters. I know how to add my production on my parent.
"
Class {
	#name : #MOModelProceduralWriter,
	#superclass : #Object,
	#instVars : [
		'builder',
		'surface',
		'writeBuilder',
		'from',
		'to',
		'anchor',
		'writeResult',
		'parentWriter',
		'copyHelper',
		'useless'
	],
	#category : #'Moxing-MicroWriters'
}

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> acceptWritingVisitor: aVisitor [
 	self subclassResponsibility 
]

{ #category : #adding }
MOModelProceduralWriter >> addFylgjaStub: aFylgjaCandidateStub [ 

]

{ #category : #accessing }
MOModelProceduralWriter >> anchor: aMOAnchor [ 
	anchor := aMOAnchor
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> anchoringOn: aMOAnchor [ 
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> arrayInitializer: aCollection [

	^ builder arrayLiteralBuilder
		  value: aCollection;
		  build
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> arrayLiteral: aCollection [

	^ builder arrayLiteralBuilder
		  value: (aCollection collect: [ :i | self literalForValue: i ]);
		  build
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> arrayLiteralFromLiterals: aCollection [

	^ builder arrayLiteralBuilder
		  value: aCollection;
		  build
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> arrayTypeReferenceOf: aMOTypeReference [

	^ builder arrayedTypeReferenceBuilder
		  baseType: aMOTypeReference;
		  build
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> artefactReferenceNamed: aString [

	^ parentWriter artefactReferenceNamed: aString
]

{ #category : #accessing }
MOModelProceduralWriter >> autoPopulate: aBoolean [ 
	parentWriter autoPopulate: aBoolean 
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> beUseless [
	useless := true .
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> booleanLiteral: aBoolean [ 
	^ builder booleanLiteralBuilder
		  value: aBoolean;
		  build
]

{ #category : #writing }
MOModelProceduralWriter >> build [

	| entity |

	entity := self writerBuilder build.
	self installFromTo: entity.
	^ entity
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> buildAndWrite [

	self writeToSurface: self build
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> builder [  
	^ builder
]

{ #category : #accessing }
MOModelProceduralWriter >> builder: aMOModelBuilder [ 
	builder := aMOModelBuilder
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> characterLiteral: aCharacter [

	^ builder charLiteralBuilder
		  value: aCharacter;
		  build
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> colorLiteral: aString [

	^ builder colorLiteralBuilder
		  value: aString;
		  build
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> constantReferenceNamed: aString [

	^ builder constantReferenceBuilder
		  name: aString;
		  build
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> dateLiteral: aString [

	^ builder dateLiteralBuilder
		  value: aString;
		  build
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> dictionaryLiteral: aCollection [

	| dict |
	dict := aCollection associations collect: [ :a | 
		        a key -> (self literalForValue: a value) ].
	^ self dictionaryLiteralWithLiterals: dict asDictionary
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> dictionaryLiteralWithLiterals: aCollection [

	^ builder dictionaryLiteralBuilder
		  value: aCollection;
		  build
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> fileDescriptorLiteral: aString [ 

	^ builder fileDescriptorLiteralBuilder
		  value: aString ;
		  build
]

{ #category : #accessing }
MOModelProceduralWriter >> fileReference: anUndefinedObject [ 
	writeBuilder fileReference: anUndefinedObject 
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> from: aFrom to: aTo [
	from := aFrom.
	to := aTo
]

{ #category : #initialization }
MOModelProceduralWriter >> handlesTypeReferences [
	^ false 
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> immediateWriteParametrizedTypeReference: aFullBlockClosure [ 
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> immediatelyWrite: aFullBlockClosure withWriter: aClass [

	| writingInstance |
	writingInstance := aClass new.
	^ builder model writer
		  write: aFullBlockClosure
		  withWriter: writingInstance
		  writerParent: self
]

{ #category : #accessing }
MOModelProceduralWriter >> initialize [

	super initialize.
	useless := false.
	
]

{ #category : #initialization }
MOModelProceduralWriter >> initializeUpdateBuilderFor: anEntity [
	self initializeWriteBuilder.
	writeBuilder forUpdate: anEntity
]

{ #category : #writing }
MOModelProceduralWriter >> initializeWriteBuilder [

	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> installCopyingBuilder [

	copyHelper := writeBuilder  modelCopyHelper.

	
]

{ #category : #writing }
MOModelProceduralWriter >> installFromTo: entity [

	(from isNotNil and: [ to isNotNil ]) ifTrue: [ 
		entity anchorFrom: from to: to ]
]

{ #category : #accessing }
MOModelProceduralWriter >> isUpdating [

	^ writeBuilder ifNil: [ false ] ifNotNil: [ :wb | wb isUpdating ]
]

{ #category : #writing }
MOModelProceduralWriter >> isWriter [
	^ true 
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> literalForValue: aValue [

	aValue isString ifTrue: [ ^ self stringLiteral: aValue ].
	aValue isCharacter ifTrue: [ ^ self characterLiteral: aValue value ].
	aValue isNil ifTrue: [ ^ self nullLiteral ].
	aValue isNumber ifTrue: [ ^ self numericLiteral: aValue ].
	aValue isArray ifTrue: [ ^ self arrayLiteral: aValue ].
	aValue isDictionary ifTrue: [ ^ self dictionaryLiteral: aValue ].
	(aValue isKindOf: ByteArray) ifTrue: [ 
		^ self arrayLiteral: aValue asArray ].
	(aValue isKindOf: Boolean) ifTrue: [ ^ self booleanLiteral: aValue ].

	self error: 'unexpected'
]

{ #category : #accessing }
MOModelProceduralWriter >> model [

	^ builder model
]

{ #category : #accessing }
MOModelProceduralWriter >> name: aString [ 
	
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> nullLiteral [

	^ builder nullLiteralBuilder build
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> numericLiteral: anInteger [

	^ builder numericLiteralBuilder
		  value: anInteger;
		  build
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> packageReferenceNamed: aString [

	^ builder packageReferenceBuilder
		  packageName: aString;
		  build
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> parametrizedTypeReferenceFullyNamed: aString arguments: aCollection [

	^ builder parametrizedTypeReferenceBuilder
		  fullName: aString;
		  argumentTypeReferences: aCollection;
		  build
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> parametrizedTypeReferenceNamed: aString arguments: aCollection [

	^ builder parametrizedTypeReferenceBuilder
		  name: aString;
		  argumentTypeReferences: aCollection;
		  build
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> parentWriter [ 
	^ parentWriter 
]

{ #category : #accessing }
MOModelProceduralWriter >> parentWriter: aMODeclarationUnitWriter [ 
	parentWriter := aMODeclarationUnitWriter
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> primitiveTypeReferenceNamed: aString [

	^ builder primitiveTypeReferenceNamed: aString
]

{ #category : #writing }
MOModelProceduralWriter >> privateWriteToSurface: anEntity [

	self subclassResponsibility

]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> qualifiedTypeReferenceNamed: aString receiver: aReceiverReference [

	^ parentWriter
		  qualifiedTypeReferenceNamed: aString
		  receiver: aReceiverReference
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> questionMarkTypeReference [

	^ self typeReferenceNamed: #?
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> referenceToSelf [

	^ builder referenceToSelf
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> referenceToSuper [
	^ builder referenceToSuper
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> referenceToThisContext [

	^ builder referenceToThisContext
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> sharedPoolReferenceNamed: aString [

	^ builder sharedPoolReferenceBuilder
		  name: aString;
		  build
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> stringLiteral: aString [

	^ builder stringLiteralBuilder
		  value: aString;
		  build
]

{ #category : #accessing }
MOModelProceduralWriter >> surface: aMOModelWriter [ 
	surface := aMOModelWriter
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> symbolicArrayLiteral: aCollection [

	^ builder symbolicArrayLiteralBuilder
		  value: (aCollection collect: [ :i | self literalForValue: i ]);
		  build
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> templateLiteral: aCollection [

	^ writeBuilder templateLiteralBuilder
		  expressions: aCollection;
		  build
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> thrownTypeReferences: aCollection [

	writeBuilder thrownTypeReferences: aCollection
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> typeReferenceFullNamed: aString [

	
		^ parentWriter typeReferenceFullNamed: aString 
	
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> typeReferenceNamed: aString [

	^ self isUpdating
		  ifTrue: [ 
			  self builder typeReferenceBuilder
				  name: aString;
				  build ]
		  ifFalse: [ parentWriter typeReferenceNamed: aString ]
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> typeReferenceNamedForRebinding: aString [

	^ self builder typeReferenceBuilder
		  name: aString;
		  build
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> updateBlock: aMOBlock with: aFullBlockClosure [

	^ self model writer updateBlock: aMOBlock with: aFullBlockClosure
]

{ #category : #writing }
MOModelProceduralWriter >> updateDeclarationUnitDependencies: aDestinationRelation [ 

	parentWriter updateDeclarationUnitDependencies: aDestinationRelation 
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> updaterFor: aDestinationContext with: aProvenanceEntity [

	^ parentWriter
		  updaterFor: aDestinationContext
		  with: aProvenanceEntity
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> updaterFor: aDestinationContext with: aProvenanceEntity do: aFullBlockClosure [

	^ parentWriter
		  updaterFor: aDestinationContext
		  with: aProvenanceEntity
		  do: aFullBlockClosure
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> variableReferenceNamed: aString [

	^ builder variableReferenceBuilder
		  name: aString;
		  build
]

{ #category : #writing }
MOModelProceduralWriter >> write: aBlock [
	self assert: useless not.
	writeResult := aBlock cull: self.
	^ self writeToSurface: self build
]

{ #category : #writing }
MOModelProceduralWriter >> write: aBlock inSubWriter: aSubWriterClass [

	^ self
		  write: aBlock
		  inSubWriter: aSubWriterClass
		  initializeWith: [ :a |  ]
]

{ #category : #writing }
MOModelProceduralWriter >> write: aBlock inSubWriter: aSubWriterClass initializeWith: anInitBlock [

	| sw |
	sw := aSubWriterClass new.
	sw builder: builder.
	sw initializeWriteBuilder.
	anInitBlock value: sw.
	sw parentWriter: self.
	sw surface: self.


	^ sw write: aBlock
]

{ #category : #writing }
MOModelProceduralWriter >> writeCopy: aFullBlockClosure [

	^ self write: aFullBlockClosure inSubWriter: MOCopyWriter
]

{ #category : #writing }
MOModelProceduralWriter >> writeCopyOf: aProvenanceEntity croppingRelationsWith: aBlock readingValues: aChildDelegateLoadingBlock bindingWithCandidates: aBindingBlock [

	self installCopyingBuilder.


	^ copyHelper
		  buildCopyOf: aProvenanceEntity
		  croppingWith: aBlock
		  readingValues: aChildDelegateLoadingBlock
		  bindingWithCandidates: aBindingBlock
		  into: self
]

{ #category : #writing }
MOModelProceduralWriter >> writeExpression: aBlock [

	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOExpressionWriter.
	^ stmnt
]

{ #category : #accessing }
MOModelProceduralWriter >> writeResult [
	^ writeResult
]

{ #category : #writing }
MOModelProceduralWriter >> writeToSurface: anEntity [

	self isUpdating ifFalse: [ self privateWriteToSurface: anEntity ].
	^ anEntity
]

{ #category : #writing }
MOModelProceduralWriter >> writeUnregisteredExpression: aBlock [ 
	| stmnt |
	stmnt := self
		         write: aBlock
		         inSubWriter: MOExpressionWriter
		         initializeWith: [ :exp | exp doNotRegister ].
	^ stmnt
]

{ #category : #writing }
MOModelProceduralWriter >> writerBuilder [
	^ writeBuilder 
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> writingType [

	^ writeBuilder buildsType
]
