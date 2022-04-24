Class {
	#name : #MOQueryWriter,
	#superclass : #MOClassWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #visiting }
MOQueryWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitQueryWriter: self 


]

{ #category : #initialization }
MOQueryWriter >> initializeWriteBuilder [
	writeBuilder := builder queryBuilder
]
