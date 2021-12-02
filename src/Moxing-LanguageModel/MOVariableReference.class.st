Class {
	#name : #MOVariableReference,
	#superclass : #MOTypedReference,
	#instVars : [
		'kind'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #visiting }
MOVariableReference >> acceptVisitor: aMOTypescriptCodeGenerator [

	^ aMOTypescriptCodeGenerator visitVariableReference: self
]

{ #category : #accessing }
MOVariableReference >> kind: aString [

	kind := aString
]

{ #category : #generated }
MOVariableReference >> type [
	^ candidate type 
]
