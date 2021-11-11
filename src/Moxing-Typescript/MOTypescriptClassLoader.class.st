Class {
	#name : #MOTypescriptClassLoader,
	#superclass : #MOTypescriptAbstractLoader,
	#instVars : [
		'decorator',
		'component'
	],
	#category : #'Moxing-Typescript-Loader'
}

{ #category : #'as yet unclassified' }
MOTypescriptClassLoader class >> loadClassFromFile: aFile [

	| loader |
	loader := self new.
	loader file: aFile. 
	(TypeScriptParser parseFile: aFile) acceptVisitor: loader.
	^ loader result
]

{ #category : #'as yet unclassified' }
MOTypescriptClassLoader class >> loadClassFromFile: aFile for: aComponent  into: aMOModel [ 
		| loader |
	loader := self new.
	loader model: aMOModel. 
	loader file: aFile. 
	loader component: aComponent. 
	(TypeScriptParser parseFile: aFile) acceptVisitor: loader.
	^ loader result
]

{ #category : #'instance creation' }
MOTypescriptClassLoader >> component: aMOAngularComponentBehaviour [

	component := aMOAngularComponentBehaviour.
	
]

{ #category : #generated }
MOTypescriptClassLoader >> initialize [
	super initialize.
	types := Dictionary new .
]

{ #category : #generated }
MOTypescriptClassLoader >> model: aModel [ 
	super model: aModel .
	result := MOClass newForTypescriptIn: model. 
]

{ #category : #generated }
MOTypescriptClassLoader >> visitClassExpression: aClassExpression [

	result name: aClassExpression name name value.
	result anchor: component anchor / #class / result name.
	result implements: (aClassExpression types collect: [ :t | 
			 MOTypescriptTypeLoader
				 load: t
				 file: file
				 anchor: result anchor
				 types: types
				 model: model
				 parent: result ]).
	decorator ifNotNil: [ 
		result decorator: decorator.
		decorator anchor: result anchor / #decorator / decorator name ].

	self acceptNodes: aClassExpression elements
]

{ #category : #generated }
MOTypescriptClassLoader >> visitDecoratorExpression: aDecoratorExpression [

	decorator := MOTypescriptDecoratorLoader
		             load: aDecoratorExpression
		             file: file
		             anchor: nil
		             types: types
		             model: model
		             parent: result
]

{ #category : #generated }
MOTypescriptClassLoader >> visitImportDeclaration: anImport [

	| import |
	import := MOImport newForTypescriptIn: model.
	import parent: result.
	import types: ((anImport imports flatCollect: [ :i | 
			  i specifiers collect: [ :s | s binding name value ] ]) asSet 
			 collect: [ :n | 
				 types at: anImport from value , '.' , n ifAbsentPut: [ 
					 ((MOTypescriptPrebuiltTypeReferenceFactory defaultFor: model)
						  typeReference: n
						  definedAt: anImport from value)
						 parent: result;
						 yourself ] ]).
	import from: anImport from value.
	result addImport: import
]

{ #category : #generated }
MOTypescriptClassLoader >> visitMemberFunctionDeclaration: aMethodDefinition [

	result addMethod: (MOTypescriptMethodLoader
			 load: aMethodDefinition
			 file: file
			 anchor: result anchor
			 types: types
			 model: model
			 parent: result)
]

{ #category : #generated }
MOTypescriptClassLoader >> visitMethodDefinition: aMethodDefinition [

	result addMethod: (MOTypescriptMethodLoader
			 load: aMethodDefinition
			 file: file
			 anchor: result anchor
			 types: types
			 model: model
			 parent: result)
]

{ #category : #generated }
MOTypescriptClassLoader >> visitPropertyAssignment: aDecoratorExpression [

]

{ #category : #generated }
MOTypescriptClassLoader >> visitVariableDeclaration: aVariableDeclaration [

	result addProperty: (MOTypescriptVariableDeclarationLoader
			 load: aVariableDeclaration
			 file: file
			 anchor: result anchor
			 types: types
			 model: model
			 parent: result)
]
