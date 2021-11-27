Class {
	#name : #MOJavapASTClassLoader,
	#superclass : #JavaProgramNodeVisitor,
	#instVars : [
		'model',
		'stack',
		'lastId'
	],
	#category : #'Moxing-Java-Loader'
}

{ #category : #'as yet unclassified' }
MOJavapASTClassLoader >> calculatePackageNaming: aJavaClassTypeNode [

	^ '.' split: aJavaClassTypeNode name nspace source
]

{ #category : #testing }
MOJavapASTClassLoader >> hasPublicModifier: aClassDeclaration [

	^ aClassDeclaration modifiers contains: [ :m | 
		  m token value asLowercase = #public ]
]

{ #category : #accessing }
MOJavapASTClassLoader >> lastIdString [

	^ (lastId ifNil: [ lastId := 0 ] ifNotNil: [ lastId := lastId + 1 ])
		  asString
]

{ #category : #accessing }
MOJavapASTClassLoader >> model: aMOModel [

	model := aMOModel . 
]

{ #category : #initialization }
MOJavapASTClassLoader >> push: aValue during: aBlock [
	self stack push: aValue.
	aBlock
		ensure: [ self stack pop ]
]

{ #category : #initialization }
MOJavapASTClassLoader >> resetLastId [
	lastId := nil
]

{ #category : #'as yet unclassified' }
MOJavapASTClassLoader >> resolvePackage: aCollection [

	^ aCollection allButFirst
		  inject: (model entities
				   detect: [ :e | 
					   (e isKindOf: MOPackage) and: [ 
						   (e parent isKindOf: MOPackage) not and: [ 
							   e name = aCollection first ] ] ]
				   ifNone: [ 
					   (model instantiate: MOPackage)
						   name: aCollection first;
						   yourself ])
		  into: [ :package :name | 
			  package subpackages detect: [ :p | p name = name ] ifNone: [ 
				  | new |
				  new := (model instantiate: MOPackage)
					         name: name;
					         yourself.
				  package addPackage: new.
				  new parent: package.
				  new ] ]
]

{ #category : #accessing }
MOJavapASTClassLoader >> stack [
	^ stack ifNil: [ stack := Stack new  ]
]

{ #category : #'as yet unclassified' }
MOJavapASTClassLoader >> typeNameFor: aJavaClassTypeNode [ 
	^ aJavaClassTypeNode name name value
]

{ #category : #accessing }
MOJavapASTClassLoader >> typeReferenceTo: aMethodType [

	| ref |
	ref := model instantiate: MOTypeReference.
	ref name: aMethodType source.
	^ ref
]

{ #category : #accessing }
MOJavapASTClassLoader >> visitAnnotation: anAnnotation [

self halt 
]

{ #category : #accessing }
MOJavapASTClassLoader >> visitAnnotationInterface: anAnnotationInterface [

self halt 
]

{ #category : #accessing }
MOJavapASTClassLoader >> visitClassDeclaration: aClassDeclaration [

	| package className class |
	(self hasPublicModifier: aClassDeclaration) ifFalse: [ ^ self ].
	package := self resolvePackage:
		           (self calculatePackageNaming: aClassDeclaration name).
	className := self typeNameFor: aClassDeclaration name.
	package types detect: [ :a | a name = className ] ifNone: [ 
		class := model instantiate: MOClass.
		class modifiers:
			(aClassDeclaration modifiers collect: [ :m | m source ]).
		class name: className.
		package addType: class.
		class parent: package.
		self
			push: class
			during: [ super visitClassDeclaration: aClassDeclaration ] ]
]

{ #category : #accessing }
MOJavapASTClassLoader >> visitConstructorDeclaration: aConstructorDeclaration [

	| constructor |
	(self hasPublicModifier: aConstructorDeclaration) ifFalse: [ ^ self ].

	constructor := model instantiate: MOConstructor.
	constructor modifiers:
		(aConstructorDeclaration modifiers collect: [ :m | m source ]).
	stack top addMethod: constructor.
	self resetLastId.
	self
		push: constructor
		during: [ 
		super visitConstructorDeclaration: aConstructorDeclaration ]
]

{ #category : #accessing }
MOJavapASTClassLoader >> visitEnumDeclaration: anEnumDeclaration [



self halt 
]

{ #category : #accessing }
MOJavapASTClassLoader >> visitFieldDeclaration: aFieldDeclaration [

	| field type |
	(self hasPublicModifier: aFieldDeclaration) ifFalse: [ ^ self ].

	type := self typeReferenceTo: aFieldDeclaration type.

	aFieldDeclaration variableDeclarations do: [ :vd | 
		field := model instantiate: MOVariable.
		field modifiers:
			(aFieldDeclaration modifiers collect: [ :m | m source ]).
		field name: vd variable name value.
		field type: type.
		stack top addVariable: field.
		field parent: stack top.
		field ]
]

{ #category : #accessing }
MOJavapASTClassLoader >> visitInterfaceDeclaration: anInterfaceDeclaration [

	| package className class |
	(self hasPublicModifier: anInterfaceDeclaration) ifFalse: [ ^ self ].
	package := self resolvePackage:
		           (self calculatePackageNaming: anInterfaceDeclaration name).
	className := self typeNameFor: anInterfaceDeclaration name.
	package types detect: [ :a | a name = className ] ifNone: [ 
		class := model instantiate: MOClassType.
		class modifiers:
			(anInterfaceDeclaration modifiers collect: [ :m | m source ]).
		class name: className.
		package addType: class.
		class parent: package.
		self
			push: class
			during: [ super visitInterfaceDeclaration: anInterfaceDeclaration ] ]
]

{ #category : #accessing }
MOJavapASTClassLoader >> visitMethodDeclaration: aMethodDeclaration [

	| method |
	(self hasPublicModifier: aMethodDeclaration) ifFalse: [ ^ self ].
	self resetLastId.
	method := model instantiate: MOMethod.
	method modifiers:
		(aMethodDeclaration modifiers collect: [ :m | m source ]).
	method selector: aMethodDeclaration declarator name value.


	method type: (self typeReferenceTo: aMethodDeclaration type).

	stack top addMethod: method.

	self
		push: method
		during: [ super visitMethodDeclaration: aMethodDeclaration ]
]

{ #category : #accessing }
MOJavapASTClassLoader >> visitParameter: aParameter [

	| param |
	param := model instantiate: MOVariable.
	param name: (aParameter variable
			 ifNil: [ 'param' , self lastIdString ]
			 ifNotNil: [ self halt ]).
	param type: (self typeReferenceTo: aParameter type)
]
