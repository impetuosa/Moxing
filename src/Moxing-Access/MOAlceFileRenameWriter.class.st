Class {
	#name : #MOAlceFileRenameWriter,
	#superclass : #MOAbstractStatementWriter,
	#category : #'Moxing-Access-MicroWriters'
}

{ #category : #visiting }
MOAlceFileRenameWriter >> acceptWritingVisitor: aVisitor [

	^ aVisitor visitFileRenameWriter: self
]

{ #category : #initialization }
MOAlceFileRenameWriter >> initializeWriteBuilder [

	writeBuilder := builder fileRenameBuilder
]

{ #category : #'instance creation' }
MOAlceFileRenameWriter >> newNameReference: aMOVariableReference [

	^ writeBuilder newNameReference: aMOVariableReference
]

{ #category : #accessing }
MOAlceFileRenameWriter >> oldNameReference: aMOVariableReference [

	^ writeBuilder oldNameReference: aMOVariableReference
]
