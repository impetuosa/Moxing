Class {
	#name : #MOTypescriptVariableDeclarationLoader,
	#superclass : #MOTypescriptAbstractLoader,
	#category : #'Moxing-Typescript-Loader'
}

{ #category : #generated }
MOTypescriptVariableDeclarationLoader >> visitTypeName: aTypeName [

	self assert: aTypeName names size = 1.
	result type: ((MOTypeReference newForTypescriptIn: model) name:
			 aTypeName names first name value).
	result type parent: result. 
	result type anchor: result anchor / #typereference / result type name
]

{ #category : #generated }
MOTypescriptVariableDeclarationLoader >> visitVariableDeclaration: aVariableDeclaration [

	result := MOVariable newForTypescriptIn: model.
	result parent: parent.
	result anchor: anchor . 
	result name: aVariableDeclaration variable name value.
	super visitVariableDeclaration: aVariableDeclaration.
	result type ifNil: [ 
		result type: (MOTypescriptTypeLoader new
				 types: types;
				 model: model;
				 any) ]
]
