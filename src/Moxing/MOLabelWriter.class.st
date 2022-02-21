Class {
	#name : #MOLabelWriter,
	#superclass : #MOAbstractStatementWriter,
	#instVars : [
		'caseExpression'
	],
	#category : #'Moxing-MicroWriters'
}

{ #category : #writing }
MOLabelWriter >> initializeWriteBuilder [

	writeBuilder := builder labelBuilder
	
]

{ #category : #writing }
MOLabelWriter >> name: aName [

	writeBuilder name: aName
]
