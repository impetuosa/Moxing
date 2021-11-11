Class {
	#name : #MOTypescriptMethodLoader,
	#superclass : #MOTypescriptAbstractLoader,
	#category : #'Moxing-Typescript-Loader'
}

{ #category : #generated }
MOTypescriptMethodLoader >> visitMemberFunctionDeclaration: aMethodDefinition [

	result := MOMethod new.
	result selector: aMethodDefinition name name value.
	self acceptNodes: aMethodDefinition signature parameters.
	result type: (MOTypescriptTypeLoader
			 load: aMethodDefinition signature type
			 file: file
			 anchor: result anchor
			 types: types
			 model: model
			 parent: result).
	self assert: (aMethodDefinition statements noneSatisfy: [ :n | 
			 n isKindOf: JSAssignmentExpressionNode ])
]

{ #category : #generated }
MOTypescriptMethodLoader >> visitMethodDefinition: aMethodDefinition [

	result := MOMethod newForTypescriptIn: model.
	result selector: aMethodDefinition name name value.
	result anchor: anchor / #methods / result selector.  
	self acceptNodes: aMethodDefinition parameters.
	aMethodDefinition type ifNotNil: [ 
		result type: (MOTypescriptTypeLoader
				 load: aMethodDefinition type
				 file: file
				 anchor: result anchor
				 types: types
				 model: model
				 parent: result).
		result type parent: result ].

	self assert: (aMethodDefinition statements noneSatisfy: [ :n | 
			 n isKindOf: JSAssignmentExpressionNode ])
]

{ #category : #generated }
MOTypescriptMethodLoader >> visitVariableDeclaration: aVarDeclaration [

	| param |
	param := MOTypescriptVariableDeclarationLoader
		         load: aVarDeclaration
		         file: file
		         anchor: result anchor
		         types: types
		         model: model
		         parent: result.

	result addParameter: param
]
