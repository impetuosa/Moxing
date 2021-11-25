Class {
	#name : #MOTypescriptVariableDeclarationLoader,
	#superclass : #MOTypescriptAbstractLoader,
	#category : #'Moxing-Typescript-Loader'
}

{ #category : #generated }
MOTypescriptVariableDeclarationLoader >> visitTypeName: aTypeName [
	self halt .
"
	self assert: aTypeName names size = 1.
	result typeReference: ((MOTypeReference newForTypescriptIn: model) name:
			 aTypeName names first name value).
	result typeReference parent: result. 
	result typeReference anchor: result anchor / #typereference / result typeReference name"
]

{ #category : #generated }
MOTypescriptVariableDeclarationLoader >> visitVariableDeclaration: aVariableDeclaration [

	writer writeVariable: [ :var | var name: aVariableDeclaration variable name value ]
	
	
	"
	super visitVariableDeclaration: aVariableDeclaration.
" " 
	
	by default we should get the type #ANY 
		result typeReference  ifNil: [ 
		result typeReference: (MOTypescriptTypeLoader new
				 types: types;
				 model: model;
				 any) ]" 
		
]
