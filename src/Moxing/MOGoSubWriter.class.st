Class {
	#name : #MOGoSubWriter,
	#superclass : #MOGoToWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #initialization }
MOGoSubWriter >> acceptWritingVisitor: aVisitor [

	^ aVisitor visitGoSubWriter: self
]

{ #category : #accessing }
MOGoSubWriter >> destination: aMOAlceLabelReference [

	^ writeBuilder destination: aMOAlceLabelReference
]

{ #category : #initialization }
MOGoSubWriter >> initializeWriteBuilder [

	writeBuilder := builder goSubBuilder
]
