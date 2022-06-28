Class {
	#name : #MOObjectLiteral,
	#superclass : #MOLiteral,
	#category : #'Moxing-LanguageModel-Expressions'
}

{ #category : #accessing }
MOObjectLiteral >> acceptVisitor: aJinTypescriptCodeGenerator [

	^ aJinTypescriptCodeGenerator visitObjectLiteral: self
]

{ #category : #accessing }
MOObjectLiteral >> dependencies [
	^ literal
		flatCollect: [ :a | a key dependencies , (a value dependencies) ]
]
