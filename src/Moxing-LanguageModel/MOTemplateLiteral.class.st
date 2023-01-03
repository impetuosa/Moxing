Class {
	#name : #MOTemplateLiteral,
	#superclass : #MOLiteral,
	#instVars : [
		'#expressions => MOExpressesSlot many'
	],
	#category : #'Moxing-LanguageModel-Expressions'
}

{ #category : #visiting }
MOTemplateLiteral >> acceptVisitor: aVisitor [

	^ aVisitor visitTemplateLiteral: self
]

{ #category : #accessing }
MOTemplateLiteral >> expressions [

	^ expressions
]

{ #category : #accessing }
MOTemplateLiteral >> expressions: aCollection [

	expressions := aCollection
]
