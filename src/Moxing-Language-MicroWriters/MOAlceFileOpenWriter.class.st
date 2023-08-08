Class {
	#name : #MOAlceFileOpenWriter,
	#superclass : #MOAbstractStatementWriter,
	#category : #'Moxing-Language-MicroWriters'
}

{ #category : #visiting }
MOAlceFileOpenWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitFileOpenWriter: self 


]

{ #category : #accessing }
MOAlceFileOpenWriter >> fileDescriptorReference: aMOVariableReference [

	^ writeBuilder fileDescriptorReference: aMOVariableReference
]

{ #category : #accessing }
MOAlceFileOpenWriter >> filePathReference: aMOStatementExpression [

	^ writeBuilder filePathReference: aMOStatementExpression
]

{ #category : #initialization }
MOAlceFileOpenWriter >> initializeWriteBuilder [

	writeBuilder := builder fileOpenBuilder
]

{ #category : #accessing }
MOAlceFileOpenWriter >> kind: aString [

	^ writeBuilder kind: aString
]
