Class {
	#name : #MOJavaFileLoader,
	#superclass : #Object,
	#instVars : [
		'writer',
		'imports',
		'package',
		'packageReference'
	],
	#category : #'Moxing-Java-Loader'
}

{ #category : #accessing }
MOJavaFileLoader >> imports [

	^ imports ifNil: [ imports := OrderedCollection new ]
]

{ #category : #'as yet unclassified' }
MOJavaFileLoader >> initializerStatementFor: aJavaNewNode [

	^ MOJavaDetachedStatementBuilder new
		  writer: writer;
		  load: aJavaNewNode
]

{ #category : #testing }
MOJavaFileLoader >> isFullName: aString [

	^ (aString indexOf: $.) > 0
]

{ #category : #visiting }
MOJavaFileLoader >> load: anAst [

	| ret |
	writer autoPopulate: false.
	
	ret := anAst acceptVisitor: self.
	writer populateAnchorOn: writer model root.
	^ ret
]

{ #category : #visiting }
MOJavaFileLoader >> registerJavaDefaultImports [
	self imports add:
		(writer writeImport: [ :import | 
			 import importAllTypesOnPackage: 'java.lang' ])
]

{ #category : #initialization }
MOJavaFileLoader >> setPosition: aMOMethodWriter from: aJavaMethodDeclarationNode [

	aMOMethodWriter
		from: aJavaMethodDeclarationNode startPosition
		to: aJavaMethodDeclarationNode stopPosition
]

{ #category : #'as yet unclassified' }
MOJavaFileLoader >> typeReferenceFor: aJavaClassTypeNode using: aWriter [

	aJavaClassTypeNode ifNil: [ 
		self assert: writer writingType = MOLambda.
		^ writer typeReferenceNamed: #Object ].
	^ MOJavaTypeReferenceVisitor new
		  writer: aWriter;
		  typeReferenceFor: aJavaClassTypeNode
]

{ #category : #evaluating }
MOJavaFileLoader >> use: aWriter during: aBlock [

	| prev |
	prev := writer.
	writer := aWriter.
	^ aBlock ensure: [ writer := prev ]
]

{ #category : #'as yet unclassified' }
MOJavaFileLoader >> variableReferenceFor: aJavaNameNode [

	^ MOJavaVariableReference new
		  writer: writer;
		  load: aJavaNameNode
]

{ #category : #visiting }
MOJavaFileLoader >> visitAbstractMethodDeclaration: aJavaAbstractMethodDeclarationNode [

	aJavaAbstractMethodDeclarationNode typeParameters
		ifNil: [ 
		self writeAbstractMethodWith: aJavaAbstractMethodDeclarationNode ]
		ifNotNil: [ 
			self writeParametrizableAbstractMethodWith:
				aJavaAbstractMethodDeclarationNode ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitAnnotation: aJavaAnnotationNode [

	^ writer writeAnnotation: [ :annotation | 
		  annotation annotationTypeReference:
			  (self
				   typeReferenceFor: aJavaAnnotationNode name
				   using: annotation).
		  self use: annotation during: [ 
			  annotation arguments:
				  (self visitCollection: aJavaAnnotationNode values) ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitArrayAccess: aJavaArrayAccessNode [

	^ writer
		  arrayAccess: [ :expr | 
			  self
				  use: expr
				  during: [ aJavaArrayAccessNode array acceptVisitor: self ] ]
		  arguments: [ :expr | 
			  self
				  use: expr
				  during: [ 
				  { (aJavaArrayAccessNode expression acceptVisitor: self) } ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitAssignment: aJavaAssignmentNode [

	^ writer
		  let: [ :exp | 
			  self
				  use: exp
				  during: [ aJavaAssignmentNode variable acceptVisitor: self ] ]
		  beAssignedWith: [ :exp | 
			  self
				  use: exp
				  during: [ aJavaAssignmentNode value acceptVisitor: self ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitBinaryExpression: aJavaBinaryExpressionNode [

	^ writer
		  operate: [ :exp | 
			  self
				  use: exp
				  during: [ 
				  aJavaBinaryExpressionNode leftExpression acceptVisitor: self ] ]
		  operator: aJavaBinaryExpressionNode op value asSymbol
		  with: [ :exp | 
			  self
				  use: exp
				  during: [ 
				  aJavaBinaryExpressionNode rightExpression acceptVisitor: self ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitBlock: aJavaBlockNode [

	^ writer writeBlock: [ :block | 
		  aJavaBlockNode statements collect: [ :s | 
			  block writeStatement: [ :stmt | 
				  self use: stmt during: [ s acceptVisitor: self ] ] ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitBooleanLiteral: aJavaBooleanLiteralNode [

	^ writer booleanLiteral:
		  aJavaBooleanLiteralNode token value asLowercase = 'true'
]

{ #category : #visiting }
MOJavaFileLoader >> visitCastExpression: aJavaCastExpressionNode [

	^ writer
		  cast: [ :expr | 
			  self
				  use: expr
				  during: [ 
				  aJavaCastExpressionNode expression acceptVisitor: self ] ]
		  to: [ :expr | 
			  self
				  use: expr
				  during: [ 
				  self typeReferenceFor: aJavaCastExpressionNode type using: expr ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitCatchClause: aJavaCatchClauseNode [

	| typeName |
	self assert: aJavaCatchClauseNode parameter types size = 1.
	typeName := aJavaCatchClauseNode parameter types first name name
		            value.
	^ writer writeCatch: [ :catch | 
		  catch writeParameter: [ :e | 
			  e
				  name: aJavaCatchClauseNode parameter variable name value;
				  typeReference: (e typeReferenceNamed: typeName) ].
		  catch writeBlock: [ :catchBlock | 
			  self
				  use: catchBlock
				  during: [ aJavaCatchClauseNode block acceptVisitor: self ] ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitCharacterLiteral: aJavaCharacterLiteralNode [

	^ writer characterLiteral:
		  aJavaCharacterLiteralNode token value second
]

{ #category : #visiting }
MOJavaFileLoader >> visitClassDeclaration: aJavaClassDeclarationNode [

	| name typeParameters |
	" the name of the class Class<T> is Class "
	name := aJavaClassDeclarationNode name source readStream upToAll: '<'.
	(writer model entities contains: [ :a | 
		 (a isKindOf: MOClass) and: [ a fullName = name ] ]) ifTrue: [ 
		^ self ].
	typeParameters := aJavaClassDeclarationNode typeParameters.
	typeParameters := typeParameters
		                  ifNil: [ 
		                  aJavaClassDeclarationNode name name arguments ]
		                  ifNotNil: [ typeParameters parameters ].
	typeParameters isEmptyOrNil
		ifTrue: [ 
		self writeClassWith: aJavaClassDeclarationNode named: name ]
		ifFalse: [ 
			self
				writeParametrizableClassWith: aJavaClassDeclarationNode
				named: name ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitClassExpression: aJavaClassExpressionNode [

	^ self typeReferenceFor: aJavaClassExpressionNode type using: writer
]

{ #category : #visiting }
MOJavaFileLoader >> visitClassType: aJavaClassTypeNode [

	^ self typeReferenceFor: aJavaClassTypeNode using: writer
]

{ #category : #visiting }
MOJavaFileLoader >> visitCollection: aCollection [

	^ aCollection collect: [ :a | a accept: self ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitConditionalExpression: aJavaConditionalExpressionNode [

	^ writer
		  conditionalExpression: [ :exp | 
			  self
				  use: exp
				  during: [ 
				  aJavaConditionalExpressionNode testExpression acceptVisitor:
					  self ] ]
		  ifTrue: [ :exp | 
			  self
				  use: exp
				  during: [ 
				  aJavaConditionalExpressionNode trueExpression acceptVisitor:
					  self ] ]
		  ifFalse: [ :exp | 
			  self
				  use: exp
				  during: [ 
				  aJavaConditionalExpressionNode falseExpression acceptVisitor:
					  self ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitConstructorDeclaration: aJavaConstructorDeclarationNode [

	writer writeConstructor: [ :constructor | 
		self setPosition: constructor from: aJavaConstructorDeclarationNode.
		aJavaConstructorDeclarationNode throws ifNotNil: [ :th | 
			th classTypes do: [ :typeNode | 
				constructor addThrownTypeReference:
					(self typeReferenceFor: typeNode using: constructor) ] ].
		self use: constructor during: [ 
			aJavaConstructorDeclarationNode typeParameters ifNotNil: [ :p | 
				self visitCollection: p parameters ].
			self visitCollection: aJavaConstructorDeclarationNode modifiers.
			self visitCollection: aJavaConstructorDeclarationNode parameters.
			aJavaConstructorDeclarationNode body acceptVisitor: self ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitContinueStatement: aJavaContinueStatementNode [

	^ writer continue
]

{ #category : #visiting }
MOJavaFileLoader >> visitDimensionExpression: aJavaDimensionExpressionNode [

	^ aJavaDimensionExpressionNode expression acceptVisitor: self
]

{ #category : #visiting }
MOJavaFileLoader >> visitDoWhileStatement: aJavaDoWhileStatementNode [

	^ writer
		  do: [ :block | 
			  self
				  writeStatementOrBlock: aJavaDoWhileStatementNode statement
				  into: block ]
		  while: [ :exp | 
			  self
				  use: exp
				  during: [ 
				  aJavaDoWhileStatementNode expression acceptVisitor: self ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitElementArrayInitializer: aJavaElementArrayInitializerNode [

	^ self visitCollection: aJavaElementArrayInitializerNode values
]

{ #category : #visiting }
MOJavaFileLoader >> visitElementValuePair: aJavaElementValuePairNode [

	| expression |
	expression := writer writeUnregisteredExpression: [ :e | 
		              self
			              use: e
			              during: [ 
			              aJavaElementValuePairNode value acceptVisitor: self ] ].

	^ writer writeUnregisteredExpression: [ :ue | 
		  expression isCollection
			  ifTrue: [ 
				  ue
					  argumentNamed: aJavaElementValuePairNode name source
					  expressions: [ :e | expression ] ]
			  ifFalse: [ 
				  ue
					  singleArgumentNamed: aJavaElementValuePairNode name source
					  expression: [ :e | expression ] ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitEmptyDeclaration: aJavaEmptyDeclarationNode [

	^ writer noOp: 'Empty Declaration '
]

{ #category : #visiting }
MOJavaFileLoader >> visitEmptyMethodBody: aJavaEmptyMethodBodyNode [ 
	self halt.
	^ writer noOp: 'Empty Method'
]

{ #category : #visiting }
MOJavaFileLoader >> visitEmptyStatement: aJavaEmptyStatementNode [

	^ writer noOp: 'Empty Statement '
]

{ #category : #visiting }
MOJavaFileLoader >> visitEnumConstant: aJavaEnumConstantNode [

	self assert: aJavaEnumConstantNode declarations isEmpty.
	self assert: aJavaEnumConstantNode annotations isEmpty.
	^ writer writeEntry: [ :entry | 
		  entry name: aJavaEnumConstantNode name value.
		  entry value:
			  (aJavaEnumConstantNode expressions acceptVisitor: self) ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitEnumDeclaration: aJavaEnumDeclarationNode [

	writer writeJavaEnum: [ :enum | 
		enum name: aJavaEnumDeclarationNode name source.
		self use: enum during: [ 
			self visitCollection: aJavaEnumDeclarationNode modifiers.
			self visitCollection: aJavaEnumDeclarationNode constants.
			self visitCollection: aJavaEnumDeclarationNode declarations ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitExpressionStatement: aJavaExpressionStatementNode [

	^ writer writeStatement: [ :s | 
		  self
			  use: s
			  during: [ 
			  aJavaExpressionStatementNode expression acceptVisitor: self ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitFieldAccess: aJavaFieldAccessNode [

	^ writer
		  accessAttribute: aJavaFieldAccessNode name value
		  receiver: [ :exp | 
			  self
				  use: exp
				  during: [ aJavaFieldAccessNode receiver acceptVisitor: self ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitFieldDeclaration: aJavaFieldDeclarationNode [

	aJavaFieldDeclarationNode variableDeclarations do: [ :decl | 
		writer writeAttribute: [ :attribute | 
			attribute name: decl variable source.
			attribute typeReference:
				(self typeReferenceFor: aJavaFieldDeclarationNode type using: attribute).
			self
				use: attribute
				during: [ 
				self visitCollection: aJavaFieldDeclarationNode modifiers ] ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitFloatLiteral: aJavaFloatLiteralNode [

	^ writer numericLiteral: aJavaFloatLiteralNode token value asNumber
]

{ #category : #visiting }
MOJavaFileLoader >> visitForEachStatement: aJavaForEachStatementNode [

	^ writer
		  for: [ :exp | 
			  exp
				  variable: aJavaForEachStatementNode name name value
				  typeReference:
				  (self
					   typeReferenceFor: aJavaForEachStatementNode type
					   using: exp) ]
		  in: [ :exp | 
			  self
				  use: exp
				  during: [ 
				  aJavaForEachStatementNode expression acceptVisitor: self ] ]
		  do: [ :block | 
			  self
				  writeStatementOrBlock: aJavaForEachStatementNode statement
				  into: block ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitForStatement: aJavaForStatementNode [

	^ writer
		  for: [ :exp | 
			  self
				  use: exp
				  during: [ aJavaForStatementNode initial acceptVisitor: self ] ]
		  condition: [ :exp | 
			  self
				  use: exp
				  during: [ aJavaForStatementNode test acceptVisitor: self ] ]
		  update: [ :exp | 
			  self use: exp during: [ 
				  aJavaForStatementNode _update
					  ifNil: [ {  } ]
					  ifNotNil: [ :u | u acceptVisitor: self ] ] ]
		  do: [ :block | 
			  self
				  writeStatementOrBlock: aJavaForStatementNode statement
				  into: block ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitIfElseStatement: aJavaIfElseStatementNode [

	^ writer
		  if: [ :expression | 
			  self
				  use: expression
				  during: [ 
				  aJavaIfElseStatementNode expression acceptVisitor: self ] ]
		  ifTrue: [ :ifTrueBlockWriter | 
			  self
				  writeStatementOrBlock: aJavaIfElseStatementNode trueStatement
				  into: ifTrueBlockWriter ]
		  ifFalse: [ :ifFalseBlockWriter | 
			  self
				  writeStatementOrBlock: aJavaIfElseStatementNode falseStatement
				  into: ifFalseBlockWriter ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitIfStatement: aJavaIfStatementNode [

	^ writer
		  if: [ :expression | 
			  self
				  use: expression
				  during: [ aJavaIfStatementNode expression acceptVisitor: self ] ]
		  ifTrue: [ :ifTrueBlockWriter | 
			  self
				  writeStatementOrBlock: aJavaIfStatementNode trueStatement
				  into: ifTrueBlockWriter ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitInitializedVariableDeclaration: aJavaInitializedVariableDeclarationNode [

	writer
		name: aJavaInitializedVariableDeclarationNode variable name source;
		initializer: (writer writeUnregisteredExpression: [ :expression | 
					 self use: expression during: [ 
							 aJavaInitializedVariableDeclarationNode initializer 
								 acceptVisitor: self ] ])
]

{ #category : #visiting }
MOJavaFileLoader >> visitIntegerLiteral: aJavaIntegerLiteralNode [

	^ writer numericLiteral:
		  aJavaIntegerLiteralNode token value asInteger
]

{ #category : #visiting }
MOJavaFileLoader >> visitInterfaceDeclaration: aJavaInterfaceDeclarationNode [

	| name typeParameters |
	name := aJavaInterfaceDeclarationNode name source readStream 
		        upToAll: '<'.
	self assert:
		aJavaInterfaceDeclarationNode interfaceToken value = 'interface'.
	(writer model entities contains: [ :a | 
		 (a isKindOf: MOClassType) and: [ a fullName = name ] ]) ifTrue: [ 
		^ self ].
	writer package: package.
	typeParameters := aJavaInterfaceDeclarationNode typeParameters.
	typeParameters := typeParameters
		                  ifNil: [ 
		                  aJavaInterfaceDeclarationNode name name arguments ]
		                  ifNotNil: [ typeParameters parameters ].
	typeParameters isEmptyOrNil
		ifTrue: [ 
		self writeClassTypeWith: aJavaInterfaceDeclarationNode named: name ]
		ifFalse: [ 
			self
				writeParametrizableClassTypeWith: aJavaInterfaceDeclarationNode
				named: name ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitLambdaExpression: aJavaLambdaExpressionNode [

	| value |
	" 
	  In java a lambda with a single expression is understood to be returning that expression. 
	  In the rest of the cases works like a normal block .
	"
	value := aJavaLambdaExpressionNode value.
	^ writer writeLambda: [ :lambda | 
		  self
			  use: lambda
			  during: [ 
			  self visitCollection: aJavaLambdaExpressionNode parameters ].
		  lambda writeBlock: [ :block | 
			  ((value isKindOf: JavaBlockNode) or: [ 
				   value isKindOf: JavaReturnStatementNode ])
				  ifTrue: [ self writeStatementOrBlock: value into: block ]
				  ifFalse: [ 
					  block writeReturn: [ :ret | 
						  ret writeExpression: [ :expr | 
							  self use: expr during: [ value acceptVisitor: self ] ] ] ] ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitLocalVariableDeclaration: aJavaLocalVariableDeclarationNode [

	^ aJavaLocalVariableDeclarationNode variableDeclarations collect: [ 
		  :decl | 
		  writer writeVariable: [ :var | 
			  self use: var during: [ decl acceptVisitor: self ].
			  var typeReference: (self
					   typeReferenceFor: aJavaLocalVariableDeclarationNode type
					   using: var) ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitLocalVariableDeclarationStatement: aJavaLocalVariableDeclarationStatementNode [

	^ aJavaLocalVariableDeclarationStatementNode declaration 
		  acceptVisitor: self
]

{ #category : #visiting }
MOJavaFileLoader >> visitMethodDeclaration: aJavaMethodDeclarationNode [

	aJavaMethodDeclarationNode typeParameters
		ifNil: [ self writeMethodWith: aJavaMethodDeclarationNode ]
		ifNotNil: [ 
		self writeParametrizableMethodWith: aJavaMethodDeclarationNode ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitMethodDeclarator: aJavaMethodDeclaratorNode [
	aJavaMethodDeclaratorNode name value = #sessionFactory ifTrue: [ self halt ].
	writer selector: aJavaMethodDeclaratorNode name value.
	self visitCollection: aJavaMethodDeclaratorNode parameters
]

{ #category : #visiting }
MOJavaFileLoader >> visitMethodInvocation: aJavaMethodInvocationNode [

	self assert: aJavaMethodInvocationNode arguments isEmpty.

	^ writer
		  invokeMethodNamed: aJavaMethodInvocationNode name source
		  receiver: [ :expression | 
			  aJavaMethodInvocationNode receiver
				  ifNil: [ expression referenceToSelf ]
				  ifNotNil: [ 
					  self
						  use: expression
						  during: [ 
						  aJavaMethodInvocationNode receiver acceptVisitor: self ] ] ]
		  arguments: [ :expression | 
			  self
				  use: expression
				  during: [ 
				  self visitCollection: aJavaMethodInvocationNode expressions ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitMethodReference: aJavaMethodReferenceNode [

	^ writer
		  accessMethod: aJavaMethodReferenceNode name value
		  receiver: [ :expr | 
			  self
				  use: expr
				  during: [ aJavaMethodReferenceNode receiver acceptVisitor: self ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitModifier: aJavaModifierNode [ 
	writer addModifier: aJavaModifierNode token value 
	 
]

{ #category : #visiting }
MOJavaFileLoader >> visitName: aJavaNameNode [ 
	^ self variableReferenceFor: aJavaNameNode 
]

{ #category : #visiting }
MOJavaFileLoader >> visitNew: aJavaNewNode [

	^ writer
		  invokeNewExpressionOnType:
		  (self typeReferenceFor: aJavaNewNode type using: writer)
		  withArguments: (self visitCollection: aJavaNewNode arguments)
]

{ #category : #visiting }
MOJavaFileLoader >> visitNewArray: aJavaNewArrayNode [

	^ writer
		  new: (writer arrayTypeReferenceOf:
				   (self typeReferenceFor: aJavaNewArrayNode type using: writer))
		  arguments: [ :expr | 
			  self
				  use: expr
				  during: [ 
				  self visitCollection: aJavaNewArrayNode dimExpressions ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitNewClass: aJavaNewClassNode [

	^ writer
		  new: (aJavaNewClassNode type name acceptVisitor: self)
		  arguments: [ :expr | 
			  self
				  use: expr
				  during: [ self visitCollection: aJavaNewClassNode arguments ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitNull: aJavaNullNode [ 
	^ writer nullLiteral 
]

{ #category : #visiting }
MOJavaFileLoader >> visitPackageDeclaration: aJavaPackageDeclarationNode [

	package := writer
		           writePackageNamed:
		           aJavaPackageDeclarationNode name source
		           ifDoesNotExistUsing: [ :p | 
		           p name: aJavaPackageDeclarationNode name source ].
	packageReference := writer packageReferenceNamed:
		                    aJavaPackageDeclarationNode name source
]

{ #category : #visiting }
MOJavaFileLoader >> visitParameter: aJavaParameterNode [

	writer writeParameter: [ :parameter | 
		parameter name: (aJavaParameterNode variable
				 ifNil: [ 
					 'generatedParamName'
					 ,
						 (aJavaParameterNode parent parameters indexOf:
							  aJavaParameterNode) asString ]
				 ifNotNil: [ :var | var source ]).
		parameter typeReference:
			(self typeReferenceFor: aJavaParameterNode type using: parameter).
		self
			use: parameter
			during: [ self visitCollection: aJavaParameterNode modifiers ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitPostDecrementExpression: aJavaPostDecrementExpressionNode [ 

	^ writer
		  postfixOperate: [ :exp | 
			  self
				  use: exp
				  during: [ 
				  aJavaPostDecrementExpressionNode expression acceptVisitor: self ] ]
		  operator: aJavaPostDecrementExpressionNode minusMinus value
]

{ #category : #visiting }
MOJavaFileLoader >> visitPostIncrementExpression: aJavaPostIncrementExpressionNode [

	^ writer
		  postfixOperate: [ :exp | 
			  self
				  use: exp
				  during: [ 
				  aJavaPostIncrementExpressionNode expression acceptVisitor: self ] ]
		  operator: aJavaPostIncrementExpressionNode plusPlus value
]

{ #category : #visiting }
MOJavaFileLoader >> visitProgram: aProgram [

	^ self visitCollection: aProgram sortedChildren
]

{ #category : #visiting }
MOJavaFileLoader >> visitProgramFile: aJavaProgramFileNode [

	| produced |
	^ produced := writer writeDeclarationUnit: [ :unit | 
		              self registerJavaDefaultImports.
		              self
			              use: unit
			              during: [ self visitProgram: aJavaProgramFileNode ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitQualifiedName: aJavaQualifiedNameNode [

	^ writer
		  accessAttribute: aJavaQualifiedNameNode name value
		  receiver: [ :exp | 
			  self
				  use: exp
				  during: [ aJavaQualifiedNameNode nspace acceptVisitor: self ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitQualifiedTypeName: aJavaQualifiedTypeNameNode [

	^ writer
		  qualifiedTypeReferenceNamed: aJavaQualifiedTypeNameNode name value
		  receiver: (writer writeExpression: [ :expr | 
				   self
					   use: expr
					   during: [ 
					   aJavaQualifiedTypeNameNode nspace acceptVisitor: self ] ])
]

{ #category : #visiting }
MOJavaFileLoader >> visitReturnStatement: aJavaReturnStatementNode [

	^ writer writeStatement: [ :stmt | 
		  stmt return: [ :expr | 
			  aJavaReturnStatementNode expression ifNotNil: [ 
				  self
					  use: expr
					  during: [ 
					  aJavaReturnStatementNode expression acceptVisitor: self ] ] ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitSingleTypeImportDeclaration: aJavaSingleTypeImportDeclarationNode [

	self imports add: (writer writeImport: [ :import | 
			 | parts |
			 parts := '.' split: 
				          aJavaSingleTypeImportDeclarationNode name source.

			 import importTypeName: parts last.
			 import packageName: ('.' join: parts allButLast) ])
]

{ #category : #visiting }
MOJavaFileLoader >> visitStatementExpressionList: aJavaStatementExpressionListNode [

	^ aJavaStatementExpressionListNode expressions collect: [ :e | 
		  e acceptVisitor: self ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitStaticInitializer: aJavaStaticInitializerNode [

	^ writer writeStaticInitializer: [ :init | 
		  init writeBlock: [ :block | 
			  self
				  use: block
				  during: [ aJavaStaticInitializerNode block acceptVisitor: self ] ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitStringLiteral: aJavaStringLiteralNode [

	^ writer stringLiteral: aJavaStringLiteralNode token value
]

{ #category : #visiting }
MOJavaFileLoader >> visitSuperConstructorInvocation: aJavaSuperConstructorInvocationNode [

	^ writer invokeSuperConstructorArguments: [ :expr | 
		  self use: expr during: [ 
			  self visitCollection:
				  aJavaSuperConstructorInvocationNode expressions ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitSwitchStatement: aJavaSwitchStatementNode [

	^ writer
		  switch: [ :expr | 
			  self
				  use: expr
				  during: [ 
				  aJavaSwitchStatementNode expression acceptVisitor: self ] ]
		  block: [ :select | 
			  self
				  use: select
				  during: [ aJavaSwitchStatementNode block acceptVisitor: self ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitSynchronizedStatement: aJavaSynchronizedStatementNode [

	^ writer writeSynchronized: [ :sync | 
		  self use: sync during: [ 
			  sync lockAccessExpression:
				  (aJavaSynchronizedStatementNode expression acceptVisitor: self) ].
		  sync writeBlock: [ :block | 
			  self
				  writeStatementOrBlock: aJavaSynchronizedStatementNode block
				  into: block ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitThisConstructorInvocation: aJavaThisConstructorInvocationNode [

	^ writer invokeConstructorArguments: [ :expr | 
		  self use: expr during: [ 
			  self visitCollection:
				  aJavaThisConstructorInvocationNode expressions ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitThrowStatement: aJavaThrowStatementNode [

	^ writer throw: [ :expr | 
		  self
			  use: expr
			  during: [ aJavaThrowStatementNode expression acceptVisitor: self ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitTryStatement: aJavaTryStatementNode [

	^ writer writeTryCatch: [ :tryCatch | 
		  tryCatch writeTry: [ :try | 
			  self
				  use: try
				  during: [ aJavaTryStatementNode block acceptVisitor: self ] ].
		  self
			  use: tryCatch
			  during: [ self visitCollection: aJavaTryStatementNode catches ].
		  tryCatch writeFinally: [ :finally | 
			  aJavaTryStatementNode finally ifNotNil: [ 
				  self
					  use: finally
					  during: [ 
					  aJavaTryStatementNode finally block acceptVisitor: self ] ] ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitTypeArgument: aJavaTypeArgumentNode [

	^ writer writeTypeParameter: [ :typeParameter | 
		  typeParameter name: aJavaTypeArgumentNode type name source ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitTypeImportOnDemandDeclaration: aJavaTypeImportOnDemandDeclarationNode [

	^ self imports add: (writer writeImport: [ :import | 
			   import packageName:
				   aJavaTypeImportOnDemandDeclarationNode name source ])
]

{ #category : #visiting }
MOJavaFileLoader >> visitTypeName: aJavaTypeNameNode [

	^ self typeReferenceFor: aJavaTypeNameNode using: writer
]

{ #category : #visiting }
MOJavaFileLoader >> visitTypeParameter: aJavaTypeParameterNode [

	writer writeTypeParameter: [ :typeParameter | 
		typeParameter name: aJavaTypeParameterNode name source.
		aJavaTypeParameterNode types do: [ :t | 
			typeParameter addSuperTypeReference: (self typeReferenceFor: t using: typeParameter ) ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitUnaryNot: aJavaUnaryNotNode [

	^ writer
		  prefixOperate: [ :exp | 
			  self
				  use: exp
				  during: [ aJavaUnaryNotNode expression acceptVisitor: self ] ]
		  operator: aJavaUnaryNotNode bang value
]

{ #category : #visiting }
MOJavaFileLoader >> visitUnarySubtraction: aJavaUnarySubtractionNode [

	^ writer
		  prefixOperate: [ :exp | 
			  self
				  use: exp
				  during: [ 
				  aJavaUnarySubtractionNode expression acceptVisitor: self ] ]
		  operator: aJavaUnarySubtractionNode minus value
]

{ #category : #visiting }
MOJavaFileLoader >> visitVariableArgumentParameter: aJavaVariableArgumentParameterNode [

	writer writeParameter: [ :parameter | 
		parameter typeReference: (self
				 typeReferenceFor: aJavaVariableArgumentParameterNode type
				 using: parameter).
		parameter name: (aJavaVariableArgumentParameterNode variable
				 ifNil: [ 
					 'generatedParamName'
					 ,
						 (aJavaVariableArgumentParameterNode parent parameters indexOf:
							  aJavaVariableArgumentParameterNode) asString ]
				 ifNotNil: [ :var | var name value ]).
		parameter mapsToVariableArguments ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitVariableDeclaration: aJavaVariableDeclarationNode [

	^ aJavaVariableDeclarationNode variable acceptVisitor: self
]

{ #category : #visiting }
MOJavaFileLoader >> visitVariableName: aJavaVariableNameNode [

	^ writer name: aJavaVariableNameNode name value
]

{ #category : #visiting }
MOJavaFileLoader >> visitWhileStatement: aJavaWhileStatementNode [

	^ writer
		  while: [ :exp | 
			  self
				  use: exp
				  during: [ 
				  aJavaWhileStatementNode expression acceptVisitor: self ] ]
		  do: [ :block | 
			  self
				  writeStatementOrBlock: aJavaWhileStatementNode statement
				  into: block ]
]

{ #category : #visiting }
MOJavaFileLoader >> writeAbstractMethodWith: aJavaAbstractMethodDeclarationNode [

	writer writeMethod: [ :method | 
		aJavaAbstractMethodDeclarationNode throws ifNotNil: [ :th | 
			th classTypes do: [ :typeNode | 
				method addThrownTypeReference:
					(self typeReferenceFor: typeNode using: method) ] ].
		self setPosition: method from: aJavaAbstractMethodDeclarationNode.

		method returnTypeReference: (self
				 typeReferenceFor: aJavaAbstractMethodDeclarationNode type
				 using: method).
		self use: method during: [ 
			self visitCollection: aJavaAbstractMethodDeclarationNode modifiers.
			aJavaAbstractMethodDeclarationNode declarator acceptVisitor: self ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> writeClassTypeWith: aJavaInterfaceDeclarationNode named: name [

	writer writeClassType: [ :class | 
		aJavaInterfaceDeclarationNode interfaceTypes do: [ :int | 
			class addSuperTypeReference:
				(self typeReferenceFor: int using: class) ].
		(self isFullName: name)
			ifTrue: [ class fullName: name ]
			ifFalse: [ 
				class name: name.
				class packageReference: packageReference ].


		self use: class during: [ 
			self visitCollection: aJavaInterfaceDeclarationNode modifiers.
			self visitCollection: aJavaInterfaceDeclarationNode declarations ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> writeClassWith: aJavaClassDeclarationNode named: name [

	writer package: package.
	writer writeJavaClass: [ :class | 
		aJavaClassDeclarationNode superclass ifNotNil: [ :sc | 
			class superclassReference: (self typeReferenceFor: sc using: class) ].
		aJavaClassDeclarationNode interfaces do: [ :int | 
			class addSuperTypeReference:
				(self typeReferenceFor: int using: class) ].
		(self isFullName: name)
			ifTrue: [ class fullName: name ]
			ifFalse: [ 
				class name: name.
				class packageReference: packageReference ].
		self use: class during: [ 
			self visitCollection: aJavaClassDeclarationNode modifiers.
			aJavaClassDeclarationNode typeParameters ifNotNil: [ :p | 
				self visitCollection: p parameters ].
			self visitCollection: aJavaClassDeclarationNode declarations ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> writeMethodWith: aJavaMethodDeclarationNode [

	writer writeMethod: [ :method | 
		self setPosition: method from: aJavaMethodDeclarationNode.

		aJavaMethodDeclarationNode throws ifNotNil: [ :th | 
			th classTypes do: [ :typeNode | 
				method addThrownTypeReference:
					(self typeReferenceFor: typeNode using: method) ] ].

		method returnTypeReference:
			(self
				 typeReferenceFor: aJavaMethodDeclarationNode type
				 using: method).
		self use: method during: [ 
			self visitCollection: aJavaMethodDeclarationNode modifiers.
			aJavaMethodDeclarationNode declarator acceptVisitor: self.
			aJavaMethodDeclarationNode body acceptVisitor: self ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> writeParametrizableAbstractMethodWith: aJavaAbstractMethodDeclarationNode [

	writer writeParametrizableMethod: [ :method | 
		aJavaAbstractMethodDeclarationNode throws ifNotNil: [ :th | 
			th classTypes do: [ :typeNode | 
				method addThrownTypeReference:
					(self typeReferenceFor: typeNode using: method) ] ].
		self setPosition: method from: aJavaAbstractMethodDeclarationNode.

		method returnTypeReference: (self
				 typeReferenceFor: aJavaAbstractMethodDeclarationNode type
				 using: method).
		self use: method during: [ 
			self visitCollection:
				aJavaAbstractMethodDeclarationNode typeParameters parameters.
			self visitCollection: aJavaAbstractMethodDeclarationNode modifiers.
			aJavaAbstractMethodDeclarationNode declarator acceptVisitor: self ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> writeParametrizableClassTypeWith: aJavaInterfaceDeclarationNode named: name [

	| typeParameters |
	writer writeParametrizableClassType: [ :class | 
		aJavaInterfaceDeclarationNode interfaceTypes do: [ :int | 
			class addSuperTypeReference:
				(self typeReferenceFor: int using: class) ].
		(self isFullName: name)
			ifTrue: [ class fullName: name ]
			ifFalse: [ 
				class name: name.
				class packageReference: packageReference ].


		typeParameters := aJavaInterfaceDeclarationNode typeParameters.
		typeParameters := typeParameters
			                  ifNil: [ 
			                  aJavaInterfaceDeclarationNode name name arguments ]
			                  ifNotNil: [ typeParameters parameters ].
		self use: class during: [ 
			self visitCollection: typeParameters.
			self visitCollection: aJavaInterfaceDeclarationNode declarations ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> writeParametrizableClassWith: aJavaClassDeclarationNode named: name [

	| typeParameters |
	typeParameters := aJavaClassDeclarationNode typeParameters.
	typeParameters := typeParameters
		                  ifNil: [ 
		                  aJavaClassDeclarationNode name name arguments ]
		                  ifNotNil: [ typeParameters parameters ].
	writer package: package.
	writer writeParametrizableClass: [ :class | 
		aJavaClassDeclarationNode superclass ifNotNil: [ :sc | 
			class superclassReference: (self typeReferenceFor: sc using: class) ].
		aJavaClassDeclarationNode interfaces do: [ :int | 
			class addSuperTypeReference:
				(self typeReferenceFor: int using: class) ].
		(self isFullName: name)
			ifTrue: [ class fullName: name ]
			ifFalse: [ 
				class name: name.
				class packageReference: packageReference ].
		self use: class during: [ 
			self visitCollection: typeParameters .
			self visitCollection: aJavaClassDeclarationNode declarations ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> writeParametrizableMethodWith: aJavaMethodDeclarationNode [

	writer writeParametrizableMethod: [ :method | 
		self setPosition: method from: aJavaMethodDeclarationNode.

		aJavaMethodDeclarationNode throws ifNotNil: [ :th | 
			th classTypes do: [ :typeNode | 
				method addThrownTypeReference:
					(self typeReferenceFor: typeNode using: method) ] ].

		method returnTypeReference:
			(self
				 typeReferenceFor: aJavaMethodDeclarationNode type
				 using: method).
		self use: method during: [ 
			self visitCollection: aJavaMethodDeclarationNode typeParameters parameters.
			self visitCollection: aJavaMethodDeclarationNode modifiers.
			aJavaMethodDeclarationNode declarator acceptVisitor: self.
			aJavaMethodDeclarationNode body acceptVisitor: self ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> writeStatementOrBlock: value into: block [

	^ (value isKindOf: JavaBlockNode)
		  ifTrue: [ self use: block during: [ value acceptVisitor: self ] ]
		  ifFalse: [ 
			  block writeStatement: [ :stmt | 
				  self use: stmt during: [ value acceptVisitor: self ] ] ]
]

{ #category : #accessing }
MOJavaFileLoader >> writer: aMOModelWriter [ 
	writer := aMOModelWriter.

]
