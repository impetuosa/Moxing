Class {
	#name : #MOFormWriter,
	#superclass : #MOClassWriter,
	#category : #'Moxing-Language-MicroWriters'
}

{ #category : #visiting }
MOFormWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitFormWriter: self 


]

{ #category : #initialization }
MOFormWriter >> initializeWriteBuilder [
	writeBuilder := builder formBuilder
]
