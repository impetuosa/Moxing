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
	writeBuilder condition: aConditionBlock 
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
MOIfElseWriter >> writeCondition: aConditionBlock [
	writeBuilder condition: (self writeExpression: aConditionBlock)
]

{ #category : #writing }
MOIfElseWriter >> writeCopyOf: aProvenanceEntity readingValues: aChildDelegateLoadingBlock [

	self writeCondition: [ :expr | 
		aChildDelegateLoadingBlock
			cull: expr
			cull: aProvenanceEntity condition ].
	self setIfTrueBlock:
		(aChildDelegateLoadingBlock
			 cull: self
			 cull: aProvenanceEntity ifTrue).
	self setIfFalseBlock: (aChildDelegateLoadingBlock
			 cull: self
			 cull: aProvenanceEntity ifFalse)
]

{ #category : #writing }
MOIfElseWriter >> writeIfFalseBlock: aBlock [

	^ self
		  write: aBlock
		  inSubWriter: MOBlockWriter
		  initializeWith: [ :b | b messageToRegisterBlock: #setIfFalseBlock: ]
]

{ #category : #writing }
MOIfElseWriter >> writeIfTrueBlock: aBlock [

	^ self
		  write: aBlock
		  inSubWriter: MOBlockWriter
		  initializeWith: [ :b | b messageToRegisterBlock: #setIfTrueBlock: ]
]
