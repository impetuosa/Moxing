Class {
	#name : #MOProjectWriter,
	#superclass : #MOArtefactWriter,
	#category : #'Moxing-Language-MicroWriters-Declarations'
}

{ #category : #visiting }
MOProjectWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitProjectWriter: self 


]

{ #category : #writing }
MOProjectWriter >> initializeWriteBuilder [

	writeBuilder := builder projectBuilder
]
