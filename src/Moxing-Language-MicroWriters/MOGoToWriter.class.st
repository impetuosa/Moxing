Class {
	#name : #MOGoToWriter,
	#superclass : #MOAbstractStatementWriter,
	#category : #'Moxing-Language-MicroWriters-Statements'
}

{ #category : #visiting }
MOGoToWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitGoToWriter: self 


]

{ #category : #accessing }
MOGoToWriter >> destination: aMOAlceLabelReference [

	^ writeBuilder destination: aMOAlceLabelReference
]

{ #category : #initialization }
MOGoToWriter >> initializeWriteBuilder [

	writeBuilder := builder goToBuilder
]

{ #category : #initialization }
MOGoToWriter >> writeLabelReference: aBlock [

	writeBuilder destination:
		(self writeUnregisteredExpression: aBlock)
]
