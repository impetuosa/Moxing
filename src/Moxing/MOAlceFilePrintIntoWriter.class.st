Class {
	#name : #MOAlceFilePrintIntoWriter,
	#superclass : #MOAbstractStatementWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #visiting }
MOAlceFilePrintIntoWriter >> acceptWritingVisitor: aVisitor [

	^ aVisitor visitFilePrintIntoWriter: self
]

{ #category : #accessing }
MOAlceFilePrintIntoWriter >> fileDescriptorReference: aMOVariableReference [

	^ writeBuilder fileDescriptorReference: aMOVariableReference
]

{ #category : #initialization }
MOAlceFilePrintIntoWriter >> initializeWriteBuilder [

	writeBuilder := builder filePrintIntoBuilder
]

{ #category : #accessing }
MOAlceFilePrintIntoWriter >> printingReferences: aCollection [

	^ writeBuilder printingReferences: aCollection
]
