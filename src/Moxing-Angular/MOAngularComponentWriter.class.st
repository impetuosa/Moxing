Class {
	#name : #MOAngularComponentWriter,
	#superclass : #MOModelProceduralWriter,
	#traits : 'MOHoldsTypeReferences',
	#classTraits : 'MOHoldsTypeReferences classTrait',
	#category : #'Moxing-Angular-Building'
}

{ #category : #visiting }
MOAngularComponentWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitComponentWriter: self 


]

{ #category : #adding }
MOAngularComponentWriter >> addDeclarationUnit: aMODeclarationUnit [

	writeBuilder behavior: aMODeclarationUnit
]

{ #category : #generated }
MOAngularComponentWriter >> css: anAngularDocument [ 
	writeBuilder css: anAngularDocument
]

{ #category : #writing }
MOAngularComponentWriter >> initializeWriteBuilder [

	writeBuilder := builder angularComponentBuilder
]

{ #category : #writing }
MOAngularComponentWriter >> privateWriteToSurface: anEntity [

	surface addAngularComponent: anEntity
]

{ #category : #generated }
MOAngularComponentWriter >> template: anAngularDocument [ 
	writeBuilder template: anAngularDocument 
]

{ #category : #writing }
MOAngularComponentWriter >> writeClass: aFullBlockClosure [ 

	^ self write: aFullBlockClosure inSubWriter: MOClassWriter
]

{ #category : #writing }
MOAngularComponentWriter >> writeCssDocument: aBlock [

	^ self write: aBlock inSubWriter: MOAngularCssDocumentWriter
]

{ #category : #writing }
MOAngularComponentWriter >> writeDeclarationUnit: aBlock [

	^ self write: aBlock inSubWriter: MODeclarationUnitWriter
]

{ #category : #writing }
MOAngularComponentWriter >> writeTemplateDocument: aBlock [

	^ self write: aBlock inSubWriter: MOAngularTemplateDocumentWriter
]
