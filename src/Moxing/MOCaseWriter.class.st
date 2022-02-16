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

{ #category : #accessing }
MOCaseWriter >> caseExpression: aConditionBlock [

	writeBuilder caseExpression: (self writeExpression: aConditionBlock)
]

{ #category : #writing }
MOCaseWriter >> initializeWriteBuilder [
	writeBuilder := builder caseBuilder 
]

{ #category : #writing }
MOCaseWriter >> privateWriteToSurface: anEntity [
	surface setAsParentOf: anEntity .
	surface addCase: anEntity

]

{ #category : #accessing }
MOCaseWriter >> writeBlock: aBlock [

	^ self
		  preWrite: aBlock
		  inSubWriter: MOBlockWriter
		  initializeWith: [ :b | b messageToRegisterBlock: #block: ]
]
