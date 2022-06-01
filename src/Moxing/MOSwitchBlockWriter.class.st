Class {
	#name : #MOSwitchBlockWriter,
	#superclass : #MOAbstractStatementWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #'as yet unclassified' }
MOSwitchBlockWriter >> acceptWritingVisitor: aVisitor [

	^ aVisitor visitSwitchBlockWriter: self
]

{ #category : #initialization }
MOSwitchBlockWriter >> initializeWriteBuilder [

	writeBuilder := builder switchBlockBuilder 
]
