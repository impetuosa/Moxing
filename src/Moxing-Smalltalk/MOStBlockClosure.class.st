Class {
	#name : #MOStBlockClosure,
	#superclass : #MOExpression,
	#instVars : [
		'#block => MOContainmentSlot one',
		'#parameters => MOContainmentSlot many'
	],
	#category : #'Moxing-Smalltalk-model'
}

{ #category : #accessing }
MOStBlockClosure >> acceptVisitor: aVisitor [

	^ aVisitor visitBlockClosure: self
]

{ #category : #accessing }
MOStBlockClosure >> block [
	^ block
]

{ #category : #accessing }
MOStBlockClosure >> block: aMOBlock [ 
	block := aMOBlock
]

{ #category : #testing }
MOStBlockClosure >> isReference [
	^ true
]

{ #category : #testing }
MOStBlockClosure >> parameters [
	 ^ parameters ifNil: [ {  } ]
]

{ #category : #testing }
MOStBlockClosure >> parameters: aCol [
  parameters := aCol
]
