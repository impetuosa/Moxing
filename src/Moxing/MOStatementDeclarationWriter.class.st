Class {
	#name : #MOStatementDeclarationWriter,
	#superclass : #MOAbstractStatementWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #'as yet unclassified' }
MOStatementDeclarationWriter >> acceptWritingVisitor: aVisitor [

	^ aVisitor visitStatementDeclarationWriter: self
]

{ #category : #adding }
MOStatementDeclarationWriter >> addClass: aMOJavaClass [

	writeBuilder declaration: aMOJavaClass.
	
]

{ #category : #initialization }
MOStatementDeclarationWriter >> initializeWriteBuilder [

	writeBuilder := builder statementDeclarationBuilder
]

{ #category : #writing }
MOStatementDeclarationWriter >> privateWriteToSurface: anEntity [

	^ surface addStatement: anEntity
]

{ #category : #writing }
MOStatementDeclarationWriter >> writeJavaClass: aBlock [

	^ self write: aBlock inSubWriter: MOJavaClassWriter
]

{ #category : #writing }
MOStatementDeclarationWriter >> writeJavaClassType: aBlock [

	^ self write: aBlock inSubWriter: MOJavaClassTypeWriter
]
