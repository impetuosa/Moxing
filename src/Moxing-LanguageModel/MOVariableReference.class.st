Class {
	#name : #MOVariableReference,
	#superclass : #MOReference,
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #visiting }
MOVariableReference >> acceptVisitor: aMOTypescriptCodeGenerator [

	aMOTypescriptCodeGenerator visitVariableReference:
		self
]

{ #category : #generated }
MOVariableReference >> type [
	^ candidates anyOne type 
]
