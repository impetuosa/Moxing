Class {
	#name : #MOOnErrorGoToWriter,
	#superclass : #MOAbstractStatementWriter,
	#category : #'Moxing-Language-MicroWriters-Statements'
}

{ #category : #visiting }
MOOnErrorGoToWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitToWriter: self 


]

{ #category : #accessing }
MOOnErrorGoToWriter >> destination: aMOAlceLabelReference [ 
	writeBuilder destination: aMOAlceLabelReference 
]

{ #category : #writing }
MOOnErrorGoToWriter >> initializeWriteBuilder [
	writeBuilder := builder onErrorBuilder
]

{ #category : #accessing }
MOOnErrorGoToWriter >> writeDestination: aBlock [

	self destination: (self writeUnregisteredExpression: aBlock)
]
