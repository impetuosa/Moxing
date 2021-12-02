Class {
	#name : #MOBlockWriter,
	#superclass : #MOModelProceduralWriter,
	#instVars : [
		'messageToRegisterBlock'
	],
	#category : #'Moxing-MicroWriters'
}

{ #category : #writing }
MOBlockWriter >> initializeWriteBuilder [

	writeBuilder := builder blockBuilder
]

{ #category : #writing }
MOBlockWriter >> messageToRegisterBlock: aSymbol [

	messageToRegisterBlock := aSymbol asSymbol
]

{ #category : #writing }
MOBlockWriter >> privateSetAnchor: anEntity [

	anEntity anchor:
		surface anchor
		/ (messageToRegisterBlock copyReplaceAll: ':' with: '') / #block
]

{ #category : #writing }
MOBlockWriter >> privateWriteToSurface: anEntity [

	surface setAsParentOf: anEntity.
	surface perform: messageToRegisterBlock withArguments: { anEntity }
]

{ #category : #writing }
MOBlockWriter >> writeMethodInvocation: aFullBlockClosure [ 


	^ self
		  preWrite: aFullBlockClosure
		  inSubWriter: MOStatementMethodInvocationWriter 
]

{ #category : #writing }
MOBlockWriter >> writeNewExpression: aFullBlockClosure [

	^ self
		  preWrite: aFullBlockClosure
		  inSubWriter: MOStatementNewExpressionWriter
]

{ #category : #writing }
MOBlockWriter >> writeReturnStatement: aFullBlockClosure [ 
	^ self
		  preWrite: aFullBlockClosure
		  inSubWriter: MOStatementReturnWriter 
]

{ #category : #writing }
MOBlockWriter >> writeStatement: aBlock [

	self preWrite: aBlock inSubWriter: MOStatementWriter
]

{ #category : #writing }
MOBlockWriter >> writeVariable: aBlock [

	self preWrite: aBlock inSubWriter: MOVariableWriter
]
