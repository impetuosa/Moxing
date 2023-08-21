Class {
	#name : #MOArtefactWriter,
	#superclass : #MOModelProceduralWriter,
	#traits : 'MOHoldsTypeReferences',
	#classTraits : 'MOHoldsTypeReferences classTrait',
	#category : #'Moxing-Language-MicroWriters-Declarations'
}

{ #category : #visiting }
MOArtefactWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitArtefactWriter: self 


]

{ #category : #adding }
MOArtefactWriter >> addAliasType: aMOAlias [

	writeBuilder addAliasType: aMOAlias
]

{ #category : #adding }
MOArtefactWriter >> addDeclarationUnit: aMODeclarationUnit [ 
	writeBuilder addDeclarationUnit: aMODeclarationUnit 
]

{ #category : #adding }
MOArtefactWriter >> addEnum: aMOEnum [

	writeBuilder addEnum: aMOEnum
]

{ #category : #adding }
MOArtefactWriter >> addPrimitiveType: aMOPrimitiveType [ 
	writeBuilder addPrimitiveType: aMOPrimitiveType 
]

{ #category : #adding }
MOArtefactWriter >> addStructureType: aMOStructure [

	writeBuilder addStructureType: aMOStructure
]

{ #category : #visiting }
MOArtefactWriter >> name: aName [ 
	 writeBuilder name: aName 
]

{ #category : #writing }
MOArtefactWriter >> privateWriteToSurface: anEntity [

	^ surface addArtefact: anEntity
]

{ #category : #writing }
MOArtefactWriter >> writeAlias: aBlock [

	<doc: 'Writes an alias within a Library/Project.'>
	^ self write: aBlock inSubWriter: MOAliasWriter
]

{ #category : #writing }
MOArtefactWriter >> writeDeclarationUnit: aBlock [

	<doc: 'Writes a declaration unit within a Library/Project.'>
	^ self write: aBlock inSubWriter: MODeclarationUnitWriter
]

{ #category : #writing }
MOArtefactWriter >> writePrimitiveType: aFullBlockClosure [

	<doc: 'Writes a primitive type within a Library/Project.'>
	^ self write: aFullBlockClosure inSubWriter: MOPrimitiveTypeWriter
]

{ #category : #writing }
MOArtefactWriter >> writeStructure: aBlock [

	<doc: 'Writes a structure within a Library/Project.'>
	^ self write: aBlock inSubWriter: MOStructureWriter
]
