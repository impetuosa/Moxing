Class {
	#name : #MOTypescriptVariableDeclarationLoader,
	#superclass : #MOTypescriptAbstractLoader,
	#category : #'Moxing-ModelReading'
}

{ #category : #generated }
MOTypescriptVariableDeclarationLoader >> visitTypeName: aTypeName [  
	self halt. 
	self assert: aTypeName names size = 1 .
	 result type: (MOTypescriptTypeReference new name: aTypeName names first name  value   )
]

{ #category : #generated }
MOTypescriptVariableDeclarationLoader >> visitVariableDeclaration: aVariableDeclaration [

	result := MOTypescriptVariable new.
	result name: aVariableDeclaration variable name value.
	super visitVariableDeclaration: aVariableDeclaration
]
