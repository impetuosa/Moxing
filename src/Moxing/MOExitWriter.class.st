Class {
	#name : #MOExitWriter,
	#superclass : #MOAbstractStatementWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #initialization }
MOExitWriter >> initializeWriteBuilder [ 
	writeBuilder := builder exitBuilder
]
