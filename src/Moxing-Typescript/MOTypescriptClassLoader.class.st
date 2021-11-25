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
MOTypescriptClassLoader class >> loadClassFromFile: aFile for: aComponent into: aMOModel [

	| loader |
	loader := self new.
	loader writer: aMOModel writer.
	loader component: aComponent.
	^ loader loadArtefact: (TypeScriptParser parseFile: aFile)
]

{ #category : #'instance creation' }
MOTypescriptClassLoader >> component: aMOAngularComponentBehaviour [

	component := aMOAngularComponentBehaviour.
	
]

{ #category : #generated }
MOTypescriptClassLoader >> loadArtefact: anAstNode [

	component ifNotNil: [ writer anchoringOn: component anchor ].
	^ writer writeClass: [ :wc | 
		          self use: wc during: [ anAstNode acceptVisitor: self ] ]
]

{ #category : #generated }
MOTypescriptClassLoader >> model: aModel [

	super model: aModel.
	writer := MOModelWriter new
		          model: aModel;
		          yourself.
]

{ #category : #generated }
MOTypescriptClassLoader >> visitClassExpression: aClassExpression [

	writer name: aClassExpression name name value.
	aClassExpression types do: [ :t | 
		writer addSuperTypeReference: (writer typeReferenceNamed: t type source) ].

	self acceptNodes: aClassExpression elements
]

{ #category : #generated }
MOTypescriptClassLoader >> visitDecoratorExpression: aDecoratorExpression [

	MOTypescriptDecoratorLoader
		loadArtefact: aDecoratorExpression
		writer: writer
]

{ #category : #generated }
MOTypescriptClassLoader >> visitImportDeclaration: anImport [

	writer writeImport: [ :import | 
		import file: anImport from value.
		anImport imports do: [ :imports | 
			imports specifiers do: [ :spec | 
				import importTypeName: spec source ] ] ]
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
MOTypescriptClassLoader >> visitPropertyAssignment: aDecoratorExpression [

]

{ #category : #generated }
MOTypescriptClassLoader >> visitVariableDeclaration: aVariableDeclaration [

	self halt
	"result addProperty: (MOTypescriptVariableDeclarationLoader
			 load: aVariableDeclaration
			 file: file
			 anchor: result anchor
			 types: types
			 model: model
			 parent: result)"
]
