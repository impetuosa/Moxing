Class {
	#name : #MOModelProceduralWriter,
	#superclass : #Object,
	#instVars : [
		'builder',
		'surface',
		'writeBuilder',
		'subwriters'
	],
	#category : #'Moxing-MicroWriters'
}

{ #category : #writing }
MOModelProceduralWriter >> addSubwriter: aWriter [ 
	self subwriters add: aWriter 
]

{ #category : #writing }
MOModelProceduralWriter >> build [

	| entity |
	entity := self writerBuilder build.
	self privateSetAnchor: entity.
	subwriters ifNotNil: [ 
		subwriters do: [ :sw | 
			sw surface: entity.
			sw privateWriteToSurface: sw build ] ].
	^ entity
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> buildExpression: aFullBlockClosure [

	^ (aFullBlockClosure value: builder) build
]

{ #category : #accessing }
MOModelProceduralWriter >> builder: aMOModelBuilder [ 
	builder := aMOModelBuilder
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> immediateWriteParametrizedTypeReference: aFullBlockClosure [ 
	self shouldBeImplemented.
]

{ #category : #writing }
MOModelProceduralWriter >> initializeWriteBuilder [
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> parametrizedTypeReferenceNamed: aString arguments: aCollection [

	^ builder parametrizedTypeReferenceBuilder
		  name: aString;
		  argumentTypeReferences: aCollection;
		  build
]

{ #category : #writing }
MOModelProceduralWriter >> preWrite: aBlock [
	 aBlock value: self 
]

{ #category : #writing }
MOModelProceduralWriter >> preWrite: aBlock inSubWriter: aSubWriterClass [

	self
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
	self addSubwriter: sw.
	sw preWrite: aBlock
]

{ #category : #writing }
MOModelProceduralWriter >> privateSetAnchor: anEntity [

	self subclassResponsibility
]

{ #category : #writing }
MOModelProceduralWriter >> privateWriteToSurface: anEntity [

	self subclassResponsibility
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
MOModelProceduralWriter >> typeReferenceNamed: aString [

	^ builder typeReferenceBuilder
		  name: aString;
		  build
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> variableReferenceNamed: aString [

	^ builder variableReferenceBuilder
		  name: aString;
		  build
]

{ #category : #writing }
MOModelProceduralWriter >> write: aBlock [

	self preWrite: aBlock. 
	self privateWriteToSurface: self build

]

{ #category : #writing }
MOModelProceduralWriter >> writerBuilder [
	^ writeBuilder 
]
