"
I write declaration units. I allow the inclusion of class, types and imports 
"
Class {
	#name : #MODeclarationUnitWriter,
	#superclass : #MOModelProceduralWriter,
	#traits : 'MOHoldsTypeReferences',
	#classTraits : 'MOHoldsTypeReferences classTrait',
	#category : #'Moxing-MicroWriters'
}

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
MODeclarationUnitWriter >> addModule: aMOModule [

	writeBuilder addModule: aMOModule
]

{ #category : #adding }
MODeclarationUnitWriter >> addStructureType: aMOStructure [ 
	writeBuilder addStructureType: aMOStructure 
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
MODeclarationUnitWriter >> package: aMOPackage [

	writeBuilder package: aMOPackage
]

{ #category : #writing }
MODeclarationUnitWriter >> privateWriteToSurface: anEntity [

	surface addDeclarationUnit: anEntity
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