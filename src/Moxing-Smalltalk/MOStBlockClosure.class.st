Class {
	#name : #MOStBlockClosure,
	#superclass : #MOExpression,
	#instVars : [
		'#block => MOContainmentSlot one'
	],
	#category : #'Moxing-Smalltalk-model'
}

{ #category : #accessing }
MOStBlockClosure >> acceptVisitor: aVisitor [

	^ aVisitor visitBlockClosure: self
]

{ #category : #accessing }
MOStBlockClosure >> block: aMOBlock [ 
	block := aMOBlock
]

{ #category : #testing }
MOStBlockClosure >> isReference [
	^ true
]
