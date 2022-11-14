Class {
	#name : #MOArrayLiteral,
	#superclass : #MOLiteral,
	#category : #'Moxing-LanguageModel-Expressions'
}

{ #category : #visiting }
MOArrayLiteral >> acceptVisitor: aVisitor [

	^ aVisitor visitArrayLiteral: self
]

{ #category : #visiting }
MOArrayLiteral >> literal [

	^ literal collect: [ :l | l literal ]
]
