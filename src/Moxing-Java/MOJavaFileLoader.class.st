Class {
	#name : #MOJavaFileLoader,
	#superclass : #Object,
	#instVars : [
		'writer',
		'packageReference',
		'imports'
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
MOJavaFileLoader >> typeReferenceFor: aJavaClassTypeNode [

	^ MOJavaTypeReference new
		  writer: writer;
		  typeReferenceFor: aJavaClassTypeNode
]

{ #category : #evaluating }
MOJavaFileLoader >> use: aWriter during: aBlock [

	| prev |
	prev := writer.
	writer := aWriter.
	aBlock ensure: [ writer := prev ]
]

{ #category : #'as yet unclassified' }
MOJavaFileLoader >> variableReferenceFor: aJavaNameNode [

	^ MOJavaVariableReference new
		  writer: writer;
		  load: aJavaNameNode
]

{ #category : #visiting }
MOJavaFileLoader >> visitAbstractMethodDeclaration: aJavaAbstractMethodDeclarationNode [

	writer writeMethod: [ :method | 
		aJavaAbstractMethodDeclarationNode throws ifNotNil: [ :th | 
			th classTypes do: [ :typeNode | 
				method addThrownTypeReference: (self typeReferenceFor: typeNode) ] ].
		self setPosition: method from: aJavaAbstractMethodDeclarationNode.

		method returnTypeReference:
			(self typeReferenceFor: aJavaAbstractMethodDeclarationNode type).
		self use: method during: [ 
			aJavaAbstractMethodDeclarationNode typeParameters ifNotNil: [ :p | 
				self visitCollection: p parameters ].
			self visitCollection: aJavaAbstractMethodDeclarationNode modifiers.
			aJavaAbstractMethodDeclarationNode declarator acceptVisitor: self ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitAnnotation: aJavaAnnotationNode [

	writer writeAnnotation: [ :annotation | 
		annotation annotationTypeReference:
			(self typeReferenceFor: aJavaAnnotationNode name).
		annotation arguments:
			(self visitCollection: aJavaAnnotationNode values) ]
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
	name := aJavaClassDeclarationNode name source.


	writer writeClass: [ :class | 
		aJavaClassDeclarationNode superclass ifNotNil: [ :sc | 
			class superclassReference: (self typeReferenceFor: sc) ].
		aJavaClassDeclarationNode interfaces do: [ :int | 
			class addSuperTypeReference: (self typeReferenceFor: int) ].
		(self isFullName: name)
			ifTrue: [ class fullName: name ]
			ifFalse: [ class name: name ].
		class imports: imports.
		class packageReference: packageReference.
		self use: class during: [ 
			aJavaClassDeclarationNode typeParameters ifNotNil: [ :p | 
				self visitCollection: p parameters ].
			self visitCollection: aJavaClassDeclarationNode declarations ] ]
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
					(self typeReferenceFor: typeNode) ] ].
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

	aJavaExpressionStatementNode expression acceptVisitor: self
]

{ #category : #visiting }
MOJavaFileLoader >> visitFieldDeclaration: aJavaFieldDeclarationNode [

	aJavaFieldDeclarationNode variableDeclarations do: [ :decl | 
		writer writeAttribute: [ :attribute | 
			attribute name: decl variable source.
			attribute typeReference:
				(self typeReferenceFor: aJavaFieldDeclarationNode type).
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


	writer writeClassType: [ :class | 
		aJavaInterfaceDeclarationNode interfaceTypes do: [ :int | 
			class addSuperTypeReference: (self typeReferenceFor: int) ].
		(self isFullName: name)
			ifTrue: [ 
				self halt.
				class fullName: name ]
			ifFalse: [ class name: name ].
		class imports: imports.
		class packageReference: packageReference.
		self use: class during: [ 
			aJavaInterfaceDeclarationNode typeParameters ifNotNil: [ :p | 
				self visitCollection: p parameters ].
			self visitCollection: aJavaInterfaceDeclarationNode declarations ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitLocalVariableDeclaration: aJavaLocalVariableDeclarationNode [

	aJavaLocalVariableDeclarationNode variableDeclarations do: [ :decl | 
		writer writeVariable: [ :variable | 
			variable typeReference:
				(self typeReferenceFor: aJavaLocalVariableDeclarationNode type).
			self use: variable during: [ decl acceptVisitor: self ] ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitLocalVariableDeclarationStatement: aJavaLocalVariableDeclarationStatementNode [

	^ aJavaLocalVariableDeclarationStatementNode declaration 
		  acceptVisitor: self
]

{ #category : #visiting }
MOJavaFileLoader >> visitMethodDeclaration: aJavaMethodDeclarationNode [

	writer writeMethod: [ :method | 
		self setPosition: method from: aJavaMethodDeclarationNode.

		aJavaMethodDeclarationNode throws ifNotNil: [ :th | 
			th classTypes do: [ :typeNode | 
				method addThrownTypeReference: (self typeReferenceFor: typeNode) ] ].

		method returnTypeReference:
			(self typeReferenceFor: aJavaMethodDeclarationNode type).
		self use: method during: [ 
			aJavaMethodDeclarationNode typeParameters ifNotNil: [ :p | 
				self visitCollection: p parameters ].
			self visitCollection: aJavaMethodDeclarationNode modifiers.
			aJavaMethodDeclarationNode declarator acceptVisitor: self.
			aJavaMethodDeclarationNode body acceptVisitor: self ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitMethodDeclarator: aJavaMethodDeclaratorNode [

	writer selector: aJavaMethodDeclaratorNode name value.
	self visitCollection: aJavaMethodDeclaratorNode parameters
]

{ #category : #visiting }
MOJavaFileLoader >> visitMethodInvocation: aJavaMethodInvocationNode [

	writer writeMethodInvocation: [ :mi | 
		mi receiverReference:
			(self variableReferenceFor: aJavaMethodInvocationNode receiver).
		mi selector: aJavaMethodInvocationNode name source.
		self use: mi during: [ 
			mi arguments:
				(self visitCollection: aJavaMethodInvocationNode arguments) ] ]
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

	writer writeNewExpression: [ :new | 
		new typeReference: (self typeReferenceFor: aJavaNewNode type).
		new arguments: (self visitCollection: aJavaNewNode arguments) ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitPackageDeclaration: aJavaPackageDeclarationNode [

	packageReference := writer packageReference:
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
			(self typeReferenceFor: aJavaParameterNode type).
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

	self registerJavaDefaultImports.
	self visitProgram: aJavaProgramFileNode
]

{ #category : #visiting }
MOJavaFileLoader >> visitReturnStatement: aJavaReturnStatementNode [

	writer writeReturnStatement: [ :return | 
		return expression:
			(aJavaReturnStatementNode expression acceptVisitor: self) ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitSingleTypeImportDeclaration: aJavaSingleTypeImportDeclarationNode [

	self imports add: (writer writeImport: [ :import | 
			 import importTypeName:
				 aJavaSingleTypeImportDeclarationNode name source ])
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
			typeParameter addSuperTypeReference: (self typeReferenceFor: t) ] ]
]

{ #category : #visiting }
MOJavaFileLoader >> visitVariableArgumentParameter: aJavaVariableArgumentParameterNode [ 
	writer writeParameter: [ : parameter |
		parameter typeReference: (self typeReferenceFor: aJavaVariableArgumentParameterNode type ).
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

{ #category : #accessing }
MOJavaFileLoader >> writer: aMOModelWriter [ 
	writer := aMOModelWriter
]
