Class {
	#name : #MOOnErrorWriter,
	#superclass : #MOAbstractStatementWriter,
	#instVars : [
		'caseExpression'
	],
	#category : #'Moxing-MicroWriters'
}

{ #category : #accessing }
MOOnErrorWriter >> destination: aMOAlceLabelReference [ 
	writeBuilder destination: aMOAlceLabelReference 
]

{ #category : #writing }
MOOnErrorWriter >> initializeWriteBuilder [
	writeBuilder := builder onErrorBuilder
]
