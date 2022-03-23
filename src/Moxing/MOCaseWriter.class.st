Class {
	#name : #MOCaseWriter,
	#superclass : #MOAbstractStatementWriter,
	#instVars : [
		'caseExpression'
	],
	#category : #'Moxing-MicroWriters'
}

{ #category : #accessing }
MOCaseWriter >> block: aMOBlock [

	writeBuilder block: aMOBlock
]

{ #category : #generated }
MOCaseWriter >> expressions [

	^ writeBuilder expressions
]

{ #category : #writing }
MOCaseWriter >> initializeWriteBuilder [
	writeBuilder := builder caseBuilder 
]

{ #category : #writing }
MOCaseWriter >> privateWriteToSurface: anEntity [
	surface addCase: anEntity

]

{ #category : #accessing }
MOCaseWriter >> writeBlock: aBlock [

	^ self
		  write: aBlock
		  inSubWriter: MOBlockWriter
		  initializeWith: [ :b | b messageToRegisterBlock: #block: ]
]

{ #category : #accessing }
MOCaseWriter >> writeCaseExpression: aConditionBlock [

	writeBuilder expressions:
		(self writeUnregisteredExpression: aConditionBlock)
]
