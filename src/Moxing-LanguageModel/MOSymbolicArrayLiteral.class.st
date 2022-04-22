Class {
	#name : #MOSymbolicArrayLiteral,
	#superclass : #MOLiteral,
	#category : #'Moxing-LanguageModel-Expressions'
}

{ #category : #accessing }
MOSymbolicArrayLiteral >> acceptVisitor: aVisitor [

	^ aVisitor visitSymbolicArrayLiteral: self
]

{ #category : #accessing }
MOSymbolicArrayLiteral >> literal [

	^ literal collect: [ :l | l literal ]
]
