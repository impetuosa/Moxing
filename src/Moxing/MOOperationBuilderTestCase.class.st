Class {
	#name : #MOOperationBuilderTestCase,
	#superclass : #MOBuilderTestCase,
	#category : #'Moxing-MicroBuilderTest'
}

{ #category : #'arithmetic operation' }
MOOperationBuilderTestCase >> testBinaryArithmeticOperation [

	| compare |
	compare := builder arithmeticOperatorBuilder
		           operator: #+;
		           left: (builder variableReferenceBuilder
				            name: #var;
				            build);
		           right: (builder variableReferenceBuilder
				            name: #var;
				            build);
		           build.
	self assert: compare isKindOf: MOBinaryArithmeticOperation.
	self assert: compare operator equals: #+
]

{ #category : #'arithmetic operation' }
MOOperationBuilderTestCase >> testBinaryArithmeticOperationNoLeft [

	self
		should: [ 
			builder arithmeticOperatorBuilder
				operator: #+;
				right: (builder variableReferenceBuilder
						 name: #var;
						 build);
				build ]
		raise: Error
]

{ #category : #'arithmetic operation' }
MOOperationBuilderTestCase >> testBinaryArithmeticOperationNoOperator [

	self
		should: [ 
			builder arithmeticOperatorBuilder
				left: (builder variableReferenceBuilder
						 name: #var;
						 build);
				right: (builder variableReferenceBuilder
						 name: #var;
						 build);
				build ]
		raise: Error
]

{ #category : #'arithmetic operation' }
MOOperationBuilderTestCase >> testBinaryArithmeticOperationNoRight [

	self
		should: [ 
			builder arithmeticOperatorBuilder
				operator: #+;
				left: (builder variableReferenceBuilder
						 name: #var;
						 build);
				build ]
		raise: Error
]

{ #category : #'boolean operation' }
MOOperationBuilderTestCase >> testNewBooleanOperation [

	| compare |
	compare := builder arithmeticBooleanOperatorBuilder
		           operator: #&&;
		           left: (builder variableReferenceBuilder
				            name: #var;
				            build);
		           right: (builder variableReferenceBuilder
				            name: #var;
				            build);
		           build.
	self assert: compare isKindOf: MOBinaryBooleanOperation .
	self assert: compare operator equals: #&&
]

{ #category : #'boolean operation' }
MOOperationBuilderTestCase >> testNewBooleanOperationNoLeft [

	self
		should: [ 
			builder arithmeticBooleanOperatorBuilder
				operator: #&&;
				right: (builder variableReferenceBuilder
						 name: #var;
						 build);
				build ]
		raise: Error
]

{ #category : #'boolean operation' }
MOOperationBuilderTestCase >> testNewBooleanOperationNoOperator [

	self
		should: [ 
			builder arithmeticBooleanOperatorBuilder
				left: (builder variableReferenceBuilder
						 name: #var;
						 build);
				right: (builder variableReferenceBuilder
						 name: #var;
						 build);
				build ]
		raise: Error
]

{ #category : #'boolean operation' }
MOOperationBuilderTestCase >> testNewBooleanOperationNoRight [

	self
		should: [ 
			builder arithmeticBooleanOperatorBuilder
				operator: #&&;
				left: (builder variableReferenceBuilder
						 name: #var;
						 build);
				build ]
		raise: Error
]

{ #category : #'comparison operation' }
MOOperationBuilderTestCase >> testNewComparison [

	| compare |
	compare := builder comparisonOperatorBuilder
		           operator: #==;
		           left: (builder variableReferenceBuilder
				            name: #var;
				            build);
		           right: (builder variableReferenceBuilder
				            name: #var;
				            build);
		           build.
	self assert: compare isKindOf: MOBinaryComparisonOperation.
	self assert: compare operator equals: #==
]

{ #category : #'comparison operation' }
MOOperationBuilderTestCase >> testNewComparisonNoLeft [

	self
		should: [ 
			builder comparisonOperatorBuilder
				operator: #==;
				right: (builder variableReferenceBuilder
						 name: #var;
						 build);
				build ]
		raise: Error
]

{ #category : #'comparison operation' }
MOOperationBuilderTestCase >> testNewComparisonNoOperator [

	self
		should: [ 
			builder comparisonOperatorBuilder
				left: (builder variableReferenceBuilder
						 name: #var;
						 build);
				right: (builder variableReferenceBuilder
						 name: #var;
						 build);
				build ]
		raise: Error
]

{ #category : #'comparison operation' }
MOOperationBuilderTestCase >> testNewComparisonNoRight [

	self
		should: [ 
			builder comparisonOperatorBuilder
				operator: #==;
				left: (builder variableReferenceBuilder
						 name: #var;
						 build);
				build ]
		raise: Error
]

{ #category : #'arithmetic operation' }
MOOperationBuilderTestCase >> testUnaryArithmetic [

	| operator |
	operator := builder arithmeticUnaryOperationBuilder
		            operand: (builder variableReferenceBuilder
				             name: #i;
				             build);
		            operator: #!;
		            build.
	self assert: operator isKindOf: MOUnaryArithmeticOperation.
	self assert: operator operator equals: #!. 
	self assert: operator order equals: #postfix. 
]

{ #category : #'arithmetic operation' }
MOOperationBuilderTestCase >> testUnaryArithmeticNoOperand [

	self
		should: [ 
			builder arithmeticUnaryOperationBuilder
				operator: #!;
				build ]
		raise: Error
]

{ #category : #'arithmetic operation' }
MOOperationBuilderTestCase >> testUnaryArithmeticNoOperator [

	self
		should: [ 
			builder arithmeticUnaryOperationBuilder
				operand: (builder variableReferenceBuilder
						 name: #i;
						 build);
				build ]
		raise: Error
]

{ #category : #'arithmetic operation' }
MOOperationBuilderTestCase >> testUnaryArithmeticPostfix [

	| operator |
	operator := builder arithmeticUnaryOperationBuilder
		            operand: (builder variableReferenceBuilder
				             name: #i;
				             build);
		            operator: #!;
						setAsPostfixOperator ;
		            build.
	self assert: operator isKindOf: MOUnaryArithmeticOperation.
	self assert: operator operator equals: #!. 
	self assert: operator order equals: #postfix. 
]

{ #category : #'arithmetic operation' }
MOOperationBuilderTestCase >> testUnaryArithmeticPrefix [

	| operator |
	operator := builder arithmeticUnaryOperationBuilder
		            operand: (builder variableReferenceBuilder
				             name: #i;
				             build);
		            operator: #!;
						setAsPrefixOperator;
		            build.
	self assert: operator isKindOf: MOUnaryArithmeticOperation.
	self assert: operator operator equals: #!. 
	self assert: operator order equals: #prefix. 
]

{ #category : #'boolean operation' }
MOOperationBuilderTestCase >> testUnaryBoolean [

	| operator |
	operator := builder arithmeticBooleanUnaryOperationBuilder
		            operand: (builder variableReferenceBuilder
				             name: #i;
				             build);
		            operator: #!;
		            build.
	self assert: operator isKindOf: MOUnaryBooleanOperation.
	self assert: operator operator equals: #!.
	self assert: operator order equals: #postfix
]

{ #category : #'boolean operation' }
MOOperationBuilderTestCase >> testUnaryBooleanNoOperand [

	self
		should: [ 
			builder arithmeticBooleanUnaryOperationBuilder
				operator: #!;
				setAsPostfixOperator;
				build ]
		raise: Error
]

{ #category : #'boolean operation' }
MOOperationBuilderTestCase >> testUnaryBooleanNoOperator [

	self
		should: [ 
			builder arithmeticBooleanUnaryOperationBuilder
				operand: (builder variableReferenceBuilder
						 name: #i;
						 build);
				setAsPostfixOperator;
				build ]
		raise: Error
]

{ #category : #'boolean operation' }
MOOperationBuilderTestCase >> testUnaryBooleanPostFix [

	| operator |
	operator := builder arithmeticBooleanUnaryOperationBuilder
		            operand: (builder variableReferenceBuilder
				             name: #i;
				             build);
		            operator: #!;
		            setAsPostfixOperator;
		            build.
	self assert: operator isKindOf: MOUnaryBooleanOperation.
	self assert: operator operator equals: #!.
	self assert: operator order equals: #postfix
]

{ #category : #'boolean operation' }
MOOperationBuilderTestCase >> testUnaryBooleanPreFix [

	| operator |
	operator := builder arithmeticBooleanUnaryOperationBuilder
		            operand: (builder variableReferenceBuilder
				             name: #i;
				             build);
		            operator: #!;
		            setAsPrefixOperator;
		            build.
	self assert: operator isKindOf: MOUnaryBooleanOperation.
	self assert: operator operator equals: #!.
	self assert: operator order equals: #prefix
]
