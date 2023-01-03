Class {
	#name : #MOModelFactoryTestCase,
	#superclass : #MOBuilderTestCase,
	#category : #'Moxing-MicroBuilderTest'
}

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
		         addStatement: (builder localVariableBuilder
				          name: 'var';
				          typeReference: (builder typeReferenceBuilder
						           name: 'String';
						           build);
				          build);
		         build.
	self assert: block isKindOf: MOBlock.
	self assert: block statements size equals: 1
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

	variable := builder localVariableBuilder
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
	self assert: varRef referee equals: cast referee. 
	self assert: cast expression equals: varRef.
	self assert: cast type equals: class2
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
	self assert: class parent isKindOf: MOPackage.
	self assert: class packageReference isKindOf: MOPackageReference.
	self assert: class packageReference referee equals: parent
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


	self assert: class parent isKindOf: MOPackage.
	self assert: class packageReference isKindOf: MOPackageReference.
	self assert: class packageReference referee equals: parent.
	self assert: class superclassReference isKindOf: MOTypeReference.
	self assert: class superclassReference referee equals: superclass.

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


	self assert: class parent isKindOf: MOPackage.
	self assert: class packageReference isKindOf: MOPackageReference.
	self assert: class packageReference referee equals: parent.
	self assert: class superclassReference isKindOf: MOTypeReference.
	self assert: class superclassReference equals: superclassReference.
	self assert: class superclassReference referee isNil
]

{ #category : #running }
MOModelFactoryTestCase >> testNewFunctionGetsYouAFunction [

	| method body |
	body := builder blockBuilder
		        addStatement: (builder localVariableBuilder
				         name: 'var';
				         typeReference: (builder typeReferenceBuilder
						          name: 'String';
						          build);
				         build);
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
	self assert: import typeReference isNotNil 

]

{ #category : #running }
MOModelFactoryTestCase >> testNewImportGetsyouAnImportPointingToSingleTypeReference [

	| package class import |
	package := builder packageReferenceBuilder
		           packageName: #name;
		           build.
	class := builder typeReferenceBuilder
		         name: #MyClass;
		         build.
	import := builder importBuilder
		          importTypeReference: class;
		          packageReference: package;
		          build.
	self assert: import typeReference isNotNil
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
		        addStatement: (builder localVariableBuilder
				         name: 'var';
				         typeReference: (builder typeReferenceBuilder
						          name: 'String';
						          build);
				         build);
		        build;
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
		        addExpressionStatement: (builder localVariableBuilder
				         name: 'var';
				         typeReference: (builder typeReferenceBuilder
						          name: 'String';
						          build);
				         build);
		        addExpressionStatement: (builder assignmentBuilder
				         write: (builder variableReferenceBuilder
						          name: #var;
						          build);
				         read: (builder variableReferenceBuilder
						          name: #param1;
						          build);
				         build);
		        addExpressionStatement: (builder methodInvocationBuilder
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
		        addExpressionStatement: (builder invocationBuilder
				         selector: #function;
				         addArgument: (builder variableReferenceBuilder
						          name: #param1;
						          build);
				         addArgument: (builder variableReferenceBuilder
						          name: #param1;
						          build)) build;
		        addExpressionStatement: (builder returnBuilder
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
		        addStatement: (builder localVariableBuilder
				         name: 'var';
				         typeReference: (builder typeReferenceBuilder
						          name: 'String';
						          build);
				         build);
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
MOModelFactoryTestCase >> testVariableBuilderGetsYouVariable [

	| param |
	param := builder localVariableBuilder
		         name: #param1;
		         typeReference: (builder typeReferenceBuilder
				          name: 'String';
				          build);
		         build.
	self assert: param isKindOf: MOLocalVariable
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
	self assert: reference referee equals: param. 
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
	self assert: reference referee equals: param. 
]

{ #category : #running }
MOModelFactoryTestCase >> testVariableReferenceOverVariable [

	| param reference |
	param := builder localVariableBuilder
		         name: #param1;
		         typeReference: (builder typeReferenceBuilder
				          name: 'String';
				          build);
		         build.
	reference := builder variableReferenceBuilder
		             variable: param;
		             build.
	self assert: reference isKindOf: MOVariableReference. 
	self assert: reference referee equals: param. 
]
