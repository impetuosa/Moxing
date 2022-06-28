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
	#category : #'Moxing-MicroWriters'
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
				  a packageReference name ~= 'typescript' ] ] ]
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

	^ self write: aBlock inSubWriter: MOClassWriter
]

{ #category : #writing }
MODeclarationUnitWriter >> writeClassType: aBlock [

	^ self write: aBlock inSubWriter: MOClassTypeWriter
]

{ #category : #writing }
MODeclarationUnitWriter >> writeEnum: aFullBlockClosure [

	^ self write: aFullBlockClosure inSubWriter: MOEnumWriter
]

{ #category : #writing }
MODeclarationUnitWriter >> writeFileImport: aFullBlockClosure [

	^ self write: aFullBlockClosure inSubWriter: MOFileImportWriter
]

{ #category : #writing }
MODeclarationUnitWriter >> writeForm: aFullBlockClosure [

	^ self write: aFullBlockClosure inSubWriter: MOFormWriter
]

{ #category : #writing }
MODeclarationUnitWriter >> writeImport: aFullBlockClosure [

	^ self write: aFullBlockClosure inSubWriter: MOImportWriter
]

{ #category : #writing }
MODeclarationUnitWriter >> writeJavaClass: aBlock [

	^ self write: aBlock inSubWriter: MOJavaClassWriter
]

{ #category : #writing }
MODeclarationUnitWriter >> writeJavaEnum: aFullBlockClosure [

	^ self write: aFullBlockClosure inSubWriter: MOJavaEnumWriter
]

{ #category : #writing }
MODeclarationUnitWriter >> writeModule: aFullBlockClosure [

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

	^ self write: aFullBlockClosure inSubWriter: MOParametrizableClassWriter  
]

{ #category : #writing }
MODeclarationUnitWriter >> writeParametrizableClassType: aBlock [

	^ self write: aBlock inSubWriter: MOParametrizableClassTypeWriter
]

{ #category : #writing }
MODeclarationUnitWriter >> writeQuery: aFullBlockClosure [

	^ self write: aFullBlockClosure inSubWriter: MOQueryWriter
]

{ #category : #writing }
MODeclarationUnitWriter >> writeReport: aFullBlockClosure [ 

	^ self write: aFullBlockClosure inSubWriter: MOReportWriter
]

{ #category : #writing }
MODeclarationUnitWriter >> writeStructure: aBlock [

	^ self write: aBlock inSubWriter: MOStructureWriter
]

{ #category : #writing }
MODeclarationUnitWriter >> writeTable: aFullBlockClosure [

	^ self write: aFullBlockClosure inSubWriter: MOTableWriter
]

{ #category : #writing }
MODeclarationUnitWriter >> writeTypescriptClass: aFullBlockClosure [ 

	^ self write: aFullBlockClosure inSubWriter: MOTypescriptClassWriter
]
