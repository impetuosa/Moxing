Class {
	#name : #MOVariableRererence,
	#superclass : #MOLanguageObject,
	#instVars : [
		'variable'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #visiting }
MOVariableRererence >> acceptVisitor: aMOTypescriptCodeGenerator [

	aMOTypescriptCodeGenerator visitVariableReference:
		self
]

{ #category : #accessing }
MOVariableRererence >> variable [
	^ variable
]

{ #category : #accessing }
MOVariableRererence >> variable: aMOVariable [ 
	variable := aMOVariable
]
