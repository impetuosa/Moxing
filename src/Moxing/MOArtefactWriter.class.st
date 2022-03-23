Class {
	#name : #MOArtefactWriter,
	#superclass : #MOModelProceduralWriter,
	#category : #'Moxing-MicroWriters'
}

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

{ #category : #writing }
MOArtefactWriter >> privateWriteToSurface: anEntity [

	^ surface addArtefact: anEntity
]

{ #category : #writing }
MOArtefactWriter >> writeAlias: aBlock [

	^ self write: aBlock inSubWriter: MOAliasWriter
]

{ #category : #writing }
MOArtefactWriter >> writeDeclarationUnit: aBlock [

	^ self write: aBlock inSubWriter: MODeclarationUnitWriter
]

{ #category : #writing }
MOArtefactWriter >> writePrimitiveType: aFullBlockClosure [

	^ self write: aFullBlockClosure inSubWriter: MOPrimitiveTypeWriter
]

{ #category : #writing }
MOArtefactWriter >> writeStructure: aBlock [

	^ self write: aBlock inSubWriter: MOStructureWriter
]
