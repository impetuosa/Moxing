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

{ #category : #visiting }
MOBlockWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitBlockWriter: self 


]

{ #category : #adding }
MOBlockWriter >> addFirstStatement: aMOVariable [
	writeBuilder addFirstStatement: aMOVariable
]

{ #category : #adding }
MOBlockWriter >> addLastStatement: aMOVariable [
	writeBuilder addLastStatement: aMOVariable
]

{ #category : #adding }
MOBlockWriter >> addLocalVariable: aMOLocalVariable [

	writeBuilder addLocalVariable: aMOLocalVariable
]

{ #category : #adding }
MOBlockWriter >> addLocalVariableOnTop: aMOLocalVariable [

	writeBuilder addFirstStatement: aMOLocalVariable
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
	^ writeBuilder statements
]

{ #category : #generated }
MOBlockWriter >> statements: aCollection [

	writeBuilder statements: aCollection
]

{ #category : #writing }
MOBlockWriter >> writeAndAddStatement: aBlock [

	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOStatementWriter.
	self addStatement: stmnt.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeBlock: aFullBlockClosure [
	^ aFullBlockClosure value: self
]

{ #category : #writing }
MOBlockWriter >> writeComment: aFullBlockClosure [
  | stmnt |
  stmnt := self write: aFullBlockClosure inSubWriter: MOCommentWriter.
  ^stmnt
]

{ #category : #writing }
MOBlockWriter >> writeDoUntil: aBlock [

	| stmnt |
	stmnt := self write: aBlock inSubWriter: MODoUntilWriter.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeExit: aFullBlockClosure [ 

	| stmnt |
	stmnt := self write: aFullBlockClosure inSubWriter: MOExitWriter .
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
		  (self write: aBlock inSubWriter: MOStatementWriter)
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
MOBlockWriter >> writeForNext: aBlock [

	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOForNextWriter.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeGoSub: aBlock [

	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOGoSubWriter.
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
		  (self write: aBlock inSubWriter: MOStatementWriter)
]

{ #category : #writing }
MOBlockWriter >> writeOnErrorGoTo: aFullBlockClosure [ 
	| stmnt |
	stmnt := self write: aFullBlockClosure inSubWriter: MOOnErrorGoToWriter.
	^ stmnt

]

{ #category : #writing }
MOBlockWriter >> writeOnErrorResumeNext: aFullBlockClosure [ 
	| stmnt |
	stmnt := self write: aFullBlockClosure inSubWriter: MOOnErrorResumeNextWriter.
	^ stmnt

]

{ #category : #writing }
MOBlockWriter >> writeRedimVariable: aBlock [

	| stmnt |
	stmnt := self write: aBlock inSubWriter: MORedimVariableWriter.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeResume: aBlock [

	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOResumeWriter.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeReturn: aBlock [

	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOReturnWriter.
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

{ #category : #writing }
MOBlockWriter >> writeWith: aFullBlockClosure [

	| stmnt |
	stmnt := self write: aFullBlockClosure inSubWriter: MOWithWriter.
	^ stmnt
]
