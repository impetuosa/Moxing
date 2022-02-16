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
	writeBuilder addStatement: aMOVariable
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

	surface setAsParentOf: anEntity.
	surface
		perform: (messageToRegisterBlock ifNil: [ #block: ])
		withArguments: { anEntity }
]

{ #category : #initialization }
MOBlockWriter >> setAddingStatemntsAtFirst [
	writeBuilder  setAddingStatemntsAtFirst
]

{ #category : #generated }
MOBlockWriter >> statements: aCollection [

	writeBuilder statements: aCollection
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
	stmnt := self preWrite: aBlock inSubWriter: MODoUntilWriter.
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
	stmnt := self preWrite: aBlock inSubWriter: MOForWriter.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeForEach: aBlock [

	| stmnt |
	stmnt := self preWrite: aBlock inSubWriter: MOForEachWriter.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeIfElse: aBlock [

	| stmnt |
	stmnt := self preWrite: aBlock inSubWriter: MOIfElseWriter.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeLastStatement: aBlock [

	^ self addLastStatement:
		  (self immediatelyWrite: aBlock withWriter: MOStatementWriter)
]

{ #category : #enumerating }
MOBlockWriter >> writeSelect: aBlock [

	| stmnt |
	stmnt := self preWrite: aBlock inSubWriter: MOSelectWriter.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeStatement: aBlock [

	| stmnt |
	stmnt := self preWrite: aBlock inSubWriter: MOStatementWriter.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeTryCatch: aFullBlockClosure [ 
	| stmnt |
	stmnt := self preWrite: aFullBlockClosure inSubWriter: MOTryCatchWriter.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeVariable: aBlock [

	| stmnt |
	stmnt := self preWrite: aBlock inSubWriter: MOVariableWriter.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeWhile: aBlock [

	| stmnt |
	stmnt := self preWrite: aBlock inSubWriter: MOWhileWriter.
	^ stmnt
]
