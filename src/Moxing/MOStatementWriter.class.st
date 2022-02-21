"
I am a statement writer. 
I unify the builder api. 
I do not inform the statements to my aprent writer. I am mostlikely to work as a leaf writer .
"
Class {
	#name : #MOStatementWriter,
	#superclass : #MOAbstractStatementWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #'as yet unclassified' }
MOStatementWriter >> attributeAccess: aCollection [ 
	self shouldBeImplemented.
]

{ #category : #writing }
MOStatementWriter >> build [

	^ writeResult ifNil: [ self error: ' Un expected' ]
]

{ #category : #'as yet unclassified' }
MOStatementWriter >> caseExpressions: anExpressionBlock do: aBlockwriginBlock [

	^ builder caseBuilder
		  expressions: (self writeExpression: anExpressionBlock);
		  block: (self writeBlock: aBlockwriginBlock);
		  build
]

{ #category : #expressions }
MOStatementWriter >> compare: aMOIntegerLiteral is: aString than: aFullBlockClosure [

	^ self registerStatement: (self writeExpression: [ :e | 
			   e compare: aMOIntegerLiteral is: aString than: aFullBlockClosure ])
]

{ #category : #statements }
MOStatementWriter >> do: aLoopingBlock until: aConditionBlock [

	^ self registerStatement: (builder loopStatementBuilder
			   forDoUntil;
			   condition: (self writeExpression: aConditionBlock);
			   loopingBlock: (self writeBlock: aLoopingBlock);
			   build)
]

{ #category : #statements }
MOStatementWriter >> exit [

	^ self registerStatement: builder buildExit
]

{ #category : #statements }
MOStatementWriter >> for: anInitBlock condition: aConditionBlock update: anUpdateBlock do: aLoopingBlock [

	" for ( initBlock; conditionBlock; updateBlock) loopingBlock "

	^ self registerStatement: (builder forStatementBuilder
			   initializeOperation: (self writeExpression: anInitBlock);
			   updateOperation: (self writeExpression: anUpdateBlock);
			   condition: (self writeExpression: aConditionBlock);
			   loopingBlock: (self writeBlock: aLoopingBlock);
			   build)
]

{ #category : #statements }
MOStatementWriter >> for: anEachBlock in: anCollectionBlock do: aLoopingBlock [

	^ self registerStatement: (builder forEachStatementBuilder
			   each: (self writeExpression: anEachBlock);
			   collection: (self writeExpression: anCollectionBlock);
			   loopingBlock: (self writeBlock: aLoopingBlock);
			   build)
]

{ #category : #statements }
MOStatementWriter >> if: aConditionBlock ifFalse: ifFalseBlock [

	^ self
		  if: aConditionBlock
		  ifTrue: [ :ifTrueBlock |  ]
		  ifFalse: ifFalseBlock
]

{ #category : #statements }
MOStatementWriter >> if: aConditionBlock ifTrue: ifTrueBlock [

	^ self
		  if: aConditionBlock
		  ifTrue: ifTrueBlock
		  ifFalse: [ :ifFalseBlock |  ]
]

{ #category : #statements }
MOStatementWriter >> if: aConditionBlock ifTrue: ifTrueBlock ifFalse: ifFalseBlock [

	^ self registerStatement: (builder ifStatementBuilder
			   condition: (self writeExpression: aConditionBlock);
			   ifTrueBlock: (self writeBlock: ifTrueBlock);
			   ifFalseBlock: (self writeBlock: ifFalseBlock);
			   build)
]

{ #category : #initialization }
MOStatementWriter >> initializeWriteBuilder [

]

{ #category : #expressions }
MOStatementWriter >> installCopyingBuilder [

	self error:
		'This writer is a helper syntax sugar. useless for copying '
]

{ #category : #initialization }
MOStatementWriter >> invocation: aString arguments: anExpressionBuildingBlock [

	^ self registerStatement: (self writeExpression: [ :exp | 
			   exp invocation: aString arguments: anExpressionBuildingBlock ])
]

{ #category : #expressions }
MOStatementWriter >> invokeMethodNamed: aString receiver: anExpressionBuildingBlock [

	^ self registerStatement: (self writeExpression: [ :exp | 
			   exp
				   invokeMethodNamed: aString
				   receiver: anExpressionBuildingBlock ])
]

{ #category : #expressions }
MOStatementWriter >> invokeMethodNamed: aString receiver: anExpressionBuildingBlock arguments: anOtherExpressionBuildingBlock [

	^ self registerStatement: (self writeExpression: [ :exp | 
			   exp
				   invokeMethodNamed: aString
				   receiver: anExpressionBuildingBlock
				   arguments: anOtherExpressionBuildingBlock ])
]

{ #category : #expressions }
MOStatementWriter >> invokeNamed: aString arguments: anOtherExpressionBuildingBlock [

	^ self registerStatement: (self writeExpression: [ :exp | 
			   exp
				   invokeNamed: aString
				   arguments: anOtherExpressionBuildingBlock ])
]

{ #category : #'as yet unclassified' }
MOStatementWriter >> isuable [

	^ writeResult isNil
]

{ #category : #statements }
MOStatementWriter >> label: aString [

	^ self registerStatement: (builder labelBuilder
			   label: aString;
			   build)
]

{ #category : #expressions }
MOStatementWriter >> let: anExpressionBuildingBlock beAssignedWith: anOtherExpressionBuildingBlock [

	^ self registerStatement: (self writeExpression: [ :exp | 
			   exp
				   let: anExpressionBuildingBlock
				   beAssignedWith: anOtherExpressionBuildingBlock ])
]

{ #category : #statements }
MOStatementWriter >> onErrorGoTo: aMOLabelReference [

	^ self registerStatement: (builder onErrorBuilder
			   goTo: (self writeExpression: aMOLabelReference);
			   build)
]

{ #category : #'as yet unclassified' }
MOStatementWriter >> onErrorResumeNext [

	^ self registerStatement: builder onErrorResumeNextBuilder build
]

{ #category : #expressions }
MOStatementWriter >> operate: anExpressionBuildingBlock operator: aString with: anOtherExpressionBuildingBlock [

	^ self registerStatement: (self writeExpression: [ :e | 
			   e
				   operate: anExpressionBuildingBlock
				   operator: aString
				   with: anOtherExpressionBuildingBlock ])
]

{ #category : #expressions }
MOStatementWriter >> operateBoolean: anExpressionBuildingBlock operator: aString with: anOtherExpressionBuildingBlock [

	^ self registerStatement: (self writeExpression: [ :exp | 
			   exp
				   operateBoolean: anExpressionBuildingBlock
				   operator: aString
				   with: anOtherExpressionBuildingBlock ])
]

{ #category : #writing }
MOStatementWriter >> registerStatement: aStatement [

	self assert: writeResult isNil.
	writeResult := aStatement isExpression
		               ifTrue: [ 
			               builder statementExpressionBuilder
				               expression: aStatement;
				               build ]
		               ifFalse: [ aStatement ].
	^ writeResult
]

{ #category : #controlling }
MOStatementWriter >> resume [

	^ self registerStatement: builder resumeBuilder build
]

{ #category : #statements }
MOStatementWriter >> resume: aMOLabelReferenceBuilder [

	^ self registerStatement: (builder resumeBuilder
			   destinations: (self writeExpression: aMOLabelReferenceBuilder);
			   build)
]

{ #category : #statements }
MOStatementWriter >> return: anExpressionOrBlock [

	^ self registerStatement: (builder returnBuilder
			   expression:  (self writeExpression: anExpressionOrBlock);
			   build)
]

{ #category : #'as yet unclassified' }
MOStatementWriter >> select: anExpressionOrBlock cases: aCasesBlock [

	^ self registerStatement: (builder selectBuilder
			   expression: (self writeExpression: anExpressionOrBlock);
			   cases: (self writeExpression: aCasesBlock);
			   build)
]

{ #category : #statements }
MOStatementWriter >> setToReturn: aFullBlockClosure [

	^ self registerStatement: (builder setToReturnBuilder
			   returns: (self writeExpression: aFullBlockClosure);
			   build)
]

{ #category : #statements }
MOStatementWriter >> variable: aString typeReference: aMOTypeReference [

	^ self registerStatement: (builder variableBuilder
			   name: aString;
			   typeReference: aMOTypeReference value;
			   build)
]

{ #category : #statements }
MOStatementWriter >> variable: aName typeReference: aTypeReference initializer: anExpressionBlock [

	^ self registerStatement: (builder variableBuilder
			   name: aName;
			   typeReference: aTypeReference value;
			   initializer: (self writeExpression: anExpressionBlock);
			   build)
]

{ #category : #statements }
MOStatementWriter >> while: aConditionBlock do: aLoopingBlock [

	^ self registerStatement: (builder loopStatementBuilder
			   forWhile;
			   condition: (self writeExpression: aConditionBlock);
			   loopingBlock: (self writeBlock: aLoopingBlock);
			   build)
]

{ #category : #statements }
MOStatementWriter >> writeCopyOf: aProvenanceEntity readingValues: aChildDelegateLoadingBlock [

	self installCopyingBuilder.


	^ self write: [ :s | 
		  self registerStatement: (copyHelper
				   buildCopyOf: aProvenanceEntity
				   readingValues: aChildDelegateLoadingBlock
				   into: self) ]
]

{ #category : #writing }
MOStatementWriter >> writeStatement: aFullBlockClosure [ 
	^ aFullBlockClosure value: self 
]

{ #category : #'as yet unclassified' }
MOStatementWriter >> writenExpression: aMOMethodInvocation [

	^ self registerStatement: aMOMethodInvocation
]
