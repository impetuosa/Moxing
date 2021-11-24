Class {
	#name : #MOModelFactoryTestCase,
	#superclass : #TestCase,
	#instVars : [
		'builder'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #running }
MOModelFactoryTestCase >> assert: newClass isKindOf: aType [

	self assert: (newClass isKindOf: aType)
]

{ #category : #running }
MOModelFactoryTestCase >> setUp [

	super setUp.
	builder := MOModelBuilder new.
	builder model: MOModel new.
	builder model anchor: (MOAnchor on: #/).
	builder language:
		((MOLanguage newFor: builder model) name: 'TestLang') yourself
]

{ #category : #running }
MOModelFactoryTestCase >> testAssignmentBuilderGetsYouAnAssignment [

	| assingment read write |
	write := builder variableReferenceBuilder
		         name: #var;
		         build.
	read := builder variableReferenceBuilder
		        name: #param1;
		        build.
	assingment := builder assignmentBuilder
		              write: write;
		              read: read;
		              build.

	self assert: assingment isKindOf: MOAssignment.
	self assert: assingment read equals: read.
	self assert: assingment write equals: write
]

{ #category : #running }
MOModelFactoryTestCase >> testAttributeAccess [

	| access name1 name2 name3 |
	name1 := builder variableBuilder
		         name: #var;
		         build.
	name2 := builder variableReferenceBuilder
		         name: #field;
		         build.
	name3 := 'field2'.

	access := builder attributeAccessBuilder
		          addVariable: name1;
		          addVariableReference: name2;
		          addAttributeName: name3;
		          build.
	self assert: access isKindOf: MOAttributeAccess.
	self assert: access name equals: name3.
	self assert: access context name equals: name2 name.
	self assert: access context context name equals: name1 name
]

{ #category : #running }
MOModelFactoryTestCase >> testAttributeBuilderGetsYouAnAttribute [

	| param |
	param := builder attributeBuilder
		         name: #param1;
		         typeReference: (builder typeReferenceBuilder
				          name: 'String';
				          build);
		         build.
	self assert: param isKindOf: MOAttribute
]

{ #category : #running }
MOModelFactoryTestCase >> testBlockBuilderGetsABlock [

	| block |
	block := builder blockBuilder
		         addStatement: (builder variableBuilder
				          name: 'var';
				          typeReference: (builder typeReferenceBuilder
						           name: 'String';
						           build));
		         build.
	self assert: block isKindOf: MOBlock.
	self assert: block statements size equals: 1
]

{ #category : #running }
MOModelFactoryTestCase >> testBooleanLiteralBuilder [

	| literal |
	literal := builder booleanLiteralBuilder
		           value: true;
		           build.
	self assert: literal isKindOf: MOBooleanLiteral 
]

{ #category : #running }
MOModelFactoryTestCase >> testCastReferenceGetsCastedType [

	| parent class class2 variable varRef cast |
	parent := builder packageBuilder
		          name: #name;
		          build.

	class := builder classBuilder
		         name: #MyClass1;
		         package: parent;
		         build.
	class2 := builder classBuilder
		          name: #MyClass2;
		          package: parent;
		          build.

	variable := builder variableBuilder
		            type: class;
		            name: 'var';
		            build.
	varRef := builder variableReferenceBuilder
		          variable: variable;
		          build.

	cast := builder castExpressionBuilder
		        expression: varRef;
		        type: class2;
		        build.

	self assert: varRef type equals: class.
	self assert: varRef candidate equals: cast candidate. 
	self assert: cast expression equals: varRef.
	self assert: cast type equals: class2
]

{ #category : #running }
MOModelFactoryTestCase >> testDoUntilStatement [

	| while |
	while := builder doUntilStatementBuilder
		         condition: (builder comparisonOperatorBuilder
				          operator: #>;
				          left: (builder variableBuilder
						           name: 'var';
						           build);
				          right: (builder numericLiteralBuilder
						           value: 10;
						           build);
				          build);
		         loopingBlock: (builder blockBuilder
				          addStatement: (builder invocationBuilder
						           selector: #function;
						           addArgument: (builder booleanLiteralBuilder
								            value: true;
								            build)) build;
				          build);
		         build.
	self assert: while isKindOf: MODoUntil.
	self assert: while condition operator equals: #>.
	self assert: while loopingBlock statements size equals: 1
]

{ #category : #running }
MOModelFactoryTestCase >> testFloatLiteralBuilder [

	| literal |
	literal := builder numericLiteralBuilder
		           value: 10.6;
		           build.
	self assert: literal isKindOf: MOFloatLiteral
]

{ #category : #running }
MOModelFactoryTestCase >> testForStatement [

	| for |
	for := builder forStatementBuilder
		       initializeOperation: (builder variableBuilder
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
				        addStatement: (builder invocationBuilder
						         selector: #function;
						         addArgument: (builder booleanLiteralBuilder
								          value: true;
								          build)) build;
				        build);
		       build.
	self assert: for isKindOf: MOFor.
	self assert: for condition operator equals: #>.
	self assert: for initializeOperation isKindOf: MOVariable.
	self assert: for updateOperation isKindOf: MOUnaryArithmeticOperation.
	self assert: for loopingBlock statements size equals: 1
]

{ #category : #running }
MOModelFactoryTestCase >> testIfElseStatement [

	| if |
	if := builder ifStatementBuilder
		      condition: (builder comparisonOperatorBuilder
				       operator: #>;
				       left: (builder variableBuilder
						        name: 'var';
						        build);
				       right: (builder numericLiteralBuilder
						        value: 10;
						        build);
				       build);
		      ifFalseBlock:
			      (builder blockBuilder addStatement:
				       (builder invocationBuilder
					        selector: #function;
					        addArgument: (builder booleanLiteralBuilder
							         value: true;
							         build)));
		      build.
	self assert: if isKindOf: MOIfElse.
	self assert: if condition operator equals: #>.
	self assert: if ifFalse statements size equals: 1.
	self assert: if ifTrue statements size equals: 0
]

{ #category : #running }
MOModelFactoryTestCase >> testIfStatement [

	| if |
	if := builder ifStatementBuilder
		      condition: (builder comparisonOperatorBuilder
				       operator: #>;
				       left: (builder variableBuilder
						        name: 'var';
						        build);
				       right: (builder numericLiteralBuilder
						        value: 10;
						        build);
				       build);
		      ifTrueBlock:
			      (builder blockBuilder addStatement:
				       (builder invocationBuilder
					        selector: #function;
					        addArgument: (builder booleanLiteralBuilder
							         value: true;
							         build)));
		      build.
	self assert: if isKindOf: MOIfElse.
	self assert: if condition operator equals: #>.
	self assert: if ifTrue statements size equals: 1.
	self assert: if ifFalse statements size equals: 0
]

{ #category : #running }
MOModelFactoryTestCase >> testIntegerLiteralBuilder [

	| literal |
	literal := builder numericLiteralBuilder
		           value: 10;
		           build.
	self assert: literal isKindOf: MOIntegerLiteral
]

{ #category : #running }
MOModelFactoryTestCase >> testNewAddition [

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

{ #category : #running }
MOModelFactoryTestCase >> testNewClassGetsYouAClass [

	self
		assert: (builder classBuilder
				 name: 'name';
				 build)
		isKindOf: MOClass
]

{ #category : #running }
MOModelFactoryTestCase >> testNewClassInPackageGetsYouAClass [

	| class parent |
	parent := builder packageBuilder
		          name: #name;
		          build.
	class := builder classBuilder
		         name: #MyClass;
		         package: parent;
		         build.
	self assert: class parent isKindOf: MOPackageReference.
	self assert: class parent candidate equals: parent
]

{ #category : #running }
MOModelFactoryTestCase >> testNewClassWithSuperClassInPackageGetsYouAClass [

	| class superclass parent |
	parent := builder packageBuilder
		          name: #name;
		          build.
	superclass := builder classBuilder
		              name: #MyClass;
		              package: parent;
		              build.

	class := builder classBuilder
		         name: #MySubclass;
		         package: parent;
		         superclass: superclass;
		         build.


	self assert: class parent isKindOf: MOPackageReference.
	self assert: class parent candidate equals: parent.
	self assert: class superclass isKindOf: MOTypeReference.
	self assert: class superclass candidate equals: superclass
]

{ #category : #running }
MOModelFactoryTestCase >> testNewClassWithUnknownSuperClassInPackageGetsYouAClass [

	| class superclassReference parent |
	parent := builder packageBuilder
		          name: #name;
		          build.
	superclassReference := builder typeReferenceBuilder
		              name: #MyClass;
		              build.

	class := builder classBuilder
		         name: #MySubclass;
		         package: parent;
		         superclassReference: superclassReference;
		         build.


	self assert: class parent isKindOf: MOPackageReference.
	self assert: class parent candidate equals: parent.
	self assert: class superclass isKindOf: MOTypeReference.
	self assert: class superclass equals: superclassReference.
	self assert: class superclass candidate isNil
]

{ #category : #running }
MOModelFactoryTestCase >> testNewComparison [

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

{ #category : #running }
MOModelFactoryTestCase >> testNewFunctionGetsYouAFunction [

	| method body |
	body := builder blockBuilder
		        addStatement: (builder variableBuilder
				         name: 'var';
				         typeReference: (builder typeReferenceBuilder
						          name: 'String';
						          build));
		        addStatement: (builder assignmentBuilder
				         write: (builder variableReferenceBuilder
						          name: #var;
						          build);
				         read: (builder variableReferenceBuilder
						          name: #param1;
						          build);
				         build);
		        addStatement: (builder returnBuilder
				         returns: (builder variableReferenceBuilder
						          name: #var;
						          build);
				         build);
		        build.


	method := builder functionBuilder
		          body: body;
		          selector: 'hello';
		          returnTypeReference: (builder typeReferenceBuilder
				           name: 'String';
				           build);
		          addParameter: (builder parameterBuilder
				           name: #param1;
				           typeReference: (builder typeReferenceBuilder
						            name: 'String';
						            build);
				           build);
		          addParameter: (builder parameterBuilder
				           name: #param2;
				           typeReference: (builder typeReferenceBuilder
						            name: 'String';
						            build);
				           build);
		          build.

	self assert: method isKindOf: MOFunction.
	self assert: method returnTypeReference name equals: 'String'.
	self assert: method selector equals: 'hello'.
	self assert: method parameters size equals: 2.
	self assert: method block statements size equals: 3
]

{ #category : #running }
MOModelFactoryTestCase >> testNewImportGetsyouAnImport [

	| parent class |
	parent := builder packageBuilder
		          name: #name;
		          build.
	class := builder classBuilder
		         name: #MyClass;
		         package: parent;
		         build.
	self
		assert: (builder importBuilder
				 importType: class;
				 build)
		isKindOf: MOImport
]

{ #category : #running }
MOModelFactoryTestCase >> testNewImportGetsyouAnImportPointingToSingleType [

	| parent class import |
	parent := builder packageBuilder
		          name: #name;
		          build.
	class := builder classBuilder
		         name: #MyClass;
		         package: parent;
		         build.
	import := builder importBuilder
		          importType: class;
		          build.
	self assert: import typeReferences size equals: 1

]

{ #category : #running }
MOModelFactoryTestCase >> testNewImportGetsyouAnImportPointingToSingleTypeReference [

	| parent class import |
	parent := builder packageBuilder
		          name: #name;
		          build.
	class := builder typeReferenceBuilder
		         name: #MyClass;
		         build.
	import := builder importBuilder
		          importTypeReference: class;
		          build.
	self assert: import typeReferences size equals: 1
]

{ #category : #running }
MOModelFactoryTestCase >> testNewInvocationGetsYouAnInvocation [

	| invocation |
	invocation := builder invocationBuilder
		              selector: #function;
		              addArgument: (builder variableReferenceBuilder
				               name: #param1;
				               build);
		              addArgument: (builder variableReferenceBuilder
				               name: #param1;
				               build);
		              build.
	self assert: invocation isKindOf: MOInvocation.
	self assert: invocation arguments size equals: 2
]

{ #category : #running }
MOModelFactoryTestCase >> testNewMethodGetsYouAMethod [

	| method body |
	body := builder blockBuilder
		        addStatement: (builder variableBuilder
				         name: 'var';
				         typeReference: (builder typeReferenceBuilder
						          name: 'String';
						          build));
		        addStatement: (builder assignmentBuilder
				         write: (builder variableReferenceBuilder
						          name: #var;
						          build);
				         read: (builder variableReferenceBuilder
						          name: #param1;
						          build);
				         build);
		        addStatement: (builder returnBuilder
				         returns: (builder variableReferenceBuilder
						          name: #var;
						          build);
				         build);
		        build.


	method := builder methodBuilder
		          body: body;
		          selector: 'hello';
		          returnTypeReference: (builder typeReferenceBuilder
				           name: 'String';
				           build);
		          addParameter: (builder parameterBuilder
				           name: #param1;
				           typeReference: (builder typeReferenceBuilder
						            name: 'String';
						            build);
				           build);
		          addParameter: (builder parameterBuilder
				           name: #param2;
				           typeReference: (builder typeReferenceBuilder
						            name: 'String';
						            build);
				           build);
		          build.

	self assert: method isKindOf: MOMethod.
	self assert: method returnTypeReference name equals: 'String'.
	self assert: method selector equals: 'hello'.
	self assert: method parameters size equals: 2.
	self assert: method block statements size equals: 3
]

{ #category : #running }
MOModelFactoryTestCase >> testNewMethodGetsYouAMethodWithInvocations [

	| method body |
	body := builder blockBuilder
		        addStatement: (builder variableBuilder
				         name: 'var';
				         typeReference: (builder typeReferenceBuilder
						          name: 'String';
						          build));
		        addStatement: (builder assignmentBuilder
				         write: (builder variableReferenceBuilder
						          name: #var;
						          build);
				         read: (builder variableReferenceBuilder
						          name: #param1;
						          build);
				         build);
		        addStatement: (builder methodInvocationBuilder
				         selector: #method;
				         receiverReference: (builder variableReferenceBuilder
						          name: #param2;
						          build);
				         addArgument: (builder variableReferenceBuilder
						          name: #param1;
						          build);
				         addArgument: (builder variableReferenceBuilder
						          name: #param1;
						          build);
				         build);
		        addStatement: (builder invocationBuilder
				         selector: #function;
				         addArgument: (builder variableReferenceBuilder
						          name: #param1;
						          build);
				         addArgument: (builder variableReferenceBuilder
						          name: #param1;
						          build)) build;
		        addStatement: (builder returnBuilder
				         returns: (builder variableReferenceBuilder
						          name: #var;
						          build);
				         build);
		        build.


	method := builder methodBuilder
		          body: body;
		          selector: 'hello';
		          returnTypeReference: (builder typeReferenceBuilder
				           name: 'String';
				           build);
		          addParameter: (builder parameterBuilder
				           name: #param1;
				           typeReference: (builder typeReferenceBuilder
						            name: 'String';
						            build);
				           build);
		          addParameter: (builder parameterBuilder
				           name: #param2;
				           typeReference: (builder typeReferenceBuilder
						            name: 'String';
						            build);
				           build);
		          build.

	self assert: method isKindOf: MOMethod.
	self assert: method returnTypeReference name equals: 'String'.
	self assert: method selector equals: 'hello'.
	self assert: method parameters size equals: 2.
	self assert: method block statements size equals: 5
]

{ #category : #running }
MOModelFactoryTestCase >> testNewMethodInvocationGetsYouAMethodInvocation [

	| invocation |
	invocation := builder methodInvocationBuilder
		              selector: #method;
		              receiverReference: (builder variableReferenceBuilder
				               name: #param2;
				               build);
		              addArgument: (builder variableReferenceBuilder
				               name: #param1;
				               build);
		              addArgument: (builder variableReferenceBuilder
				               name: #param1;
				               build);
		              build.
	self assert: invocation receiverReference name equals: #param2.
	self assert: invocation isKindOf: MOMethodInvocation.
	self assert: invocation arguments size equals: 2
]

{ #category : #running }
MOModelFactoryTestCase >> testNewPackageGetsYouAPackage [

	self
		assert: (builder packageBuilder
				 name: #name;
				 build)
		isKindOf: MOPackage
]

{ #category : #running }
MOModelFactoryTestCase >> testNewProcedureGetsYouAProcedure [

	| method body |
	body := builder blockBuilder
		        addStatement: (builder variableBuilder
				         name: 'var';
				         typeReference: (builder typeReferenceBuilder
						          name: 'String';
						          build));
		        addStatement: (builder assignmentBuilder
				         write: (builder variableReferenceBuilder
						          name: #var;
						          build);
				         read: (builder variableReferenceBuilder
						          name: #param1;
						          build);
				         build);
		        addStatement: (builder returnBuilder
				         returns: (builder variableReferenceBuilder
						          name: #var;
						          build);
				         build);
		        build.


	method := builder procedureBuilder
		          body: body;
		          selector: 'hello';
		          addParameter: (builder parameterBuilder
				           name: #param1;
				           typeReference: (builder typeReferenceBuilder
						            name: 'String';
						            build);
				           build);
		          addParameter: (builder parameterBuilder
				           name: #param2;
				           typeReference: (builder typeReferenceBuilder
						            name: 'String';
						            build);
				           build);
		          build.

	self assert: method isKindOf: MOProcedure.
	self assert: method selector equals: 'hello'.
	self assert: method parameters size equals: 2.
	self assert: method block statements size equals: 3
]

{ #category : #running }
MOModelFactoryTestCase >> testNewSubPackage [

	| pack parent |
	parent := builder packageBuilder
		          name: #name;
		          build.
	pack := builder packageBuilder
		        name: #pack;
		        parent: parent;
		        build.

	self assert: pack isKindOf: MOPackage.
	self assert: pack parent isKindOf: MOPackageReference.
	self assert: pack parent candidate equals: parent.
	self assert: (parent subpackages includes: pack)
]

{ #category : #running }
MOModelFactoryTestCase >> testParameterBuilderGetsYouAParameter [

	| param |
	param := builder parameterBuilder
		         name: #param1;
		         typeReference: (builder typeReferenceBuilder
				          name: 'String';
				          build);
		         build.
	self assert: param isKindOf: MOParameter
]

{ #category : #running }
MOModelFactoryTestCase >> testReturnExpressionBuilderOverEmpty [

	| return |
	return := builder returnBuilder build.
	self assert: return isKindOf: MOReturnEmpty
]

{ #category : #running }
MOModelFactoryTestCase >> testReturnExpressionBuilderOverExpression [

	| return expression |
	expression := builder variableReferenceBuilder
		              name: #var;
		              build.
	return := builder returnBuilder
		          returns: expression;
		          build.
	self assert: return isKindOf: MOReturn.
	
	self assert: return expression equals: expression
]

{ #category : #running }
MOModelFactoryTestCase >> testStringLiteralBuilder [

	| literal |
	literal := builder stringLiteralBuilder
		           value: 'Literal';
		           build.
	self assert: literal isKindOf: MOStringLiteral
]

{ #category : #running }
MOModelFactoryTestCase >> testTypedReferenceGetsTheTypeIfPossible [

	| class parent boundedClassReference unboundClassReference |
	parent := builder packageBuilder
		          name: #name;
		          build.

	class := builder classBuilder
		         name: #MySubclass;
		         package: parent;
		         build.
	boundedClassReference := builder typeReferenceBuilder
		                         type: class;
		                         build.
	unboundClassReference := builder typeReferenceBuilder
		                         name: #MyClass;
		                         build.
	self assert: boundedClassReference type equals: class. 
	self assert: unboundClassReference type equals: nil. 


]

{ #category : #running }
MOModelFactoryTestCase >> testUnaryArithetic [

	| operator |
	operator := builder arithmeticUnaryOperationBuilder
		            operand: (builder variableReferenceBuilder
				             name: #i;
				             build);
		            operator: #!;
		            build.
	self assert: operator isKindOf: MOUnaryArithmeticOperation
]

{ #category : #running }
MOModelFactoryTestCase >> testVariableBuilderGetsYouVariable [

	| param |
	param := builder variableBuilder
		         name: #param1;
		         typeReference: (builder typeReferenceBuilder
				          name: 'String';
				          build);
		         build.
	self assert: param isKindOf: MOVariable
]

{ #category : #running }
MOModelFactoryTestCase >> testVariableReferenceOverAttribute [

	| param reference |
	param := builder attributeBuilder
		         name: #param1;
		         typeReference: (builder typeReferenceBuilder
				          name: 'String';
				          build);
		         build.
	reference := builder variableReferenceBuilder
		             variable: param;
		             build.
	self assert: reference isKindOf: MOVariableReference. 
	self assert: reference candidate equals: param. 
]

{ #category : #running }
MOModelFactoryTestCase >> testVariableReferenceOverParameter [

	| param reference |
	param := builder parameterBuilder
		         name: #param1;
		         typeReference: (builder typeReferenceBuilder
				          name: 'String';
				          build);
		         build.
	reference := builder variableReferenceBuilder
		             variable: param;
		             build.
	self assert: reference isKindOf: MOVariableReference. 
	self assert: reference candidate equals: param. 
]

{ #category : #running }
MOModelFactoryTestCase >> testVariableReferenceOverVariable [

	| param reference |
	param := builder variableBuilder
		         name: #param1;
		         typeReference: (builder typeReferenceBuilder
				          name: 'String';
				          build);
		         build.
	reference := builder variableReferenceBuilder
		             variable: param;
		             build.
	self assert: reference isKindOf: MOVariableReference. 
	self assert: reference candidate equals: param. 
]

{ #category : #running }
MOModelFactoryTestCase >> testWhileStatement [

	| while |
	while := builder whileStatementBuilder
		         condition: (builder comparisonOperatorBuilder
				          operator: #>;
				          left: (builder variableBuilder
						           name: 'var';
						           build);
				          right: (builder numericLiteralBuilder
						           value: 10;
						           build);
				          build);
		         loopingBlock: (builder blockBuilder
				          addStatement: (builder invocationBuilder
						           selector: #function;
						           addArgument: (builder booleanLiteralBuilder
								            value: true;
								            build)) build;
				          build);
		         build.
	self assert: while isKindOf: MOWhile.
	self assert: while condition operator equals: #>.
	self assert: while loopingBlock statements size equals: 1
]
