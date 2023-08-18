Class {
	#name : #MOLabelWriter,
	#superclass : #MOAbstractStatementWriter,
	#category : #'Moxing-Language-MicroWriters'
}

{ #category : #visiting }
MOLabelWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitLabelWriter: self 


]

{ #category : #writing }
MOLabelWriter >> initializeWriteBuilder [

	writeBuilder := builder labelBuilder
	
]

{ #category : #writing }
MOLabelWriter >> name: aName [

	writeBuilder name: aName
]