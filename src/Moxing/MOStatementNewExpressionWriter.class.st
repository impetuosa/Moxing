Class {
	#name : #MOStatementNewExpressionWriter,
	#superclass : #MOStatementWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #generated }
MOStatementNewExpressionWriter >> arguments: aCollection [

	writeBuilder arguments: aCollection
]

{ #category : #writing }
MOStatementNewExpressionWriter >> initializeWriteBuilder [

	writeBuilder := builder newExpressionBuilder
]

{ #category : #accessing }
MOStatementNewExpressionWriter >> typeReference: aMOTypeReference [

	writeBuilder typeReference: aMOTypeReference
]
