Class {
	#name : #MOTypescriptVariableDeclarationLoader,
	#superclass : #MOTypescriptAbstractLoader,
	#category : #'Moxing-Typescript-Loader'
}

{ #category : #generated }
MOTypescriptVariableDeclarationLoader >> visitTypeName: aTypeName [

	self assert: aTypeName names size = 1.
	result typeReference: ((MOTypeReference newForTypescriptIn: model) name:
			 aTypeName names first name value).
	result typeReference parent: result. 
	result typeReference anchor: result anchor / #typereference / result typeReference name
]

{ #category : #generated }
MOTypescriptVariableDeclarationLoader >> visitVariableDeclaration: aVariableDeclaration [

	result := MOVariable newForTypescriptIn: model.
	result parent: parent.
	result anchor: anchor . 
	result name: aVariableDeclaration variable name value.
	super visitVariableDeclaration: aVariableDeclaration.
	result typeReference  ifNil: [ 
		result typeReference: (MOTypescriptTypeLoader new
				 types: types;
				 model: model;
				 any) ]
]
