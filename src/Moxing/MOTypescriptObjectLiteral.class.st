Class {
	#name : #MOTypescriptObjectLiteral,
	#superclass : #MOTypescriptLiteral,
	#category : #'Moxing-ModelTS'
}

{ #category : #accessing }
MOTypescriptObjectLiteral >> acceptVisitor: aJinTypescriptCodeGenerator [ 
	aJinTypescriptCodeGenerator visitTypescriptObjectLiteral: self .
]

{ #category : #accessing }
MOTypescriptObjectLiteral >> dependencies [
	^ literal
		flatCollect: [ :a | a key dependencies , (a value dependencies) ]
]
