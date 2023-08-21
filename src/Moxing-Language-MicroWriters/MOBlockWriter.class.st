"
I write blocks
"
Class {
	#name : #MOBlockWriter,
	#superclass : #MOModelProceduralWriter,
	#instVars : [
		'messageToRegisterBlock'
	],
	#category : #'Moxing-Language-MicroWriters-Declarations'
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

{ #category : #expressions }
MOBlockWriter >> invokeMethodNamed: aString receiver: anExpressionBuildingBlock arguments: anOtherExpressionBuildingBlock [

	^ self writeStatement: [ :stmt | 
		  stmt
			  invokeMethodNamed: aString
			  receiver: anExpressionBuildingBlock
			  arguments: anOtherExpressionBuildingBlock ]
]

{ #category : #writing }
MOBlockWriter >> messageToRegisterBlock: aSymbol [

	messageToRegisterBlock := aSymbol asSymbol
]

{ #category : #writing }
MOBlockWriter >> privateWriteToSurface: anEntity [
	surface
		perform: (messageToRegisterBlock ifNil: [ #block: ])
		withArguments: { anEntity }
]

{ #category : #removing }
MOBlockWriter >> remove: aMOAlceExit [

	writeBuilder remove: aMOAlceExit
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

	<doc: 'Writes comment within a the context of a block.'>
	| stmnt |
	stmnt := self write: aFullBlockClosure inSubWriter: MOCommentWriter.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeDoUntil: aBlock [
	<doc: 'Writes do-until within a the context of a block.'>
	| stmnt |
	stmnt := self write: aBlock inSubWriter: MODoUntilWriter.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeDoWhile: aBlock [
	<doc: 'Writes do-while within a the context of a block.'>
	| stmnt |
	stmnt := self write: aBlock inSubWriter: MODoWhileWriter.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeExit: aFullBlockClosure [ 
	<doc: 'Writes exit within a the context of a block.'>
	| stmnt |
	stmnt := self write: aFullBlockClosure inSubWriter: MOExitWriter .
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeExpressionStatement: aFullBlockClosure [

	<doc: 'Writes expression within a the context of a block.'>
	| stmnt |
	stmnt := self
		         write: aFullBlockClosure
		         inSubWriter: MOStatementExpressionWriter.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeFirstStatement: aBlock [
	<doc: 'Writes the first statement within a the context of a block.'>
	^ self addFirstStatement:
		  (self write: aBlock inSubWriter: MOStatementWriter)
]

{ #category : #writing }
MOBlockWriter >> writeFor: aBlock [

	<doc: 'Writes for within a the context of a block.'>
	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOForWriter.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeForEach: aBlock [

	<doc: 'Writes for-each within a the context of a block.'>
	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOForEachWriter.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeForNext: aBlock [

	<doc: 'Writes for-next within a the context of a block.'>
	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOForNextWriter.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeGoSub: aBlock [
	<doc: 'Writes go-sub within a the context of a block.'>
	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOGoSubWriter.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeGoTo: aBlock [

	<doc: 'Writes go-to within a the context of a block.'>
	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOGoToWriter.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeIfElse: aBlock [
	<doc: 'Writes IF within a the context of a block.'>
	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOIfElseWriter.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeLabel: aBlock [
	<doc: 'Writes label within a the context of a block.'>
	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOLabelWriter.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeLastStatement: aBlock [
	<doc: 'Writes the last statement within a the context of a block.'>
	^ self addLastStatement:
		  (self write: aBlock inSubWriter: MOStatementWriter)
]

{ #category : #writing }
MOBlockWriter >> writeOnErrorGoTo: aFullBlockClosure [

	<doc: 'Writes on-error-go-to within a the context of a block.'>
	| stmnt |
	stmnt := self
		         write: aFullBlockClosure
		         inSubWriter: MOOnErrorGoToWriter.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeOnErrorResumeNext: aFullBlockClosure [ 
	<doc: 'Writes on-error-resume-next within a the context of a block.'>
	| stmnt |
	stmnt := self write: aFullBlockClosure inSubWriter: MOOnErrorResumeNextWriter.
	^ stmnt

]

{ #category : #writing }
MOBlockWriter >> writeRedimVariable: aBlock [
	<doc: 'Writes ReDim within a the context of a block.'>
	| stmnt |
	stmnt := self write: aBlock inSubWriter: MORedimVariableWriter.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeResume: aBlock [
	<doc: 'Writes resume within a the context of a block.'>
	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOResumeWriter.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeReturn: aBlock [
	<doc: 'Writes return within a the context of a block.'>
	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOReturnWriter.
	^ stmnt
]

{ #category : #enumerating }
MOBlockWriter >> writeSelect: aBlock [
	<doc: 'Writes select within a the context of a block.'>
	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOSelectWriter.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeSetToReturn: aFullBlockClosure [

	<doc: 'Writes set-to-return within a the context of a block.'>
	| stmnt |
	stmnt := self
		         write: aFullBlockClosure
		         inSubWriter: MOSetToReturnWriter.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeStatement: aBlock [
	<doc: 'Writes statement within a the context of a block.'>
	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOStatementWriter.
	^ stmnt
]

{ #category : #enumerating }
MOBlockWriter >> writeStatementDeclaration: aBlock [

	<doc: 'Writes statement-declaration within a the context of a block.'>
	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOStatementDeclarationWriter.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeTryCatch: aFullBlockClosure [ 
	<doc: 'Writes try-catch within a the context of a block.'>
	| stmnt |
	stmnt := self write: aFullBlockClosure inSubWriter: MOTryCatchWriter.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeVariable: aBlock [

	<doc: 'Writes variable within a the context of a block.'>
	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOVariableWriter.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeWhile: aBlock [
	<doc: 'Writes while within a the context of a block.'>
	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOWhileWriter.
	^ stmnt
]

{ #category : #writing }
MOBlockWriter >> writeWith: aFullBlockClosure [

	<doc: 'Writes with within a the context of a block.'>
	| stmnt |
	stmnt := self write: aFullBlockClosure inSubWriter: MOWithWriter.
	^ stmnt
]
