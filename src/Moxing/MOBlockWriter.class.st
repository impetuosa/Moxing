"
I write blocks
"
Class {
	#name : #MOBlockWriter,
	#superclass : #MOModelProceduralWriter,
	#instVars : [
		'messageToRegisterBlock'
	],
	#category : #'Moxing-MicroWriters'
}

{ #category : #adding }
MOBlockWriter >> addFirstStatement: aMOVariable [
	writeBuilder addFirstStatement: aMOVariable
]

{ #category : #adding }
MOBlockWriter >> addLastStatement: aMOVariable [
	writeBuilder addLastStatement: aMOVariable
]

{ #category : #adding }
MOBlockWriter >> addStatement: aMOVariable [

	^ writeBuilder addStatement: aMOVariable
]

{ #category : #adding }
MOBlockWriter >> addVariable: aMOVariable [

	^ self addStatement: aMOVariable
]

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
	surface
		perform: (messageToRegisterBlock ifNil: [ #block: ])
		withArguments: { anEntity }
]

{ #category : #initialization }
MOBlockWriter >> setAddingStatemntsAtFirst [
	writeBuilder  setAddingStatemntsAtFirst
]

{ #category : #generated }
MOBlockWriter >> statements [
self halt. 
	^ writeBuilder statements
]

{ #category : #generated }
MOBlockWriter >> statements: aCollection [

	writeBuilder statements: aCollection
]

{ #category : #writing }
MOBlockWriter >> writReturn: aBlock [

	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOReturnWriter.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeAndAddStatement: aBlock [

	| stmnt |
	stmnt := self immediatelyWrite: aBlock withWriter: MOStatementWriter.
	self addStatement: stmnt.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeBlock: aFullBlockClosure [
	^ aFullBlockClosure value: self
]

{ #category : #writing }
MOBlockWriter >> writeDoUntil: aBlock [

	| stmnt |
	stmnt := self write: aBlock inSubWriter: MODoUntilWriter.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeExpressionStatement: aFullBlockClosure [

	| stmnt |
	stmnt := self
		         write: aFullBlockClosure
		         inSubWriter: MOStatementExpressionWriter.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeFirstStatement: aBlock [

	^ self addFirstStatement:
		  (self immediatelyWrite: aBlock withWriter: MOStatementWriter)
]

{ #category : #writing }
MOBlockWriter >> writeFor: aBlock [

	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOForWriter.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeForEach: aBlock [

	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOForEachWriter.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeGoTo: aBlock [

	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOGoToWriter.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeIfElse: aBlock [

	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOIfElseWriter.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeLabel: aBlock [

	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOLabelWriter.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeLastStatement: aBlock [

	^ self addLastStatement:
		  (self immediatelyWrite: aBlock withWriter: MOStatementWriter)
]

{ #category : #writing }
MOBlockWriter >> writeOnErrorGoTo: aFullBlockClosure [ 
	| stmnt |
	stmnt := self write: aFullBlockClosure inSubWriter: MOOnErrorWriter.
	^ stmnt

]

{ #category : #writing }
MOBlockWriter >> writeResume: aBlock [

	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOResumeWriter.
	^ stmnt
]

{ #category : #enumerating }
MOBlockWriter >> writeSelect: aBlock [

	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOSelectWriter.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeSetToReturn: aFullBlockClosure [ 
	
	| stmnt |
	stmnt := self write: aFullBlockClosure inSubWriter: MOSetToReturnWriter.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeStatement: aBlock [

	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOStatementWriter.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeTryCatch: aFullBlockClosure [ 
	| stmnt |
	stmnt := self write: aFullBlockClosure inSubWriter: MOTryCatchWriter.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeVariable: aBlock [

	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOVariableWriter.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeWhile: aBlock [

	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOWhileWriter.
	^ stmnt
]
