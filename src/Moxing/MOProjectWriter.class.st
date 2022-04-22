Class {
	#name : #MOProjectWriter,
	#superclass : #MOArtefactWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #visiting }
MOProjectWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitProjectWriter: self 


]

{ #category : #writing }
MOProjectWriter >> initializeWriteBuilder [

	writeBuilder := builder projectBuilder
]
