Class {
	#name : #MOGoSubWriter,
	#superclass : #MOGoToWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #initialization }
MOGoSubWriter >> acceptWritingVisitor: aVisitor [

	^ aVisitor visitGoSubWriter: self
]

{ #category : #initialization }
MOGoSubWriter >> initializeWriteBuilder [

	writeBuilder := builder goSubBuilder
]
