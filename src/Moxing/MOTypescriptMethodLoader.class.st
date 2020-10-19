Class {
	#name : #MOTypescriptMethodLoader,
	#superclass : #MOTypescriptAbstractLoader,
	#category : #'Moxing-ModelReading'
}

{ #category : #generated }
MOTypescriptMethodLoader >> visitMemberFunctionDeclaration: aMethodDefinition [
	result := MOTypescriptMethod new.
	result selector: aMethodDefinition name name value.
	self acceptNodes: aMethodDefinition signature parameters.
	result
		type:
			(MOTypescriptTypeLoader
				load: aMethodDefinition signature type
				file: file
				types: types).
	self
		assert:
			(aMethodDefinition statements
				noneSatisfy: [ :n | n isKindOf: JSAssignmentExpressionNode ])
]

{ #category : #generated }
MOTypescriptMethodLoader >> visitMethodDefinition: aMethodDefinition [

	result := MOTypescriptMethod new.
	result selector: aMethodDefinition name name value.
	self acceptNodes: aMethodDefinition parameters .

	self assert: aMethodDefinition type isNil.
	 
	self assert: (aMethodDefinition statements noneSatisfy: [ : n | n isKindOf: JSAssignmentExpressionNode ])
]

{ #category : #generated }
MOTypescriptMethodLoader >> visitVariableDeclaration: aVarDeclaration [
	| param |
	param := MOTypescriptVariableDeclarationLoader
		load: aVarDeclaration
		file: file
		types: types.
	result addParameter: param
]
