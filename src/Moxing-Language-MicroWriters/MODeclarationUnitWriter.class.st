"
I write declaration units. I allow the inclusion of class, types and imports 
"
Class {
	#name : #MODeclarationUnitWriter,
	#superclass : #MOModelProceduralWriter,
	#traits : 'MOHoldsTypeReferences',
	#classTraits : 'MOHoldsTypeReferences classTrait',
	#instVars : [
		'mustUpdateDependencies'
	],
	#category : #'Moxing-Language-MicroWriters-Declarations'
}

{ #category : #visiting }
MODeclarationUnitWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitUnitWriter: self 


]

{ #category : #adding }
MODeclarationUnitWriter >> addClass: aMOClass [ 
	writeBuilder addClass: aMOClass 
]

{ #category : #adding }
MODeclarationUnitWriter >> addClassType: aMOClassType [

	writeBuilder addClassType: aMOClassType
]

{ #category : #adding }
MODeclarationUnitWriter >> addDecorator: aMODecorator [

	self decorators add: aMODecorator
]

{ #category : #adding }
MODeclarationUnitWriter >> addEnum: aMOEnum [

	writeBuilder addEnum: aMOEnum
]

{ #category : #adding }
MODeclarationUnitWriter >> addImport: aMOImport [

	writeBuilder addImport: aMOImport
]

{ #category : #adding }
MODeclarationUnitWriter >> addJavaEnum: aMOJavaEnum [ 
	^ writeBuilder addJavaEnum: aMOJavaEnum 
]

{ #category : #adding }
MODeclarationUnitWriter >> addModule: aMOModule [

	writeBuilder addModule: aMOModule
]

{ #category : #adding }
MODeclarationUnitWriter >> addStructureType: aMOStructure [ 
	writeBuilder addStructureType: aMOStructure 
]

{ #category : #adding }
MODeclarationUnitWriter >> build [

	self mustUpdateDependencies ifTrue: [ self updateDependencies ].
	^ super build
]

{ #category : #adding }
MODeclarationUnitWriter >> importableDependencies: aMOClass [

	^ (aMOClass dependencies reject: [ :a | a isFylgjaStub ]) select: [ 
		  :a | 
		  a packageReference isNotNil and: [ 
			  a packageReference name ~= 'java.lang' and: [ 
				  a packageReference name ~= 'typescript' and: [ 
					  a packageReference name ~= 'RuntimePrimitiveTypes' ] ] ] ]
]

{ #category : #generated }
MODeclarationUnitWriter >> imports: aCollection [

	writeBuilder imports: aCollection
]

{ #category : #writing }
MODeclarationUnitWriter >> initializeWriteBuilder [

	writeBuilder := builder declarationUnitBuilder
]

{ #category : #accessing }
MODeclarationUnitWriter >> mustUpdateDependencies [

	^ mustUpdateDependencies ifNil: [ mustUpdateDependencies := false ]
]

{ #category : #'as yet unclassified' }
MODeclarationUnitWriter >> mustUpdateDependencies: aBoolean for: aMOPrimitiveTypeReference [

	mustUpdateDependencies := true
]

{ #category : #accessing }
MODeclarationUnitWriter >> package: aMOPackage [

	writeBuilder package: aMOPackage
]

{ #category : #writing }
MODeclarationUnitWriter >> privateWriteToSurface: anEntity [

	surface addDeclarationUnit: anEntity
]

{ #category : #adding }
MODeclarationUnitWriter >> updateDeclarationUnitDependencies: aDestinationRelation [

	self mustUpdateDependencies: true for: aDestinationRelation
]

{ #category : #adding }
MODeclarationUnitWriter >> updateDependencies [

	writeBuilder types do: [ :t | 
		(self importableDependencies: t) do: [ :type | 
			self writeImport: [ :import | 
				import importingTypeOrTypeReference: type ] ] ]
]

{ #category : #writing }
MODeclarationUnitWriter >> writeClass: aBlock [

	<doc: 'Writes class within a the context of a Declaration Unit.'>
	^ self write: aBlock inSubWriter: MOClassWriter
]

{ #category : #writing }
MODeclarationUnitWriter >> writeClassType: aBlock [
	<doc: 'Writes class-type within a the context of a Declaration Unit.'>
	^ self write: aBlock inSubWriter: MOClassTypeWriter
]

{ #category : #writing }
MODeclarationUnitWriter >> writeEnum: aFullBlockClosure [
	<doc: 'Writes enum within a the context of a Declaration Unit.'>
	^ self write: aFullBlockClosure inSubWriter: MOEnumWriter
]

{ #category : #writing }
MODeclarationUnitWriter >> writeFileImport: aFullBlockClosure [
	<doc: 'Writes file-import within a the context of a Declaration Unit.'>
	^ self write: aFullBlockClosure inSubWriter: MOFileImportWriter
]

{ #category : #writing }
MODeclarationUnitWriter >> writeForm: aFullBlockClosure [
	<doc: 'Writes Form within a the context of a Declaration Unit.'>
	^ self write: aFullBlockClosure inSubWriter: MOFormWriter
]

{ #category : #writing }
MODeclarationUnitWriter >> writeImport: aFullBlockClosure [
	<doc: 'Writes import within a the context of a Declaration Unit.'>
	^ self write: aFullBlockClosure inSubWriter: MOImportWriter
]

{ #category : #writing }
MODeclarationUnitWriter >> writeJavaClass: aBlock [
	<doc: 'Writes Java Class within a the context of a Declaration Unit.'>
	^ self write: aBlock inSubWriter: MOJavaClassWriter
]

{ #category : #writing }
MODeclarationUnitWriter >> writeJavaClassType: aBlock [
	<doc: 'Writes java interface (class type) within a the context of a Declaration Unit.'>
	^ self write: aBlock inSubWriter: MOJavaClassTypeWriter
]

{ #category : #writing }
MODeclarationUnitWriter >> writeJavaEnum: aFullBlockClosure [
	<doc: 'Writes enum within a the context of a Declaration Unit.'>
	^ self write: aFullBlockClosure inSubWriter: MOJavaEnumWriter
]

{ #category : #writing }
MODeclarationUnitWriter >> writeModule: aFullBlockClosure [
	<doc: 'Writes module within a the context of a Declaration Unit.'>
	^ self write: aFullBlockClosure inSubWriter: MOModuleWriter
]

{ #category : #writing }
MODeclarationUnitWriter >> writePackageNamed: aString ifDoesNotExistUsing: aFullBlockClosure [

	^ parentWriter
		  writePackageNamed: aString
		  ifDoesNotExistUsing: aFullBlockClosure
]

{ #category : #writing }
MODeclarationUnitWriter >> writeParametrizableClass: aFullBlockClosure [ 
	<doc: 'Writes class with generics within a the context of a Declaration Unit.'>
	^ self write: aFullBlockClosure inSubWriter: MOParametrizableClassWriter  
]

{ #category : #writing }
MODeclarationUnitWriter >> writeParametrizableClassType: aBlock [
	<doc: 'Writes intercace with generics within a the context of a Declaration Unit.'>
	^ self write: aBlock inSubWriter: MOParametrizableClassTypeWriter
]

{ #category : #writing }
MODeclarationUnitWriter >> writeQuery: aFullBlockClosure [
	<doc: 'Writes query within a the context of a Declaration Unit.'>
	^ self write: aFullBlockClosure inSubWriter: MOQueryWriter
]

{ #category : #writing }
MODeclarationUnitWriter >> writeReport: aFullBlockClosure [ 
	<doc: 'Writes Report within a the context of a Declaration Unit.'>
	^ self write: aFullBlockClosure inSubWriter: MOReportWriter
]

{ #category : #writing }
MODeclarationUnitWriter >> writeStClass: aBlock [
	<doc: 'Writes Smalltalk class within a the context of a Declaration Unit.'>
	^ self write: aBlock inSubWriter: MOStClassWriter
]

{ #category : #writing }
MODeclarationUnitWriter >> writeStructure: aBlock [
	<doc: 'Writes Structure within a the context of a Declaration Unit.'>
	^ self write: aBlock inSubWriter: MOStructureWriter
]

{ #category : #writing }
MODeclarationUnitWriter >> writeTable: aFullBlockClosure [
	<doc: 'Writes Table within a the context of a Declaration Unit.'>
	^ self write: aFullBlockClosure inSubWriter: MOTableWriter
]

{ #category : #writing }
MODeclarationUnitWriter >> writeTypescriptClass: aFullBlockClosure [ 
	<doc: 'Writes Typescript class within a the context of a Declaration Unit.'>
	^ self write: aFullBlockClosure inSubWriter: MOTypescriptClassWriter
]
