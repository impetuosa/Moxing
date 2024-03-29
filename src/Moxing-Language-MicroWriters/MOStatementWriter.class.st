"
I am a statement writer. 
I unify the builder api. 
I do not inform the statements to my aprent writer. I am mostlikely to work as a leaf writer .
"
Class {
	#name : #MOStatementWriter,
	#superclass : #MOAbstractStatementWriter,
	#category : #'Moxing-Language-MicroWriters-Statements'
}

{ #category : #visiting }
MOStatementWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitStatementWriter: self 


]

{ #category : #adding }
MOStatementWriter >> addLocalConstant: aMOLocalConstant [

	^ self addStatement: aMOLocalConstant
]

{ #category : #adding }
MOStatementWriter >> addLocalVariable: aMOLocalConstant [

	^ self addStatement: aMOLocalConstant
]

{ #category : #adding }
MOStatementWriter >> addStatement: aMOIfElse [

	^ self registerStatement: aMOIfElse
]

{ #category : #'as yet unclassified' }
MOStatementWriter >> arrayAccess: anExpressionBuildingBlock arguments: anArgumentsBlock [

	^ self writeExpression: [ :exp | 
		  exp
			  arrayAccess: anExpressionBuildingBlock
			  arguments: anArgumentsBlock ]
]

{ #category : #accessing }
MOStatementWriter >> block: aMOBlock [

	^ self addStatement: aMOBlock
]

{ #category : #statements }
MOStatementWriter >> break [

	| stmnt |
	stmnt := self write: [ :a |  ] inSubWriter: MOBreakWriter.
	^ stmnt
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

{ #category : #'as yet unclassified' }
MOStatementWriter >> cast: anExpressionBuildingBlock to: aTypeBuildingBlock [

	^ self registerStatement: (self writeExpression: [ :exp | 
			   exp cast: anExpressionBuildingBlock to: aTypeBuildingBlock ])
]

{ #category : #expressions }
MOStatementWriter >> compare: aMOIntegerLiteral is: aString than: aFullBlockClosure [

	^ self registerStatement: (self writeExpression: [ :e | 
			   e compare: aMOIntegerLiteral is: aString than: aFullBlockClosure ])
]

{ #category : #statements }
MOStatementWriter >> continue [

	| stmnt |
	stmnt := self write: [ :a |  ] inSubWriter: MOContinueWriter.
	^ stmnt
]

{ #category : #statements }
MOStatementWriter >> do: aLoopingBlock until: aConditionBlock [

	^ self writeDoUntil: [ :while | 
		  while
			  writeCondition: aConditionBlock;
			  writeBlock: aLoopingBlock ]
]

{ #category : #statements }
MOStatementWriter >> do: aLoopingBlock while: aConditionBlock [ 

	^ self writeDoWhile: [ :while | 
		  while
			  writeCondition: aConditionBlock;
			  writeBlock: aLoopingBlock ]
]

{ #category : #statements }
MOStatementWriter >> exit [

	^ self registerStatement: builder buildExit
]

{ #category : #statements }
MOStatementWriter >> for: anInitBlock condition: aConditionBlock update: anUpdateBlock do: aLoopingBlock [

	" for ( initBlock; conditionBlock; updateBlock) loopingBlock "

	^ self writeFor: [ :for | 
		  for
			  writeInitializeOperation: anInitBlock;
			  writeCondition: aConditionBlock;
			  writeUpdateOperation: anUpdateBlock;
			  writeBlock: aLoopingBlock ]
]

{ #category : #statements }
MOStatementWriter >> for: anCounterBlock from: anInitValueBlock to: aLimitValueBlock do: aLoopingBlock [

	" for i= 1 to N  "
	^ self
		  for: anCounterBlock
		  from: anInitValueBlock
		  to: aLimitValueBlock
		  step: [ :exp | exp numericLiteral: 1 ]
		  do: aLoopingBlock
]

{ #category : #statements }
MOStatementWriter >> for: anCounterBlock from: anInitValueBlock to: aLimitValueBlock step: aStepBlock do: aLoopingBlock [

	" for i= 1 to N step 1 "

	^ self writeForNext: [ :for | 
		  for
			  writeCounter: anCounterBlock;
			  writeInitValue: anInitValueBlock;
			  writeLimitValue: aLimitValueBlock;
			  writeStep: aStepBlock;
			  writeLoopingBlock: aLoopingBlock ]
		
	



]

{ #category : #statements }
MOStatementWriter >> for: anEachBlock in: anCollectionBlock do: aLoopingBlock [

	^ self writeForEach: [ :foreach | 
		  foreach
			  writeEach: anEachBlock;
			  writeCollection: anCollectionBlock;
			  writeBlock: aLoopingBlock ]
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

	^ self writeIfElse: [ :ifElse | 
		  ifElse
			  writeCondition: aConditionBlock;
			  writeIfTrueBlock: ifTrueBlock;
			  writeIfFalseBlock: ifFalseBlock ]
]

{ #category : #statements }
MOStatementWriter >> infinityLoopDo: aLoopingBlock [

	^ self writeInfinityLoop: [ :while | while writeBlock: aLoopingBlock ]
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

{ #category : #'as yet unclassified' }
MOStatementWriter >> invokeConstructorArguments: aFullBlockClosure [

	^ self registerStatement: (self writeExpression: [ :exp | 
			   exp invokeConstructorArguments: aFullBlockClosure ])
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

{ #category : #'as yet unclassified' }
MOStatementWriter >> invokeNewExpressionOnType: aTypeReference withArguments: aCollection [

	^ self registerStatement: (self writeExpression: [ :exp | 
			   exp
				   invokeNewExpressionOnType: aTypeReference
				   withArguments: aCollection ])
]

{ #category : #'as yet unclassified' }
MOStatementWriter >> invokeSuperConstructorArguments: aFullBlockClosure [

	^ self registerStatement: (self writeExpression: [ :exp | 
			   exp invokeSuperConstructorArguments: aFullBlockClosure ])
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

{ #category : #'instance creation' }
MOStatementWriter >> new: aMOTypeReference arguments: aFullBlockClosure [

	^ self registerStatement: (self writeExpression: [ :exp | 
			   exp new: aMOTypeReference arguments: aFullBlockClosure ])
]

{ #category : #expressions }
MOStatementWriter >> noOp: aDescription [

	^ self registerStatement:
		  (self writeExpression: [ :exp | exp noOp: aDescription ])
]

{ #category : #'as yet unclassified' }
MOStatementWriter >> noOpBuilder [
	self shouldBeImplemented.
]

{ #category : #statements }
MOStatementWriter >> onErrorGoTo: aMOLabelReference [

	^ self writeOnErrorGoTo: [ :goto | 
		  goto writeDestination: aMOLabelReference ] 
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

{ #category : #accessing }
MOStatementWriter >> package: aMOPackage [ 
	" nothing to do "
]

{ #category : #'as yet unclassified' }
MOStatementWriter >> postfixOperate: aFullBlockClosure operator: aString [

	^ self registerStatement: (self writeExpression: [ :expr | 
			   expr postfixOperate: aFullBlockClosure operator: aString ])
]

{ #category : #'as yet unclassified' }
MOStatementWriter >> pragma: aString arguments: aFullBlockClosure [

	^ self registerStatement: (self writeExpression: [ :exp | 
			   exp pragma: aString arguments: aFullBlockClosure ])
]

{ #category : #'as yet unclassified' }
MOStatementWriter >> prefixOperate: aFullBlockClosure operator: aString [

	^ self registerStatement: (self writeExpression: [ :expr | 
			   expr prefixOperate: aFullBlockClosure operator: aString ])
]

{ #category : #writing }
MOStatementWriter >> registerStatement: aStatement [

	writeResult ifNotNil: [ 
		writeResult class = aStatement class ifFalse: [ self halt ] ].
	writeResult := aStatement isStatement
		               ifFalse: [ 
			               builder statementExpressionBuilder
				               expression: aStatement;
				               build ]
		               ifTrue: [ aStatement ].
	^ writeResult
]

{ #category : #controlling }
MOStatementWriter >> resume [

	^ self writeResume: [ :r |  ]
]

{ #category : #statements }
MOStatementWriter >> resume: aMOLabelReferenceBuilder [

	^ self writeResume: [ :d | 
		  d writeDestinations: aMOLabelReferenceBuilder ]
]

{ #category : #statements }
MOStatementWriter >> return: anExpressionOrBlock [

	^ self writeReturn: [ :ret | 
		  ret writeExpression: anExpressionOrBlock ]
]

{ #category : #'as yet unclassified' }
MOStatementWriter >> select: anExpressionOrBlock cases: aCasesBlock [

	^ self writeSelect: [ :select | 
		  select writeCondition: anExpressionOrBlock.
		  aCasesBlock value: select ]
]

{ #category : #statements }
MOStatementWriter >> setToReturn: aFullBlockClosure [

	^ self writeSetToReturn: [ :set | 
		  set writeExpression: aFullBlockClosure ]
]

{ #category : #'as yet unclassified' }
MOStatementWriter >> stArrayExpression: aFullBlockClosure [

	^ self registerStatement:
		  (self writeExpression: [ :a | 
			   a stArrayExpression: aFullBlockClosure ])
]

{ #category : #'as yet unclassified' }
MOStatementWriter >> stCascadeWith: aFullBlockClosure [

	^ self registerStatement:
		  (self writeExpression: [ :a | a stCascadeWith: aFullBlockClosure ])
]

{ #category : #'as yet unclassified' }
MOStatementWriter >> switch: aBlock block: anOtherBlock [

	^ self writeSwitch: [ :switch | 
		  switch expression: (switch writeExpression: aBlock).
		  switch writeBlock: anOtherBlock ]
]

{ #category : #'as yet unclassified' }
MOStatementWriter >> throw: aFullBlockClosure [

	^ self registerStatement:
		  (self writeExpression: [ :exp | exp throw: aFullBlockClosure ])
]

{ #category : #statements }
MOStatementWriter >> variable: aString typeReference: aMOTypeReference [

	^ self registerStatement: (builder localVariableBuilder
			   name: aString;
			   typeReference: aMOTypeReference value;
			   build)
]

{ #category : #statements }
MOStatementWriter >> variable: aName typeReference: aTypeReference initializer: anExpressionBlock [

	^ self registerStatement: (builder localVariableBuilder
			   name: aName;
			   typeReference: aTypeReference value;
			   initializer: (self writeExpression: anExpressionBlock);
			   build)
]

{ #category : #statements }
MOStatementWriter >> while: aConditionBlock do: aLoopingBlock [

	^ self writeWhile: [ :while | 
		  while
			  writeCondition: aConditionBlock;
			  writeBlock: aLoopingBlock ]
]

{ #category : #enumerating }
MOStatementWriter >> with: anExpressionBlock do: aBlockWritingBlock [

	^ self writeWith: [ :with | 
		  with
			  writeExpression: anExpressionBlock;
			  writeBlock: aBlockWritingBlock ]
]

{ #category : #statements }
MOStatementWriter >> writeAssertionStatement: aBlock [

	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOAssertionStatementWriter.
	^ stmnt
]

{ #category : #writing }
MOStatementWriter >> writeBlockClosure: aFullBlockClosure [

	^ self registerStatement:
		  (self write: aFullBlockClosure inSubWriter: MOBlockClosureWriter)
]

{ #category : #writing }
MOStatementWriter >> writeConstant: aFullBlockClosure [

	^ self writeLocalConstant: aFullBlockClosure
]

{ #category : #writing }
MOStatementWriter >> writeDoUntil: aBlock [

	| stmnt |
	stmnt := self write: aBlock inSubWriter: MODoUntilWriter.
	^ stmnt
]

{ #category : #writing }
MOStatementWriter >> writeDoWhile: aBlock [

	| stmnt |
	stmnt := self write: aBlock inSubWriter: MODoWhileWriter.
	^ stmnt
]

{ #category : #'as yet unclassified' }
MOStatementWriter >> writeExpression: anExpressionBlock [

	^ self writeUnregisteredExpression: anExpressionBlock
]

{ #category : #statements }
MOStatementWriter >> writeFileLineInput: aBlock [

	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOAlceFileLineInputWriter.
	^ stmnt
]

{ #category : #statements }
MOStatementWriter >> writeFileOpen: aBlock [

	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOAlceFileOpenWriter.
	^ stmnt
]

{ #category : #statements }
MOStatementWriter >> writeFilePrintIntoInput: aBlock [

	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOAlceFilePrintIntoWriter.
	^ stmnt
]

{ #category : #writing }
MOStatementWriter >> writeFileRename: aFullBlockClosure [

	| stmnt |
	stmnt := self
		         write: aFullBlockClosure
		         inSubWriter: MOAlceFileRenameWriter.
	^ stmnt
]

{ #category : #statements }
MOStatementWriter >> writeFor: aBlock [

	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOForWriter.
	^ stmnt
]

{ #category : #statements }
MOStatementWriter >> writeForEach: aBlock [

	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOForEachWriter.
	^ stmnt
]

{ #category : #statements }
MOStatementWriter >> writeForNext: aBlock [

	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOForNextWriter.
	^ stmnt
]

{ #category : #statements }
MOStatementWriter >> writeGoSub: aFullBlockClosure [

	| stmnt |
	stmnt := self write: aFullBlockClosure inSubWriter: MOGoSubWriter.
	^ stmnt
]

{ #category : #writing }
MOStatementWriter >> writeGoTo: aFullBlockClosure [

	| stmnt |
	stmnt := self write: aFullBlockClosure inSubWriter: MOGoToWriter.
	^ stmnt
]

{ #category : #writing }
MOStatementWriter >> writeIfElse: aBlock [

	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOIfElseWriter.
	^ stmnt
]

{ #category : #writing }
MOStatementWriter >> writeInfinityLoop: aBlock [

	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOInfinityLoopWriter.
	^ stmnt
]

{ #category : #writing }
MOStatementWriter >> writeJavaClass: aFullBlockClosure [

	^ self writeStatementDeclaration: [ :stat | 
		  stat writeJavaClass: aFullBlockClosure ]
]

{ #category : #writing }
MOStatementWriter >> writeLabelWithStatement: aFullBlockClosure [

	| stmnt |
	stmnt := self
		         write: aFullBlockClosure
		         inSubWriter: MOLabelWithStatementWriter.
	^ stmnt
]

{ #category : #writing }
MOStatementWriter >> writeLambda: aFullBlockClosure [

	^ self registerStatement:
		  (self write: aFullBlockClosure inSubWriter: MOLambdaWriter)
]

{ #category : #writing }
MOStatementWriter >> writeLiteralForValue: aValue [

	^ self writenExpression: (self literalForValue: aValue)
]

{ #category : #writing }
MOStatementWriter >> writeLocalConstant: aBlock [

	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOLocalConstantWriter.
	^ stmnt
]

{ #category : #statements }
MOStatementWriter >> writeOnErrorGoTo: aFullBlockClosure [ 
	| stmnt |
	stmnt := self write: aFullBlockClosure inSubWriter: MOOnErrorGoToWriter.
	^ stmnt

]

{ #category : #writing }
MOStatementWriter >> writeReferenceToSelf [

	^ self writenExpression: self referenceToSelf
]

{ #category : #writing }
MOStatementWriter >> writeReferenceToSuper [

	^ self writenExpression: self referenceToSuper
]

{ #category : #writing }
MOStatementWriter >> writeReferenceToThisContext [

	^ self writenExpression: self referenceToThisContext
]

{ #category : #statements }
MOStatementWriter >> writeResume: aBlock [

	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOResumeWriter.
	^ stmnt
]

{ #category : #statements }
MOStatementWriter >> writeReturn: aBlock [

	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOReturnWriter.
	^ stmnt
]

{ #category : #enumerating }
MOStatementWriter >> writeSelect: aBlock [

	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOSelectWriter.
	^ stmnt
]

{ #category : #statements }
MOStatementWriter >> writeSetToReturn: aFullBlockClosure [ 
	
	| stmnt |
	stmnt := self write: aFullBlockClosure inSubWriter: MOSetToReturnWriter.
	^ stmnt
]

{ #category : #writing }
MOStatementWriter >> writeStatement: aFullBlockClosure [ 
	^ aFullBlockClosure value: self 
]

{ #category : #enumerating }
MOStatementWriter >> writeStatementDeclaration: aBlock [

	^ parentWriter writeStatementDeclaration: aBlock
]

{ #category : #writing }
MOStatementWriter >> writeSwitch: aBlock [

	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOSwitchWriter.
	^ stmnt
]

{ #category : #writing }
MOStatementWriter >> writeSynchronized: aFullBlockClosure [

	| stmnt |
	stmnt := self
		         write: aFullBlockClosure
		         inSubWriter: MOSynchronizedWriter.
	^ stmnt
]

{ #category : #writing }
MOStatementWriter >> writeTryCatch: aFullBlockClosure [ 
	| stmnt |
	stmnt := self write: aFullBlockClosure inSubWriter: MOTryCatchWriter.
	^ stmnt
]

{ #category : #writing }
MOStatementWriter >> writeTypeReferenceNamed: aString [

	^ self writenExpression: (self typeReferenceNamed: aString)
]

{ #category : #writing }
MOStatementWriter >> writeVariable: aBlock [

	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOVariableWriter.
	^ stmnt
]

{ #category : #writing }
MOStatementWriter >> writeVariableAccessNamed: aString [

	^ self writenExpression: (self variableReferenceNamed: aString)
]

{ #category : #writing }
MOStatementWriter >> writeWhile: aBlock [

	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOWhileWriter.
	^ stmnt
]

{ #category : #writing }
MOStatementWriter >> writeWith: aFullBlockClosure [

	| stmnt |
	stmnt := self write: aFullBlockClosure inSubWriter: MOWithWriter.
	^ stmnt
]

{ #category : #'as yet unclassified' }
MOStatementWriter >> writenExpression: aMOMethodInvocation [

	^ self registerStatement: aMOMethodInvocation
]
