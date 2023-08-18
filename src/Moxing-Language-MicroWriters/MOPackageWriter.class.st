"
I write packages. I allow the wirting of subpackages, classes and declaration units 
"
Class {
	#name : #MOPackageWriter,
	#superclass : #MOModelProceduralWriter,
	#category : #'Moxing-Language-MicroWriters'
}

{ #category : #visiting }
MOPackageWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitPackageWriter: self 


]

{ #category : #adding }
MOPackageWriter >> addClass: aMOClass [

	writeBuilder addClass: aMOClass
]

{ #category : #adding }
MOPackageWriter >> addDeclarationUnit: aMODeclarationUnit [

	writeBuilder addDeclarationUnit: aMODeclarationUnit
]

{ #category : #adding }
MOPackageWriter >> addModule: aMOModule [ 
	writeBuilder addModule: aMOModule 
]

{ #category : #adding }
MOPackageWriter >> addPrimitiveType: aMOPrimitiveType [

	writeBuilder addPrimitiveType: aMOPrimitiveType
]

{ #category : #writing }
MOPackageWriter >> initializeWriteBuilder [

	writeBuilder := builder packageBuilder
]

{ #category : #accessing }
MOPackageWriter >> name [
  ^writeBuilder name
]

{ #category : #accessing }
MOPackageWriter >> name: aString [ 
	writeBuilder name: aString
]

{ #category : #accessing }
MOPackageWriter >> path: aCollection [

	writeBuilder
		parent: (builder ensurePackagePath: aCollection allButLast);
		name: aCollection last
]

{ #category : #writing }
MOPackageWriter >> privateWriteToSurface: anEntity [
	surface addPackage: anEntity
]

{ #category : #writing }
MOPackageWriter >> writeClass: aBlock [

	^ self write: aBlock inSubWriter: MOClassWriter
]

{ #category : #writing }
MOPackageWriter >> writeClassType: aFullBlockClosure [

	^ self write: aFullBlockClosure inSubWriter: MOClassTypeWriter
]

{ #category : #writing }
MOPackageWriter >> writeDeclarationUnit: aBlock [

	^ self write: aBlock inSubWriter: MODeclarationUnitWriter
]

{ #category : #writing }
MOPackageWriter >> writeEnum: aFullBlockClosure [

	^ self writeDeclarationUnit: [ :unit | 
		  unit writeEnum: aFullBlockClosure ]
]

{ #category : #writing }
MOPackageWriter >> writeForm: aFullBlockClosure [

	^ self write: aFullBlockClosure inSubWriter: MOFormWriter
]

{ #category : #writing }
MOPackageWriter >> writeJavaClass: aBlock [

	^ self write: aBlock inSubWriter: MOJavaClassWriter
]

{ #category : #writing }
MOPackageWriter >> writeJavaClassType: aBlock [

	^ self write: aBlock inSubWriter: MOJavaClassTypeWriter
]

{ #category : #writing }
MOPackageWriter >> writeModule: aFullBlockClosure [

	^ self write: aFullBlockClosure inSubWriter: MOModuleWriter
]

{ #category : #writing }
MOPackageWriter >> writePackage: aBlock [

	^ self write: aBlock inSubWriter: MOPackageWriter
]

{ #category : #writing }
MOPackageWriter >> writeParametrizableClass: aFullBlockClosure [ 

	^ self write: aFullBlockClosure inSubWriter: MOParametrizableClassWriter  
]

{ #category : #writing }
MOPackageWriter >> writeParametrizableClassType: aBlock [

	^ self write: aBlock inSubWriter: MOParametrizableClassTypeWriter
]

{ #category : #writing }
MOPackageWriter >> writePrimitiveType: aFullBlockClosure [

	^ self write: aFullBlockClosure inSubWriter: MOPrimitiveTypeWriter
]

{ #category : #writing }
MOPackageWriter >> writeStClass: aFullBlockClosure [

	^ self write: aFullBlockClosure inSubWriter: MOStClassWriter
]

{ #category : #writing }
MOPackageWriter >> writeStExensionMethodDeclarationUnit: aFullBlockClosure [ 

	^ self
		  write: aFullBlockClosure
		  inSubWriter: MOStExtensionMethodDeclarationUnitWriter 
]