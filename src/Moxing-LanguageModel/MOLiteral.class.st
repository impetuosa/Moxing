Class {
	#name : #MOLiteral,
	#superclass : #MOExpression,
	#instVars : [
		'#literal => MOPropertySlot'
	],
	#category : #'Moxing-LanguageModel-Expressions'
}

{ #category : #accessing }
MOLiteral class >> isRenamable [

	^ false
]

{ #category : #accessing }
MOLiteral >> acceptVisitor: aJinTypescriptCodeGenerator [

	^ aJinTypescriptCodeGenerator visitLiteral: self
]

{ #category : #accessing }
MOLiteral >> isMOLiteral [

	^ true
]

{ #category : #accessing }
MOLiteral >> isReference [

	^ true
]

{ #category : #accessing }
MOLiteral >> literal [
	^ literal
]

{ #category : #accessing }
MOLiteral >> literal: aLiteral [
	literal := aLiteral.
	self name: #literal, literal asString.
]

{ #category : #printing }
MOLiteral >> printOn: aStream [

	aStream
		nextPutAll: 'LIT ';
		print: self literal
]
