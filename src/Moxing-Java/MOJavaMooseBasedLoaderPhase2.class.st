Class {
	#name : #MOJavaMooseBasedLoaderPhase2,
	#superclass : #MOJavaMooseBasedLoader,
	#category : #'Moxing-Java-Loader'
}

{ #category : #'as yet unclassified' }
MOJavaMooseBasedLoaderPhase2 >> fetchAnnotationType: annotationTypeName from: anAstNode [

	| possibleTypes |
	possibleTypes := self withCurrentContext: [ :ctx | 
		                 ctx annotationInstances
			                 detect: [ :d | 
			                 d annotationType name = annotationTypeName ]
			                 ifFound: [ :a | a annotationType ]
			                 ifNone: [ 
				                 possibleTypes := mapping keys select: [ :m | 
					                                  (m isKindOf:
						                                   FamixJavaAnnotationType) 
						                                  and: [ 
						                                  m name = annotationTypeName ] ].

				                 possibleTypes size = 0
					                 ifTrue: [ nil ]
					                 ifFalse: [ 
						                 self assert: possibleTypes size = 1.
						                 possibleTypes first ] ] ].

	possibleTypes ifNotNil: [ ^ mapping at: possibleTypes ].

	^ self
		  resolveAndInstallTypeFor: annotationTypeName
		  using: anAstNode enclosingFile imports
]

{ #category : #'as yet unclassified' }
MOJavaMooseBasedLoaderPhase2 >> installFromCatalog: aMOInterface [

	^ MOJavaCatalogModelInstaller new install: aMOInterface into: model
]

{ #category : #visiting }
MOJavaMooseBasedLoaderPhase2 >> mapping: aMapping [

	mapping := aMapping
]

{ #category : #'as yet unclassified' }
MOJavaMooseBasedLoaderPhase2 >> resolveAndInstallTypeFor: aString using: aCollection [

	| fullName package |
	fullName := aCollection
		            collect: [ :a | a name source ]
		            thenSelect: [ :s | s endsWith: '.' ,aString ].
	self assert: fullName size = 1.
	fullName := '.' split: fullName first.
	package := MOJavaTarCatalogLoader javaCatalog rootPackages detect: [ 
		           :pkg | pkg name = fullName first ].
	package := fullName allButFirst allButLast
		           inject: package
		           into: [ :pkg :name | 
		           pkg subpackages detect: [ :p | p name = name ] ].

	^ self installFromCatalog:
		  (package types detect: [ :t | t name = aString ])
]

{ #category : #visiting }
MOJavaMooseBasedLoaderPhase2 >> visitAnnotation: aJavaAnnotationNode [

	| annotationType annotationInstance ref |
	annotationType := self
		                  fetchAnnotationType:
		                  aJavaAnnotationNode name source
		                  from: aJavaAnnotationNode.

	annotationInstance := self
		                      instantiate: MOAnnotationInstance
		                      for: aJavaAnnotationNode.

	ref := self
		       instantiate: MOTypeReference
		       for: aJavaAnnotationNode name.
	ref type: annotationType.
	annotationInstance typeReference: ref.
	self push: annotationInstance during: [ 
		annotationInstance arguments:
			(self visitCollection: aJavaAnnotationNode values) ].
	self withTop: [ :t | t addAnnotation: annotationInstance ].
	^ annotationInstance
]

{ #category : #visiting }
MOJavaMooseBasedLoaderPhase2 >> visitAnnotationInstance: aFamixJavaAnnotationInstance [

	(mapping at: aFamixJavaAnnotationInstance annotatedEntity) 
		addAnnotation:
		(mapping at: aFamixJavaAnnotationInstance annotationType)
]

{ #category : #visiting }
MOJavaMooseBasedLoaderPhase2 >> visitAttribute: aFamixJavaAttribute [

	| var ref |
	var := self instantiate: MOVariable for: aFamixJavaAttribute.

	var name: aFamixJavaAttribute name.
	aFamixJavaAttribute declaredType
		ifNotNil: [ 
			ref := self instantiate: MOTypeReference for: { 
					       #refTo.
					       aFamixJavaAttribute declaredType }.
			ref type: (mapping at: aFamixJavaAttribute declaredType).
			var typeReference: ref ]
		ifNil: [ 
			ref := self instantiate: MOTypeMissingReference for: { 
					       #refTo.
					       aFamixJavaAttribute declaredType }.
			var typeReference: ref ].
	self withTop: [ :t | 
		t addVariable: var.
		var anchor: t anchor / #variables / var name ].
	^ var
]

{ #category : #visiting }
MOJavaMooseBasedLoaderPhase2 >> visitBlock: aJavaBlockNode [

	| block |
	block := self instantiate: MOBlock for: aJavaBlockNode.

	self withTop: [ :x | 
		x block: block.
		block anchor: x anchor ].
	self push: block during: [ 
		aJavaBlockNode statements do: [ :s | 
			block addStatement: (s acceptVisitor: self) ] ].
	^ block
]

{ #category : #visiting }
MOJavaMooseBasedLoaderPhase2 >> visitClass: aFamixJavaClass [

	| class |
	class := mapping at: aFamixJavaClass.

	self pushContext: aFamixJavaClass during: [ 
		self push: class during: [ 
			aFamixJavaClass sourceText
				ifNotEmpty: [ 
					(JavaParser parse: aFamixJavaClass sourceAnchor fullSourceText) 
						acceptVisitor: self ]
				ifEmpty: [ 
					self visitCollection: aFamixJavaClass attributes.
					self visitCollection: aFamixJavaClass methods.
					self visitCollection: aFamixJavaClass annotationInstances ] ] ]
]

{ #category : #visiting }
MOJavaMooseBasedLoaderPhase2 >> visitClassDeclaration: aJavaClassDeclarationNode [

	self assert:
		aJavaClassDeclarationNode name name name value = stack top name.
	self visitProgram: aJavaClassDeclarationNode.
	
]

{ #category : #visiting }
MOJavaMooseBasedLoaderPhase2 >> visitClassType: aJavaClassTypeNode [ 
	" rien "
]

{ #category : #visiting }
MOJavaMooseBasedLoaderPhase2 >> visitElementValuePair: aJavaElementValuePairNode [ 
	| assign |
	assign :=  self instantiate:  MOAssignment for:aJavaElementValuePairNode .
	self withTop: [ : an | an  ].
	
	

	stack top.
]

{ #category : #visiting }
MOJavaMooseBasedLoaderPhase2 >> visitExpressionStatement: aJavaExpressionStatementNode [ 
	^ self visitProgram: aJavaExpressionStatementNode 
]

{ #category : #visiting }
MOJavaMooseBasedLoaderPhase2 >> visitFieldDeclaration: aJavaFieldDeclarationNode [

	| attributes |
	attributes := self withCurrentContext: [ :t | 
		              aJavaFieldDeclarationNode variableDeclarations 
			              collect: [ :decl | 
			              t attributes detect: [ :a | a name = decl source ] ] ].
	^ attributes collect: [ :a | 
		  | var |
		  var := self visitAttribute: a.
		  self
			  push: var
			  during: [ self visitProgram: aJavaFieldDeclarationNode ] ]
]

{ #category : #visiting }
MOJavaMooseBasedLoaderPhase2 >> visitLocalVariable: aFamixJavaLocalVariable [ 
	^ self visitAttribute: aFamixJavaLocalVariable 
]

{ #category : #visiting }
MOJavaMooseBasedLoaderPhase2 >> visitLocalVariableDeclaration: aJavaLocalVariableDeclarationNode [

	| famixLocalVariables |
	famixLocalVariables := self withCurrentContext: [ :me | 
		                       aJavaLocalVariableDeclarationNode
			                       variableDeclarations collect: [ :decl | 
			                       me localVariables detect: [ :a | 
				                       a name = decl variable source ] ] ].
	^ self visitCollection: famixLocalVariables
]

{ #category : #visiting }
MOJavaMooseBasedLoaderPhase2 >> visitLocalVariableDeclarationStatement: aJavaLocalVariableDeclarationStatementNode [

	^ aJavaLocalVariableDeclarationStatementNode declaration 
		  acceptVisitor: self
]

{ #category : #visiting }
MOJavaMooseBasedLoaderPhase2 >> visitMethod: aFamixJavaMethod [

	| method |
	method := self instantiate: MOMethod for: aFamixJavaMethod.
	method block:
		(self instantiate: MOBlock for: aFamixJavaMethod localVariables).
	method selector: aFamixJavaMethod name.
	self withTop: [ :t | 
		t addMethod: method.
		method anchor: t anchor / #methods / method selector ].
	self push: method during: [ 
		aFamixJavaMethod parameters ifNotEmpty: [ self halt ].
			(self visitCollection: aFamixJavaMethod parameters).
			(self visitCollection: aFamixJavaMethod localVariables) ].
	^ method
]

{ #category : #visiting }
MOJavaMooseBasedLoaderPhase2 >> visitMethodDeclaration: aJavaMethodDeclarationNode [

	| famixMethod method |
	famixMethod := self withCurrentContext: [ :tx | 
		               tx methods detect: [ :m | 
			               m name
			               = aJavaMethodDeclarationNode declarator name source ] ].
	method := self visitMethod: famixMethod.
	self pushContext: famixMethod during: [ 
		self
			push: method
			during: [ self visitProgram: aJavaMethodDeclarationNode ] ].
	^ method
]

{ #category : #visiting }
MOJavaMooseBasedLoaderPhase2 >> visitMethodDeclarator: aJavaMethodDeclaratorNode [ 
	" handled before "
]

{ #category : #visiting }
MOJavaMooseBasedLoaderPhase2 >> visitMethodInvocation: aJavaMethodInvocationNode [

	| methodInvocation candidates receiver |
	methodInvocation := self
		                    instantiate: MOMethodInvocation
		                    for: aJavaMethodInvocationNode.

	methodInvocation selector: aJavaMethodInvocationNode name source.
	methodInvocation receiver: (aJavaMethodInvocationNode receiver
			 ifNil: [ 
				 self instantiate: MOSelf for: { 
						 #self.
						 aJavaMethodInvocationNode } ]
			 ifNotNil: [ :r | 
				 receiver := r acceptVisitor: self.

				 receiver ]).

	methodInvocation arguments:
		(self visitCollection: aJavaMethodInvocationNode expressions).
	^ methodInvocation
]

{ #category : #visiting }
MOJavaMooseBasedLoaderPhase2 >> visitModifier: aJavaModifierNode [

	self withTop: [ :mod | 
		mod addModifier: aJavaModifierNode token value ]
]

{ #category : #visiting }
MOJavaMooseBasedLoaderPhase2 >> visitMooseModel: aFamixJavaModel [
	(aFamixJavaModel allNamespaces select: [ :a | 
		 a parentNamespace isNil ]) do: [ :d | d accept: self ].
]

{ #category : #visiting }
MOJavaMooseBasedLoaderPhase2 >> visitName: aJavaNameNode [

	| ref named |
	named := mapping at: (self withCurrentContext: [ :att | 
			          att allVisibleVariables detect: [ :a | 
				          a name = aJavaNameNode source ] ]).
	ref := self instantiate: MOVariableReference for: aJavaNameNode.
	ref variable: named.
	^ ref
]

{ #category : #visiting }
MOJavaMooseBasedLoaderPhase2 >> visitNamespace: aFamixJavaNamespace [

	| pack |
	pack := mapping at: aFamixJavaNamespace.
	self push: pack during: [ 
		self visitCollection: aFamixJavaNamespace childNamespaces.
		self visitCollection: aFamixJavaNamespace types ]
]

{ #category : #visiting }
MOJavaMooseBasedLoaderPhase2 >> visitParameterizedType: aFamixJavaParameterizedType [

	| class |
	class := mapping at: aFamixJavaParameterizedType.

	self push: class during: [ 
		self visitCollection: aFamixJavaParameterizedType methods.
		self visitCollection:
			aFamixJavaParameterizedType annotationInstances ]
]

{ #category : #visiting }
MOJavaMooseBasedLoaderPhase2 >> visitProgram: aVBFunctionDefinitionNode [

	^ self visitCollection: aVBFunctionDefinitionNode sortedChildren
]

{ #category : #visiting }
MOJavaMooseBasedLoaderPhase2 >> visitProgramFile: aJavaProgramFileNode [

	self assert: aJavaProgramFileNode typeDeclarations size = 1.
	^ self visitCollection: aJavaProgramFileNode typeDeclarations
]

{ #category : #visiting }
MOJavaMooseBasedLoaderPhase2 >> visitReturnStatement: aJavaReturnStatementNode [

	| return |
	return := self instantiate: MOReturn for: aJavaReturnStatementNode.
	return expression:
		(aJavaReturnStatementNode expression acceptVisitor: self).
	^ return
]

{ #category : #visiting }
MOJavaMooseBasedLoaderPhase2 >> visitStringLiteral: aJavaStringLiteralNode [

	^ (MOStringLiteral newForJavaIn: model)
		  literal: aJavaStringLiteralNode token value;
		  yourself
]

{ #category : #visiting }
MOJavaMooseBasedLoaderPhase2 >> visitVariableDeclaration: aJavaVariableDeclarationNode [ 
	" Handled at the field level "
]
