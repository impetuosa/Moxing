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

	writer writeAnnotation: [ :annotation | 
		annotation annotationTypeReference:
			(self typeReferenceFor: aJavaAnnotationNode name using: annotation) .
		annotation arguments:
			(self visitCollection: aJavaAnnotationNode values) ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitBinaryExpression: aJavaBinaryExpressionNode [ 
	self shouldBeImplemented.
]

{ #category : #visiting }
MOJavaFileLoader >> visitBlock: aJavaBlockNode [

	writer writeBlock: [ :block | 
		self
			use: block
			during: [ self visitCollection: aJavaBlockNode statements ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitClassDeclaration: aJavaClassDeclarationNode [

	| name |
	" the name of the class Class<T> is Class "
	name := aJavaClassDeclarationNode name source readStream upToAll: '<'.
	(writer model entities contains: [ :a | 
		 (a isKindOf: MOClass) and: [ a fullName = name ] ]) ifTrue: [ 
		^ self ].
	aJavaClassDeclarationNode typeParameters
		ifNil: [ self writeClassWith: aJavaClassDeclarationNode named: name ]
		ifNotNil: [ 
			self
				writeParametrizableClassWith: aJavaClassDeclarationNode
				named: name ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitCollection: aCollection [ 
	^ aCollection collect: [ : a | a accept: self  ]
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
MOJavaFileLoader >> visitEmptyMethodBody: aJavaEmptyMethodBodyNode [ 
	" nothing to inform here. "
]

{ #category : #visiting }
MOJavaFileLoader >> visitExpressionStatement: aJavaExpressionStatementNode [

	writer writeStatement: [ :s | 
		self
			use: s
			during: [ 
			aJavaExpressionStatementNode expression acceptVisitor: self ] ]
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
MOJavaFileLoader >> visitInitializedVariableDeclaration: aJavaInitializedVariableDeclarationNode [

	writer name:
		aJavaInitializedVariableDeclarationNode variable name source.
	aJavaInitializedVariableDeclarationNode initializer acceptVisitor:
		self
]

{ #category : #visiting }
MOJavaFileLoader >> visitInterfaceDeclaration: aJavaInterfaceDeclarationNode [

	| name |
	name := aJavaInterfaceDeclarationNode name source.
	self assert:
		aJavaInterfaceDeclarationNode interfaceToken value = 'interface'.
	(writer model entities contains: [ :a | 
		 (a isKindOf: MOClassType) and: [ a fullName = name ] ]) ifTrue: [ 
		^ self ].
	writer package: package.
	aJavaInterfaceDeclarationNode typeParameters
		ifNil: [ 
		self writeClassTypeWith: aJavaInterfaceDeclarationNode named: name ]
		ifNotNil: [ 
			self
				writeParametrizableClassTypeWith: aJavaInterfaceDeclarationNode
				named: name ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitLocalVariableDeclaration: aJavaLocalVariableDeclarationNode [

	aJavaLocalVariableDeclarationNode variableDeclarations do: [ :decl | 
		writer writeStatement: [ :statement | 
			statement
				variable: decl variable name source
				typeReference: (self
						 typeReferenceFor: aJavaLocalVariableDeclarationNode type
						 using: writer)
				initializer: [ :expression | 
					self
						use: expression
						during: [ decl initializer acceptVisitor: self ] ] ] ]
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
		ifNotNil:
			[ self writeParametrizableMethodWith: aJavaMethodDeclarationNode ].
		
]

{ #category : #visiting }
MOJavaFileLoader >> visitMethodDeclarator: aJavaMethodDeclaratorNode [

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
MOJavaFileLoader >> visitProgram: aProgram [

	^ self visitCollection: aProgram sortedChildren
]

{ #category : #visiting }
MOJavaFileLoader >> visitProgramFile: aJavaProgramFileNode [

	writer writeDeclarationUnit: [ :unit | 
		self registerJavaDefaultImports.
		self use: unit during: [ self visitProgram: aJavaProgramFileNode ] ].
	writer populateAnchor.
]

{ #category : #visiting }
MOJavaFileLoader >> visitReturnStatement: aJavaReturnStatementNode [

	^ writer writeStatement: [ :stmt | 
		  stmt return: [ :expr | 
			  self
				  use: expr
				  during: [ 
				  aJavaReturnStatementNode expression acceptVisitor: self ] ] ]
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
MOJavaFileLoader >> visitStringLiteral: aJavaStringLiteralNode [

	^ writer stringLiteral: aJavaStringLiteralNode token value
]

{ #category : #visiting }
MOJavaFileLoader >> visitTypeParameter: aJavaTypeParameterNode [

	writer writeTypeParameter: [ :typeParameter | 
		typeParameter name: aJavaTypeParameterNode name source.
		aJavaTypeParameterNode types do: [ :t | 
			typeParameter addSuperTypeReference: (self typeReferenceFor: t using: typeParameter ) ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitVariableArgumentParameter: aJavaVariableArgumentParameterNode [ 
	writer writeParameter: [ : parameter |
		parameter typeReference: (self typeReferenceFor: aJavaVariableArgumentParameterNode type using: parameter).
		parameter name: (aJavaVariableArgumentParameterNode variable
				 ifNil: [ 
					 'generatedParamName'
					 ,
						 (aJavaVariableArgumentParameterNode parent parameters indexOf:
							  aJavaVariableArgumentParameterNode) asString ]).
		parameter mapsToVariableArguments.
	 ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitVariableDeclaration: aJavaVariableDeclarationNode [

	^ aJavaVariableDeclarationNode variable acceptVisitor: self
]

{ #category : #visiting }
MOJavaFileLoader >> visitVariableName: aJavaVariableNameNode [

	writer name: aJavaVariableNameNode name source
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


		self
			use: class
			during: [ 
			self visitCollection: aJavaInterfaceDeclarationNode declarations ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> writeClassWith: aJavaClassDeclarationNode named: name [ 

	writer package: package.
	writer writeClass: [ :class | 
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

	writer writeParametrizableClassType: [ :class | 
		aJavaInterfaceDeclarationNode interfaceTypes do: [ :int | 
			class addSuperTypeReference:
				(self typeReferenceFor: int using: class) ].
		(self isFullName: name)
			ifTrue: [ class fullName: name ]
			ifFalse: [ 
				class name: name.
				class packageReference: packageReference ].


		self use: class during: [ 
			self visitCollection:
				aJavaInterfaceDeclarationNode typeParameters parameters.
			self visitCollection: aJavaInterfaceDeclarationNode declarations ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> writeParametrizableClassWith: aJavaClassDeclarationNode named: name [ 


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
			self visitCollection:
				aJavaClassDeclarationNode typeParameters parameters.
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

{ #category : #accessing }
MOJavaFileLoader >> writer: aMOModelWriter [ 
	writer := aMOModelWriter
]
