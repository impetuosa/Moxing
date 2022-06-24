Class {
	#name : #MOForNext,
	#superclass : #MOStatement,
	#instVars : [
		'#counter => MOExpressionSlot one',
		'#initialValue => MOExpressionSlot one',
		'#limitValue => MOExpressionSlot one',
		'#step => MOExpressionSlot one',
		'#loopingBlock => MOContainmentSlot one'
	],
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #visiting }
MOForNext >> acceptVisitor: aVisitor [

	^ aVisitor visitForNext: self
]

{ #category : #accessing }
MOForNext >> counter [
	^ counter
]

{ #category : #accessing }
MOForNext >> counter: aMOVariableReference [ 
	counter := aMOVariableReference
]

{ #category : #accessing }
MOForNext >> initialValue [
	^ initialValue
]

{ #category : #accessing }
MOForNext >> initialValue: aMOIntegerLiteral [ 
	initialValue := aMOIntegerLiteral
]

{ #category : #accessing }
MOForNext >> limitValue [
	^ limitValue
]

{ #category : #accessing }
MOForNext >> limitValue: aMOVariableReference [ 
	limitValue := aMOVariableReference
]

{ #category : #accessing }
MOForNext >> loopingBlock [
	^ loopingBlock
]

{ #category : #accessing }
MOForNext >> loopingBlock: aMOBlock [ 
	loopingBlock := aMOBlock
]

{ #category : #accessing }
MOForNext >> step [
	^ step
]

{ #category : #accessing }
MOForNext >> step: aMOIntegerLiteral [ 
	step := aMOIntegerLiteral
]
