Class {
	#name : #MOModelProceduralWriter,
	#superclass : #Object,
	#instVars : [
		'builder',
		'surface',
		'writeBuilder',
		'subwriters',
		'from',
		'to'
	],
	#category : #'Moxing-MicroWriters'
}

{ #category : #writing }
MOModelProceduralWriter >> addSubwriter: aWriter [ 
	self subwriters add: aWriter 
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> arrayTypeReferenceOf: aMOTypeReference [

	^ builder arrayedTypeReferenceBuilder
		  baseType: aMOTypeReference;
		  build
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
	self installFromTo: entity.
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
MOModelProceduralWriter >> from: aFrom to: aTo [
	from := aFrom.
	to := aTo
]

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> immediateWriteParametrizedTypeReference: aFullBlockClosure [ 
	self shouldBeImplemented.
]

{ #category : #writing }
MOModelProceduralWriter >> initializeWriteBuilder [
	self subclassResponsibility 
]

{ #category : #writing }
MOModelProceduralWriter >> installFromTo: entity [

	(from isNotNil and: [ to isNotNil ]) ifTrue: [ 
		entity anchor:
			entity anchor / '@src' / from asString / #to / to asString ]
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

{ #category : #'as yet unclassified' }
MOModelProceduralWriter >> questionMarkTypeReference [

	^ self typeReferenceNamed: #?
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

	^ builder typeReferenceBuilder
		  fullName: aString;
		  build
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
