Class {
	#name : #MOOnErrorGoToWriter,
	#superclass : #MOAbstractStatementWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #accessing }
MOOnErrorGoToWriter >> destination: aMOAlceLabelReference [ 
	writeBuilder destination: aMOAlceLabelReference 
]

{ #category : #writing }
MOOnErrorGoToWriter >> initializeWriteBuilder [
	writeBuilder := builder onErrorBuilder
]
