Class {
	#name : #MOAngularJsSchemaWriter,
	#superclass : #MOModelProceduralWriter,
	#traits : 'MOHoldsTypeReferences',
	#classTraits : 'MOHoldsTypeReferences classTrait',
	#category : #'Moxing-AngularJS-MicroWriters'
}

{ #category : #'as yet unclassified' }
MOAngularJsSchemaWriter >> acceptWritingVisitor: aVisitor [

	^ aVisitor visitAngularJsSchemaWriter: self
]

{ #category : #accessing }
MOAngularJsSchemaWriter >> directory: aFileReference [

	writeBuilder  directory: aFileReference
]

{ #category : #writing }
MOAngularJsSchemaWriter >> initializeWriteBuilder [

	writeBuilder := builder angularjsSchemaComponentBuilder 
]

{ #category : #accessing }
MOAngularJsSchemaWriter >> metadata: aCollection [

	writeBuilder metadata: aCollection
]

{ #category : #writing }
MOAngularJsSchemaWriter >> privateWriteToSurface: anEntity [

	surface addAngularJsSchema: anEntity
]

{ #category : #writing }
MOAngularJsSchemaWriter >> writeAngularJsModule: aFullBlockClosure [ 
	self shouldBeImplemented.
]

{ #category : #writing }
MOAngularJsSchemaWriter >> writeAngularJsProject: aFullBlockClosure [

	^ self write: aFullBlockClosure inSubWriter: MOAngularJsProjectWriter
]
