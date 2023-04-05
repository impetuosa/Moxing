Class {
	#name : #MOAngularJsProjectWriter,
	#superclass : #MOModelProceduralWriter,
	#traits : 'MOHoldsTypeReferences',
	#classTraits : 'MOHoldsTypeReferences classTrait',
	#category : #'Moxing-AngularJS-MicroWriters'
}

{ #category : #initialization }
MOAngularJsProjectWriter >> acceptWritingVisitor: aVisitor [

	^ aVisitor visitAngularJsProjectWriter: self
]

{ #category : #adding }
MOAngularJsProjectWriter >> addDeclarationUnit: aMODeclarationUnit [

	writeBuilder addDeclarationUnit: aMODeclarationUnit
]

{ #category : #accessing }
MOAngularJsProjectWriter >> directory: aFileReference [

	writeBuilder directory: aFileReference
]

{ #category : #initialization }
MOAngularJsProjectWriter >> initializeWriteBuilder [

	writeBuilder := builder angularjsProjectComponentBuilder 
]

{ #category : #initialization }
MOAngularJsProjectWriter >> privateWriteToSurface: anEntity [

	surface addAngularJsProject: anEntity
]

{ #category : #writing }
MOAngularJsProjectWriter >> writeDeclarationUnit: aBlock [

	^ self write: aBlock inSubWriter: MODeclarationUnitWriter
]
