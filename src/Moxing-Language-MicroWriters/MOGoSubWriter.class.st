Class {
	#name : #MOGoSubWriter,
	#superclass : #MOGoToWriter,
	#category : #'Moxing-Language-MicroWriters'
}

{ #category : #initialization }
MOGoSubWriter >> acceptWritingVisitor: aVisitor [

	^ aVisitor visitGoSubWriter: self
]

{ #category : #initialization }
MOGoSubWriter >> initializeWriteBuilder [

	writeBuilder := builder goSubBuilder
]
