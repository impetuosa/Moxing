Class {
	#name : #MOControlFlowBuilderTestCase,
	#superclass : #MOBuilderTestCase,
	#category : #'Moxing-MicroBuilderTest'
}

{ #category : #'do until' }
MOControlFlowBuilderTestCase >> testDoUntilStatement [

	| while |
	while := builder doUntilStatementBuilder
		         condition: (builder comparisonOperatorBuilder
				          operator: #>;
				          left: (builder localVariableBuilder
						           name: 'var';
						           build);
				          right: (builder numericLiteralBuilder
						           value: 10;
						           build);
				          build);
		         loopingBlock: (builder blockBuilder
				          addStatement: (builder statementExpressionBuilder
						           expression: (builder invocationBuilder
								            selector: #function;
								            addArgument: (builder booleanLiteralBuilder
										             value: true;
										             build)) build;
						           build);
				          build);
		         build.
	self assert: while isKindOf: MODoUntil.
	self assert: while condition operator equals: #>.
	self assert: while loopingBlock statements size equals: 1
]

{ #category : #'do until' }
MOControlFlowBuilderTestCase >> testDoUntilStatementNoCondition [

	self
		should: [ 
			builder doUntilStatementBuilder
				loopingBlock: (builder blockBuilder
						 addStatement: (builder invocationBuilder
								  selector: #function;
								  addArgument: (builder booleanLiteralBuilder
										   value: true;
										   build)) build;
						 build);
				build ]
		raise: Error
]

{ #category : #'do until' }
MOControlFlowBuilderTestCase >> testDoUntilStatementNoLoopingBlock [

	self
		should: [ 
			builder doUntilStatementBuilder
				condition: (builder comparisonOperatorBuilder
						 operator: #>;
						 left: (builder localVariableBuilder
								  name: 'var';
								  build);
						 right: (builder numericLiteralBuilder
								  value: 10;
								  build);
						 build);
				build ]
		raise: Error
]

{ #category : #for }
MOControlFlowBuilderTestCase >> testForStatement [

	| for |
	for := builder forStatementBuilder
		       initializeOperation: (builder localVariableBuilder
				        name: #i;
				        build);
		       updateOperation: (builder arithmeticUnaryOperationBuilder
				        operand: (builder variableReferenceBuilder
						         name: #i;
						         build);
				        operator: #++;
				        build);
		       condition: (builder comparisonOperatorBuilder
				        operator: #>;
				        left: (builder variableReferenceBuilder
						         name: 'i';
						         build);
				        right: (builder numericLiteralBuilder
						         value: 10;
						         build);
				        build);
		       loopingBlock: (builder blockBuilder
				        addStatement: (builder statementExpressionBuilder
						         expression: (builder invocationBuilder
								          selector: #function;
								          addArgument: (builder booleanLiteralBuilder
										           value: true;
										           build)) build;
						         build);
				        build);
		       build.
	self assert: for isKindOf: MOFor.
	self assert: for condition operator equals: #>.
	self assert: for initializeOperation isKindOf: MOLocalVariable.
	self assert: for updateOperation isKindOf: MOUnaryArithmeticOperation.
	self assert: for loopingBlock statements size equals: 1
]

{ #category : #for }
MOControlFlowBuilderTestCase >> testForStatementNoCondition [

	self
		should: [ 
			builder forStatementBuilder
				initializeOperation: (builder localVariableBuilder
						 name: #i;
						 build);
				updateOperation: (builder arithmeticUnaryOperationBuilder
						 operand: (builder variableReferenceBuilder
								  name: #i;
								  build);
						 operator: #++;
						 build);
				loopingBlock: (builder blockBuilder
						 addStatement: (builder invocationBuilder
								  selector: #function;
								  addArgument: (builder booleanLiteralBuilder
										   value: true;
										   build)) build;
						 build);
				build ]
		raise: Error
]

{ #category : #for }
MOControlFlowBuilderTestCase >> testForStatementNoInitializeOperation [

	| for |
	for := builder forStatementBuilder
		       updateOperation: (builder arithmeticUnaryOperationBuilder
				        operand: (builder variableReferenceBuilder
						         name: #i;
						         build);
				        operator: #++;
				        build);
		       condition: (builder comparisonOperatorBuilder
				        operator: #>;
				        left: (builder variableReferenceBuilder
						         name: 'i';
						         build);
				        right: (builder numericLiteralBuilder
						         value: 10;
						         build);
				        build);
		       loopingBlock: (builder blockBuilder
				        addStatement: (builder statementExpressionBuilder
						         expression: (builder invocationBuilder
								          selector: #function;
								          addArgument: (builder booleanLiteralBuilder
										           value: true;
										           build)) build;
						         build);
				        build);
		       build.
	self assert: for isKindOf: MOFor.
	self assert: for condition operator equals: #>.
	self assert: for initializeOperation isKindOf: MONoOp.
	self assert: for updateOperation isKindOf: MOUnaryArithmeticOperation.
	self assert: for loopingBlock statements size equals: 1
]

{ #category : #for }
MOControlFlowBuilderTestCase >> testForStatementNoLoopingBlock [

	self
		should: [ 
			builder forStatementBuilder
				initializeOperation: (builder localVariableBuilder
						 name: #i;
						 build);
				updateOperation: (builder arithmeticUnaryOperationBuilder
						 operand: (builder variableReferenceBuilder
								  name: #i;
								  build);
						 operator: #++;
						 build);
				condition: (builder comparisonOperatorBuilder
						 operator: #>;
						 left: (builder variableReferenceBuilder
								  name: 'i';
								  build);
						 right: (builder numericLiteralBuilder
								  value: 10;
								  build);
						 build);
				build ]
		raise: Error
]

{ #category : #for }
MOControlFlowBuilderTestCase >> testForStatementNoUpdateOperation [

	| for |
	for := builder forStatementBuilder
		       initializeOperation: (builder localVariableBuilder
				        name: #i;
				        build);
		       condition: (builder comparisonOperatorBuilder
				        operator: #>;
				        left: (builder variableReferenceBuilder
						         name: 'i';
						         build);
				        right: (builder numericLiteralBuilder
						         value: 10;
						         build);
				        build);
		       loopingBlock: (builder blockBuilder
				          addStatement: (builder statementExpressionBuilder
						           expression: (builder invocationBuilder
								            selector: #function;
								            addArgument: (builder booleanLiteralBuilder
										             value: true;
										             build)) build;
						           build);
				          build);
		         build.
	self assert: for isKindOf: MOFor.
	self assert: for condition operator equals: #>.
	self assert: for initializeOperation isKindOf: MOLocalVariable.
	self assert: for updateOperation isKindOf: MONoOp.
	self assert: for loopingBlock statements size equals: 1
]

{ #category : #if }
MOControlFlowBuilderTestCase >> testIfElseStatement [

	| if |
	if := builder ifStatementBuilder
		      condition: (builder comparisonOperatorBuilder
				       operator: #>;
				       left: (builder localVariableBuilder
						        name: 'var';
						        build);
				       right: (builder numericLiteralBuilder
						        value: 10;
						        build);
				       build);
		      ifTrueBlock: (builder blockBuilder
				       addStatement:(builder statementExpressionBuilder
						           expression: (builder invocationBuilder
								            selector: #function;
								            addArgument: (builder booleanLiteralBuilder
										             value: true;
										             build)) build;
						           build);
				          build);
		      ifFalseBlock: (builder blockBuilder
				       addStatement: (builder statementExpressionBuilder
						           expression: (builder invocationBuilder
								            selector: #function;
								            addArgument: (builder booleanLiteralBuilder
										             value: true;
										             build)) build;
						           build);
				          build);
		      build.
	self assert: if isKindOf: MOIfElse.
	self assert: if condition operator equals: #>.
	self assert: if ifFalse statements size equals: 1.
	self assert: if ifTrue statements size equals: 1
]

{ #category : #if }
MOControlFlowBuilderTestCase >> testIfNoBlockBuilding [

	self
		should: [ 
			builder ifStatementBuilder
				condition: (builder comparisonOperatorBuilder
						 operator: #>;
						 left: (builder localVariableBuilder
								  name: 'var';
								  build);
						 right: (builder numericLiteralBuilder
								  value: 10;
								  build);
						 build);
				build ]
		raise: Error
]

{ #category : #if }
MOControlFlowBuilderTestCase >> testIfNoConditionBuilding [

	self
		should: [ 
			builder ifStatementBuilder
				ifFalseBlock:
					(builder blockBuilder addStatement: (builder invocationBuilder
								  selector: #function;
								  addArgument: (builder booleanLiteralBuilder
										   value: true;
										   build)));
				build ]
		raise: Error
]

{ #category : #if }
MOControlFlowBuilderTestCase >> testIfOnlyElseStatement [

	| if |
	if := builder ifStatementBuilder
		      condition: (builder comparisonOperatorBuilder
				       operator: #>;
				       left: (builder localVariableBuilder
						        name: 'var';
						        build);
				       right: (builder numericLiteralBuilder
						        value: 10;
						        build);
				       build);
		      ifFalseBlock: (builder blockBuilder
				       addStatement: (builder statementExpressionBuilder
						           expression: (builder invocationBuilder
								            selector: #function;
								            addArgument: (builder booleanLiteralBuilder
										             value: true;
										             build)) build;
						           build);
				          build);
		      build.
	self assert: if isKindOf: MOIfElse.
	self assert: if condition operator equals: #>.
	self assert: if ifFalse statements size equals: 1.
	self assert: if ifTrue statements size equals: 0
]

{ #category : #if }
MOControlFlowBuilderTestCase >> testIfStatement [

	| if |
	if := builder ifStatementBuilder
		      condition: (builder comparisonOperatorBuilder
				       operator: #>;
				       left: (builder localVariableBuilder
						        name: 'var';
						        build);
				       right: (builder numericLiteralBuilder
						        value: 10;
						        build);
				       build);
		      ifTrueBlock: (builder blockBuilder
				       addStatement: (builder statementExpressionBuilder
						           expression: (builder invocationBuilder
								            selector: #function;
								            addArgument: (builder booleanLiteralBuilder
										             value: true;
										             build)) build;
						           build);
				          build);
		      build.
	self assert: if isKindOf: MOIfElse.
	self assert: if condition operator equals: #>.
	self assert: if ifTrue statements size equals: 1.
	self assert: if ifFalse statements size equals: 0
]

{ #category : #while }
MOControlFlowBuilderTestCase >> testWhileNoCondition [

	| while |
	self
		should: [ 
			while := builder loopStatementBuilder
				         loopingBlock: (builder blockBuilder
						          addStatement: (builder invocationBuilder
								           selector: #function;
								           addArgument: (builder booleanLiteralBuilder
										            value: true;
										            build)) build;
						          build);
				         build ]
		raise: Error
]

{ #category : #while }
MOControlFlowBuilderTestCase >> testWhileNoLoopingBlock [

	| while |
	self
		should: [ 
			while := builder loopStatementBuilder
				         condition: (builder comparisonOperatorBuilder
						          operator: #>;
						          left: (builder localVariableBuilder
								           name: 'var';
								           build);
						          right: (builder numericLiteralBuilder
								           value: 10;
								           build);
						          build);
				         build ]
		raise: Error
]

{ #category : #while }
MOControlFlowBuilderTestCase >> testWhileStatement [

	| while |
	while := builder loopStatementBuilder
		         condition: (builder comparisonOperatorBuilder
				          operator: #>;
				          left: (builder localVariableBuilder
						           name: 'var';
						           build);
				          right: (builder numericLiteralBuilder
						           value: 10;
						           build);
				          build);
		         loopingBlock: (builder blockBuilder
				          addStatement: (builder statementExpressionBuilder
						           expression: (builder invocationBuilder
								            selector: #function;
								            addArgument: (builder booleanLiteralBuilder
										             value: true;
										             build)) build;
						           build);
				          build);
		         build.
	self assert: while isKindOf: MOWhile.
	self assert: while condition operator equals: #>.
	self assert: while loopingBlock statements size equals: 1
]
