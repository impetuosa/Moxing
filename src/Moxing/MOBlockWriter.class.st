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

	surface perform: messageToRegisterBlock withArguments: { anEntity }.
	anEntity parent: surface
]

{ #category : #writing }
MOBlockWriter >> writeStatement: aBlock [

	self preWrite: aBlock inSubWriter: MOStatementWriter
]

{ #category : #writing }
MOBlockWriter >> writeVariable: aBlock [

	self preWrite: aBlock inSubWriter: MOVariableWriter
]
