Class {
	#name : #MOJavaLabelWriter,
	#superclass : #MOLabelWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #initialization }
MOJavaLabelWriter >> initializeWriteBuilder [

	writeBuilder := builder labelWithStatementBuilder
	
]
