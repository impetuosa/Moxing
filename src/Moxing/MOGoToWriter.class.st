Class {
	#name : #MOGoToWriter,
	#superclass : #MOAbstractStatementWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #visiting }
MOGoToWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitGoToWriter: self 


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
