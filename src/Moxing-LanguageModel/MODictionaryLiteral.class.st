Class {
	#name : #MODictionaryLiteral,
	#superclass : #MOLiteral,
	#category : #'Moxing-LanguageModel-Expressions'
}

{ #category : #visiting }
MODictionaryLiteral >> acceptVisitor: aVisitor [

	^ aVisitor visitDictionaryLiteral: self
]

{ #category : #visiting }
MODictionaryLiteral >> literal [

	^ (literal associations collect: [ :l | l key -> l value literal ])
		  asDictionary
]
