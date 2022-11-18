Class {
	#name : #MOLambda,
	#superclass : #MOExpression,
	#instVars : [
		'#block => MODeclaresSlot one',
		'#parameters => MODeclaresSlot many'
	],
	#category : #'Moxing-LanguageModel-Expressions'
}

{ #category : #accessing }
MOLambda >> acceptVisitor: aVisitor [

	^ aVisitor visitBlockClosure: self
]

{ #category : #accessing }
MOLambda >> block [
	^ block
]

{ #category : #accessing }
MOLambda >> block: aMOBlock [ 
	block := aMOBlock
]

{ #category : #testing }
MOLambda >> isReference [
	^ true
]

{ #category : #testing }
MOLambda >> parameters [
	 ^ parameters ifNil: [ {  } ]
]

{ #category : #testing }
MOLambda >> parameters: aCol [
  parameters := aCol
]
