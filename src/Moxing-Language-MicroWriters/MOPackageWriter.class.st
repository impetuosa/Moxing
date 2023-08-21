"
I write packages. I allow the wirting of subpackages, classes and declaration units 
"
Class {
	#name : #MOPackageWriter,
	#superclass : #MOModelProceduralWriter,
	#category : #'Moxing-Language-MicroWriters-Declarations'
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

	<doc: 'Writes a class within a the context of a package.'>
	^ self write: aBlock inSubWriter: MOClassWriter
]

{ #category : #writing }
MOPackageWriter >> writeClassType: aFullBlockClosure [
	<doc: 'Writes a class type (interface) within a the context of a package.'>
	^ self write: aFullBlockClosure inSubWriter: MOClassTypeWriter
]

{ #category : #writing }
MOPackageWriter >> writeDeclarationUnit: aBlock [
	<doc: 'Writes a declaration unit within a the context of a package.'>
	^ self write: aBlock inSubWriter: MODeclarationUnitWriter
]

{ #category : #writing }
MOPackageWriter >> writeEnum: aFullBlockClosure [
	<doc: 'Writes a enum within a the context of a package.'>
	^ self writeDeclarationUnit: [ :unit | 
		  unit writeEnum: aFullBlockClosure ]
]

{ #category : #writing }
MOPackageWriter >> writeForm: aFullBlockClosure [
	<doc: 'Writes a form within a the context of a package.'>
	^ self write: aFullBlockClosure inSubWriter: MOFormWriter
]

{ #category : #writing }
MOPackageWriter >> writeJavaClass: aBlock [
	<doc: 'Writes a java class within a the context of a package.'>
	^ self write: aBlock inSubWriter: MOJavaClassWriter
]

{ #category : #writing }
MOPackageWriter >> writeJavaClassType: aBlock [
	<doc: 'Writes a java class type within a the context of a package.'>
	^ self write: aBlock inSubWriter: MOJavaClassTypeWriter
]

{ #category : #writing }
MOPackageWriter >> writeModule: aFullBlockClosure [
	<doc: 'Writes a module within a the context of a package.'>
	^ self write: aFullBlockClosure inSubWriter: MOModuleWriter
]

{ #category : #writing }
MOPackageWriter >> writePackage: aBlock [
	<doc: 'Writes a package within a the context of a package.'>
	^ self write: aBlock inSubWriter: MOPackageWriter
]

{ #category : #writing }
MOPackageWriter >> writeParametrizableClass: aFullBlockClosure [ 
	<doc: 'Writes a parametrizable class within a the context of a package.'>
	^ self write: aFullBlockClosure inSubWriter: MOParametrizableClassWriter  
]

{ #category : #writing }
MOPackageWriter >> writeParametrizableClassType: aBlock [
	<doc: 'Writes a parametrizable class type within a the context of a package.'>
	^ self write: aBlock inSubWriter: MOParametrizableClassTypeWriter
]

{ #category : #writing }
MOPackageWriter >> writePrimitiveType: aFullBlockClosure [
	<doc: 'Writes a primitive type within a the context of a package.'>
	^ self write: aFullBlockClosure inSubWriter: MOPrimitiveTypeWriter
]

{ #category : #writing }
MOPackageWriter >> writeStClass: aFullBlockClosure [
	<doc: 'Writes a smalltalk class within a the context of a package.'>
	^ self write: aFullBlockClosure inSubWriter: MOStClassWriter
]

{ #category : #writing }
MOPackageWriter >> writeStExensionMethodDeclarationUnit: aFullBlockClosure [ 
	<doc: 'Writes a smalltalk extension unit within a the context of a package.'>
	^ self
		  write: aFullBlockClosure
		  inSubWriter: MOStExtensionMethodDeclarationUnitWriter 
]
