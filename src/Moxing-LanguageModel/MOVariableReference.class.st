Class {
	#name : #MOVariableReference,
	#superclass : #MOLanguageObject,
	#instVars : [
		'variable'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #visiting }
MOVariableReference >> acceptVisitor: aMOTypescriptCodeGenerator [

	aMOTypescriptCodeGenerator visitVariableReference:
		self
]

{ #category : #generated }
MOVariableReference >> type [
	^ variable type 
]

{ #category : #accessing }
MOVariableReference >> variable [
	^ variable
]

{ #category : #accessing }
MOVariableReference >> variable: aMOVariable [ 
	variable := aMOVariable
]
