Class {
	#name : #MOLabelWithStatementWriter,
	#superclass : #MOLabelWriter,
	#category : #'Moxing-Language-MicroWriters-Statements'
}

{ #category : #adding }
MOLabelWithStatementWriter >> addStatement: aMOWhile [

	self statement: aMOWhile
]

{ #category : #initialization }
MOLabelWithStatementWriter >> initializeWriteBuilder [

	writeBuilder := builder labelWithStatementBuilder
	
]

{ #category : #accessing }
MOLabelWithStatementWriter >> label: aString [

	^ writeBuilder label: aString
]

{ #category : #generated }
MOLabelWithStatementWriter >> statement: aMOWhile [

	^ writeBuilder statement: aMOWhile
]

{ #category : #initialization }
MOLabelWithStatementWriter >> writeStatement: aBlock [

	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOStatementWriter.
	^ stmnt
	
]
