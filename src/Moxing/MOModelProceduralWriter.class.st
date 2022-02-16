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
		'subwriters',
		'from',
		'to',
		'onBuild',
		'anchor',
		'writeResult',
		'futureChilds',
		'parentWriter'
	],
	#category : #'Moxing-MicroWriters'
}

{ #category : #writing }
MOModelProceduralWriter >> addSubwriter: aWriter [ 
	self subwriters add: aWriter 
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
MOModelProceduralWriter >> arrayTypeReferenceOf: aMOTypeReference [

	^ builder arrayedTypeReferenceBuilder
		  baseType: aMOTypeReference;
		  build
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
	subwriters ifNotNil: [ 
		subwriters do: [ :sw | 
			sw surface: self.
			sw buildAndWrite ] ].
	entity := self writerBuilder build.
	self installFromTo: entity.
	futureChilds do: [ :c | c parent: entity ].
	onBuild ifNotNil: [ onBuild cull: entity ].
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
MOModelProceduralWriter >> constantReferenceNamed: aString [

	^ builder constantReferenceBuilder
		  name: aString;
		  build
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

{ #category : #initialization }
MOModelProceduralWriter >> initialize [

	super initialize.
	futureChilds := Set new
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

	writeBuilder := writeBuilder  copyBuilder.
	writeBuilder useAnchor: anchor
]

{ #category : #writing }
MOModelProceduralWriter >> installFromTo: entity [

	(from isNotNil and: [ to isNotNil ]) ifTrue: [ 
		entity anchorFrom: from to: to ]
]

{ #category : #accessing }
MOModelProceduralWriter >> isUpdating [

	^ writeBuilder isUpdating
]

{ #category : #writing }
MOModelProceduralWriter >> isWriter [
	^ true 
]

{ #category : #accessing }
MOModelProceduralWriter >> model [

	^ builder model
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> numericLiteral: anInteger [

	^ builder numericLiteralBuilder
		  value: anInteger;
		  build
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> onBuild: aFullBlockClosure [
	onBuild := aFullBlockClosure
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

{ #category : #writing }
MOModelProceduralWriter >> preWrite: aBlock [

	^ aBlock value: self
]

{ #category : #writing }
MOModelProceduralWriter >> preWrite: aBlock inSubWriter: aSubWriterClass [

	^ self
		  preWrite: aBlock
		  inSubWriter: aSubWriterClass
		  initializeWith: [ :a |  ]
]

{ #category : #writing }
MOModelProceduralWriter >> preWrite: aBlock inSubWriter: aSubWriterClass initializeWith: anInitBlock [

	| sw |
	sw := aSubWriterClass new.
	sw builder: builder.
	sw initializeWriteBuilder.
	anInitBlock value: sw.
	sw parentWriter: self.
	self addSubwriter: sw.
	^ sw preWrite: aBlock
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> primitiveTypeReferenceNamed: aString [

	^ builder primitiveTypeReferenceNamed: aString
]

{ #category : #writing }
MOModelProceduralWriter >> privateSetAnchor: anEntity [

	self subclassResponsibility
]

{ #category : #writing }
MOModelProceduralWriter >> privateWriteToSurface: anEntity [

	surface setCopyEntity: anEntity
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> questionMarkTypeReference [

	^ self typeReferenceNamed: #?
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> referenceToSelf [

	^ builder referenceToSelf
]

{ #category : #writing }
MOModelProceduralWriter >> setAnchor: anEntity [

	self isUpdating ifFalse: [ self privateSetAnchor: anEntity ]
]

{ #category : #initialization }
MOModelProceduralWriter >> setAsParentOf: aMOBlock [

	futureChilds add: aMOBlock 
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> stringLiteral: aString [

	^ builder stringLiteralBuilder
		  value: aString;
		  build
]

{ #category : #writing }
MOModelProceduralWriter >> subwriters [
	^ subwriters ifNil: [ subwriters := OrderedCollection new ]
]

{ #category : #accessing }
MOModelProceduralWriter >> surface: aMOModelWriter [ 
	surface := aMOModelWriter
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

	^ parentWriter typeReferenceNamed: aString
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

	writeResult := self preWrite: aBlock.
	self writeToSurface: self build
]

{ #category : #writing }
MOModelProceduralWriter >> writeCopy: aFullBlockClosure [

	^ self immediatelyWrite: aFullBlockClosure withWriter: MOCopyWriter
]

{ #category : #writing }
MOModelProceduralWriter >> writeCopyOf: aProvenanceEntity readingValues: aChildDelegateLoadingBlock [

	self installCopyingBuilder.
	^ writeBuilder
		buildCopyOf: aProvenanceEntity
		readingValues: aChildDelegateLoadingBlock
]

{ #category : #accessing }
MOModelProceduralWriter >> writeResult [
	^ writeResult
]

{ #category : #writing }
MOModelProceduralWriter >> writeToSurface: anEntity [

	 self privateWriteToSurface: anEntity.
]

{ #category : #writing }
MOModelProceduralWriter >> writerBuilder [
	^ writeBuilder 
]
