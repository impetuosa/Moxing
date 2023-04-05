Class {
	#name : #MOTypescriptClassLoader,
	#superclass : #MOTypescriptAbstractLoader,
	#instVars : [
		'decorator',
		'component',
		'packageName'
	],
	#category : #'Moxing-Typescript-Loader'
}

{ #category : #'as yet unclassified' }
MOTypescriptClassLoader class >> loadClassFromFile: aFile for: aComponent into: aMOModel [

	| loader |

	loader := self new.
	loader writer: aMOModel writer.
	loader component: aComponent.

	^ loader
		  loadArtefact: (TypeScriptParser parseFile: aFile)
		  intoPackage: aFile basename
]

{ #category : #'as yet unclassified' }
MOTypescriptClassLoader class >> loadClassFromFile: aFile using: aWriter [

	| loader |
	loader := self new.
	loader writer: aWriter.


	^ loader
		  loadArtefact: (TypeScriptParser parseFile: aFile)
		  intoPackage: aFile basename
]

{ #category : #visiting }
MOTypescriptClassLoader >> acceptNode: aSmaCCParseNode [
	aSmaCCParseNode isNil
		ifTrue: [ ^ nil ].
	^ aSmaCCParseNode acceptVisitor: self
]

{ #category : #visiting }
MOTypescriptClassLoader >> acceptNodes: aCollection [
	aCollection do: [ :each | self acceptNode: each ].
	^ aCollection
]

{ #category : #'instance creation' }
MOTypescriptClassLoader >> component: aMOAngularComponentBehaviour [

	component := aMOAngularComponentBehaviour.
	
]

{ #category : #generated }
MOTypescriptClassLoader >> loadArtefact: anAstNode intoPackage: aPackageName [

	component ifNotNil: [ writer anchoringOn: component anchor ].
	packageName := aPackageName.
	^ anAstNode acceptVisitor: self
]

{ #category : #generated }
MOTypescriptClassLoader >> model: aModel [

	super model: aModel.
	writer := MOModelWriter new
		          model: aModel;
		          yourself.
]

{ #category : #visiting }
MOTypescriptClassLoader >> visitArrayLiteral: aJSArrayLiteralNode [ 
	^ writer arrayLiteralFromLiterals: ( self visitCollection: aJSArrayLiteralNode expressions ) asArray.
]

{ #category : #visiting }
MOTypescriptClassLoader >> visitArrowFunction: aJSArrowFunctionNode [


	^ writer writeLambda: [ :lambda | 
		  self
			  use: lambda
			  during: [ self visitCollection: aJSArrowFunctionNode parameters ].
		  lambda writeBlock: [ :block | 
			  aJSArrowFunctionNode statements do: [ :statement | 
				  block writeStatement: [ :stmt | 
					  self use: stmt during: [ statement acceptVisitor: self ] ] ] ] ]
]

{ #category : #visiting }
MOTypescriptClassLoader >> visitBinaryExpression: aJSBinaryExpressionNode [

	^ writer
		  operate: [ :exp | 
			  self
				  use: exp
				  during: [ 
				  aJSBinaryExpressionNode leftExpression acceptVisitor: self ] ]
		  operator: aJSBinaryExpressionNode operator value asSymbol
		  with: [ :exp | 
			  self
				  use: exp
				  during: [ 
				  aJSBinaryExpressionNode rightExpression acceptVisitor: self ] ]
]

{ #category : #visiting }
MOTypescriptClassLoader >> visitBlockStatement: aJSBlockStatementNode [

	^ aJSBlockStatementNode statements collect: [ :stmt | 
		  writer writeStatement: [ :stttm | 
			  self use: stttm during: [ stmt acceptVisitor: self ] ] ]
]

{ #category : #generated }
MOTypescriptClassLoader >> visitCallExpression: anExpression [


	^ writer
		  call: [ :expression | 
			  self
				  use: expression
				  during: [ anExpression expression acceptVisitor: self ] ]
		  arguments: [ :args | 
			  self
				  use: args
				  during: [ self visitCollection: anExpression arguments ] ]
]

{ #category : #generated }
MOTypescriptClassLoader >> visitClassExpression: aClassExpression [

	writer packageReference: (writer packageReferenceNamed: packageName).
	writer name: aClassExpression name name value.
	aClassExpression types do: [ :t | 
		writer addSuperTypeReference:
			(writer typeReferenceNamed: t type source) ].
	self acceptNodes: aClassExpression elements
]

{ #category : #generated }
MOTypescriptClassLoader >> visitDecoratorExpression: aDecoratorExpression [

	MOTypescriptDecoratorLoader
		loadArtefact: aDecoratorExpression
		writer: writer
]

{ #category : #visiting }
MOTypescriptClassLoader >> visitExportDefaultImplementationElement: aJSExportDefaultImplementationElementNode [ 
	^ nil
]

{ #category : #generated }
MOTypescriptClassLoader >> visitExportImplementationElement: anExportImplementationElement [

	self assert: (anExportImplementationElement declaration isKindOf:
			 JSClassExpressionNode).
	^ writer writeTypescriptClass: [ :class | 
		  self
			  use: class
			  during: [ self visitTSExport: anExportImplementationElement ] ]
]

{ #category : #visiting }
MOTypescriptClassLoader >> visitExpressionStatement: aJSExpressionStatementNode [

	^ aJSExpressionStatementNode expression acceptVisitor: self
]

{ #category : #visiting }
MOTypescriptClassLoader >> visitFunction: aJSFunctionNode [

	self assert: aJSFunctionNode name isNil.
	^ self visitArrowFunction: aJSFunctionNode
]

{ #category : #visiting }
MOTypescriptClassLoader >> visitIfStatement: aJSIfStatementNode [

	^ writer writeStatement: [ :st | 
		  st
			  if: [ :expression | 
				  self
					  use: expression
					  during: [ aJSIfStatementNode expression acceptVisitor: self ] ]
			  ifTrue: [ :ifTrueBlockWriter | 
				  self
					  writeStatementOrBlock: aJSIfStatementNode trueStatement
					  into: ifTrueBlockWriter ]
			  ifFalse: [ :ifFalseBlockWriter | 
				  self
					  writeStatementOrBlock: aJSIfStatementNode elseStatement
					  into: ifFalseBlockWriter ] ]
]

{ #category : #generated }
MOTypescriptClassLoader >> visitImportDeclaration: anImport [

	writer writeFileImport: [ :import | 
		import file: anImport from value.
		anImport imports do: [ :imports | 
			(imports isKindOf: JSNameSpaceImportNode)
				ifTrue: [ import importsAll: true ]
				ifFalse: [ 
					imports specifiers do: [ :spec | 
						import addImportingTypeName: spec source ] ] ] ]
]

{ #category : #visiting }
MOTypescriptClassLoader >> visitLexicalDeclaration: aLexicalDeclaration [

	self halt.
	self assert: aLexicalDeclaration typeToken value = #const.
	self assert: aLexicalDeclaration bindings size = 1.
	^ aLexicalDeclaration bindings first acceptVisitor: self
	"^ self visitStatement: aLexicalDeclaration"
]

{ #category : #generated }
MOTypescriptClassLoader >> visitMemberFunctionDeclaration: aMethodDefinition [
	self halt. 
"
	result addMethod: (MOTypescriptMethodLoader
			 load: aMethodDefinition
			 file: file
			 anchor: result anchor
			 types: types
			 model: model
			 parent: result)"
]

{ #category : #generated }
MOTypescriptClassLoader >> visitMethodDefinition: aMethodDefinition [

	^ MOTypescriptMethodLoader
		  loadArtefact: aMethodDefinition
		  writer: writer
]

{ #category : #generated }
MOTypescriptClassLoader >> visitNameExpression: aNameExpression [

	^ writer variableReferenceNamed: aNameExpression name value
]

{ #category : #generated }
MOTypescriptClassLoader >> visitNamedPropertyExpression: aPropertyExpression [

	^ writer
		  accessAttribute: aPropertyExpression name value
		  receiver: [ :exp | 
			  self
				  use: exp
				  during: [ aPropertyExpression expression acceptVisitor: self ] ]
]

{ #category : #visiting }
MOTypescriptClassLoader >> visitNewExpression: aJSNewExpressionNode [

	^ writer
		  new: (aJSNewExpressionNode expression acceptVisitor: self)
		  arguments: [ :expr | 
			  self
				  use: expr
				  during: [ self visitCollection: aJSNewExpressionNode arguments ] ]
]

{ #category : #visiting }
MOTypescriptClassLoader >> visitProgram: aProgram [

	^ self visitSmaCCParseNode: aProgram
]

{ #category : #generated }
MOTypescriptClassLoader >> visitPropertyAssignment: aDecoratorExpression [

]

{ #category : #visiting }
MOTypescriptClassLoader >> visitSmaCCParseNode: aSmaCCParseNode [

	self acceptNodes: aSmaCCParseNode sortedChildren.
	^ aSmaCCParseNode
]

{ #category : #visiting }
MOTypescriptClassLoader >> visitStatement: aStatement [
	^ self visitProgram: aStatement
]

{ #category : #generated }
MOTypescriptClassLoader >> visitStringLiteral: aLiteral [

	^ writer stringLiteral: aLiteral value value
]

{ #category : #generated }
MOTypescriptClassLoader >> visitTSSourceFile: aTSSourceFile [

	^ writer writeDeclarationUnit: [ :unit | 
		  self use: unit during: [ self visitProgram: aTSSourceFile ] ]
]

{ #category : #visiting }
MOTypescriptClassLoader >> visitTemplateLiteral: aJSTemplateLiteralNode [

	^ writer templateLiteral:
		  (aJSTemplateLiteralNode parts collect: [ :s | 
			   writer stringLiteral: s value asString ])
		  , (self visitCollection: aJSTemplateLiteralNode expressions)
]

{ #category : #visiting }
MOTypescriptClassLoader >> visitThrowStatement: aJSThrowStatementNode [

	^ writer throw: [ :expr | 
		  self
			  use: expr
			  during: [ aJSThrowStatementNode expression acceptVisitor: self ] ]
]

{ #category : #generated }
MOTypescriptClassLoader >> visitTypeReference: aTypeReference [ 

	self assert: aTypeReference typeArguments isEmptyOrNil.
	self assert: aTypeReference type names size = 1.
	^ writer typeReferenceNamed: aTypeReference type names first name value
]

{ #category : #visiting }
MOTypescriptClassLoader >> visitUnaryExpression: aJSUnaryExpressionNode [

	^ writer
		  operate: [ :e | 
			  self
				  use: e
				  during: [ aJSUnaryExpressionNode expression acceptVisitor: self ] ]
		  operator: aJSUnaryExpressionNode operator value asSymbol
		  order: #prefix
]

{ #category : #generated }
MOTypescriptClassLoader >> visitVariableDeclaration: aVariableDeclaration [

	^ writer writeVariable: [ :var | 
		  var name: aVariableDeclaration variable name value.
		  aVariableDeclaration type ifNotNil: [ 
			  var typeReference:
				  (aVariableDeclaration type acceptVisitor: self) ].
		  aVariableDeclaration value ifNotNil: [ 
			  var writeInitializer: [ :init | 
				  self halt.
				  self
					  use: init
					  during: [ aVariableDeclaration value acceptVisitor: self ] ] ] ]
]

{ #category : #writing }
MOTypescriptClassLoader >> writeStatementOrBlock: aJSBlockStatementNode into: aMOBlockWriter [

	aJSBlockStatementNode ifNil: [ ^ nil ].
	^ (aJSBlockStatementNode isKindOf: JSBlockStatementNode)
		  ifTrue: [ 
			  self
				  use: aMOBlockWriter
				  during: [ aJSBlockStatementNode acceptVisitor: self ] ]
		  ifFalse: [ 
			  self halt.
			  aMOBlockWriter writeStatement: [ :stmt | 
				  self
					  use: stmt
					  during: [ aJSBlockStatementNode acceptVisitor: self ] ] ]
]
