Class {
	#name : #MOLambda,
	#superclass : #MOExpression,
	#instVars : [
		'#block => MOContainmentSlot one',
		'#parameters => MOContainmentSlot many'
	],
	#category : #'Moxing-Java'
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
