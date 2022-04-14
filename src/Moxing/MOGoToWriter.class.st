Class {
	#name : #MOGoToWriter,
	#superclass : #MOAbstractStatementWriter,
	#instVars : [
		'caseExpression'
	],
	#category : #'Moxing-MicroWriters'
}

{ #category : #initialization }
MOGoToWriter >> initializeWriteBuilder [

	writeBuilder := builder goToBuilder
]

{ #category : #initialization }
MOGoToWriter >> writeLabelReference: aBlock [

	writeBuilder labelReference: (self writeExpression: aBlock)
]
