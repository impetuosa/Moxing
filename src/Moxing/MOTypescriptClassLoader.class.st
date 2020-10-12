Class {
	#name : #MOTypescriptClassLoader,
	#superclass : #MOTypescriptAbstractLoader,
	#instVars : [
		'decorator'
	],
	#category : #'Moxing-ModelReading'
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
MOTypescriptClassLoader class >> loadClassFromStream: aStream [

	| loader |
	loader := self new.

	(TypeScriptParser parseStream: aStream) acceptVisitor: loader.
	^ loader result
]

{ #category : #generated }
MOTypescriptClassLoader >> initialize [
	super initialize.
	result := MOTypescriptClass new
]

{ #category : #generated }
MOTypescriptClassLoader >> visitClassExpression: aClassExpression [

	
	result name: aClassExpression name name value.
	result implements: (aClassExpression types collect: [ :t | 
			 MOTypescriptTypeLoader load: t file: file ]).
	result decorator: decorator. 
	self acceptNodes: aClassExpression elements.
	
]

{ #category : #generated }
MOTypescriptClassLoader >> visitDecoratorExpression: aDecoratorExpression [

	decorator := MOTypescriptDecoratorLoader load: aDecoratorExpression file: file. 
]

{ #category : #generated }
MOTypescriptClassLoader >> visitImportDeclaration: anImport [
	| import |
	import := MOTypescriptImport new.
	import
		types:
			((anImport imports
				flatCollect:
					[ :i | i specifiers collect: [ :s | s binding name value ] ])
				asSet
				collect: [ :n | 
					MOTypescriptTypeReference new
						name: n;
						yourself ]).
	import from: anImport from value asFileReference.
	result addImport: import
]

{ #category : #generated }
MOTypescriptClassLoader >> visitMemberFunctionDeclaration: aMethodDefinition [
	result addMethod: (MOTypescriptMethodLoader load: aMethodDefinition file: file )
]

{ #category : #generated }
MOTypescriptClassLoader >> visitMethodDefinition: aMethodDefinition [

	result addMethod: (MOTypescriptMethodLoader load: aMethodDefinition file: file )
]

{ #category : #generated }
MOTypescriptClassLoader >> visitPropertyAssignment: aDecoratorExpression [
	self halt .
]

{ #category : #generated }
MOTypescriptClassLoader >> visitVariableDeclaration: aVariableDeclaration [
	result
		addProperty:
			(MOTypescriptVariableDeclarationLoader
				load: aVariableDeclaration
				file: file)
]
