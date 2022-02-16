Class {
	#name : #MOLiteral,
	#superclass : #MOExpression,
	#instVars : [
		'#literal => MOPropertySlot'
	],
	#category : #'Moxing-LanguageModel-Expressions'
}

{ #category : #accessing }
MOLiteral >> acceptVisitor: aJinTypescriptCodeGenerator [

	^ aJinTypescriptCodeGenerator visitNullLiteral: self
]

{ #category : #accessing }
MOLiteral >> literal [
	^ literal
]

{ #category : #accessing }
MOLiteral >> literal: aLiteral [
	literal := aLiteral.
	name := #literal, literal asString.
]
