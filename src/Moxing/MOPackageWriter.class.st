"
I write packages. I allow the wirting of subpackages, classes and declaration units 
"
Class {
	#name : #MOPackageWriter,
	#superclass : #MOModelProceduralWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #adding }
MOPackageWriter >> addClass: aMOClass [

	writeBuilder addClass: aMOClass
]

{ #category : #adding }
MOPackageWriter >> addDeclarationUnit: aMODeclarationUnit [

	writeBuilder addDeclarationUnit: aMODeclarationUnit
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
MOPackageWriter >> privateSetAnchor: anEntity [ 
	anEntity anchor: surface anchor / #package / anEntity name
]

{ #category : #writing }
MOPackageWriter >> privateWriteToSurface: anEntity [
	
	surface setAsParentOf: anEntity.
	surface addPackage: anEntity
]

{ #category : #writing }
MOPackageWriter >> writeClass: aBlock [

	self preWrite: aBlock inSubWriter: MOClassWriter
]

{ #category : #writing }
MOPackageWriter >> writeClassType: aFullBlockClosure [

	self preWrite: aFullBlockClosure inSubWriter: MOClassTypeWriter
]

{ #category : #writing }
MOPackageWriter >> writeDeclarationUnit: aBlock [
	self preWrite: aBlock inSubWriter: MODeclarationUnitWriter
]

{ #category : #writing }
MOPackageWriter >> writeModule: aFullBlockClosure [

	self preWrite: aFullBlockClosure inSubWriter: MOModuleWriter
]

{ #category : #writing }
MOPackageWriter >> writePackage: aBlock [

	self preWrite: aBlock inSubWriter: MOPackageWriter
]

{ #category : #writing }
MOPackageWriter >> writePrimitiveType: aFullBlockClosure [ 
	self preWrite: aFullBlockClosure inSubWriter: MOPrimitiveTypeWriter
]
