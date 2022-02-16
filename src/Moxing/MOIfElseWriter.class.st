"
I do write if statements. This writer is used specially on updating structures 
"
Class {
	#name : #MOIfElseWriter,
	#superclass : #MOAbstractStatementWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #writing }
MOIfElseWriter >> condition: aConditionBlock [
	writeBuilder condition: (self writeExpression: aConditionBlock)
]

{ #category : #writing }
MOIfElseWriter >> initializeWriteBuilder [
	writeBuilder := builder ifStatementBuilder 
]

{ #category : #writing }
MOIfElseWriter >> setIfFalseBlock: aBlock [ 
	writeBuilder ifFalseBlock: aBlock
]

{ #category : #writing }
MOIfElseWriter >> setIfTrueBlock: aBlock [ 
	writeBuilder ifTrueBlock: aBlock
]

{ #category : #writing }
MOIfElseWriter >> writeBlock: aFullBlockClosure [ 

		^ self immediatelyWrite: aFullBlockClosure withWriter: MOBlockWriter.
		 
]

{ #category : #writing }
MOIfElseWriter >> writeIfFalseBlock: aBlock [

	^ self
		  preWrite: aBlock
		  inSubWriter: MOBlockWriter
		  initializeWith: [ :b | b messageToRegisterBlock: #setIfFalseBlock: ]
]

{ #category : #writing }
MOIfElseWriter >> writeIfTrueBlock: aBlock [

	^ self
		  preWrite: aBlock
		  inSubWriter: MOBlockWriter
		  initializeWith: [ :b | b messageToRegisterBlock: #setIfTrueBlock: ]
]

{ #category : #writing }
MOIfElseWriter >> writeStatement: aFullBlockClosure [ 
	self shouldBeImplemented.
]
