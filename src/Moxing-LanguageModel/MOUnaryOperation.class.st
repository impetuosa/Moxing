Class {
	#name : #MOUnaryOperation,
	#superclass : #MOExpression,
	#instVars : [
		'#operator => MOPropertySlot',
		'#operand => MOExpressesSlot one',
		'#order => MOPropertySlot'
	],
	#category : #'Moxing-LanguageModel-Expressions'
}

{ #category : #accessing }
MOUnaryOperation >> isPostfix [

	" the operator is on the left of the operand: !1 (not 1) "

	^ order = #postfix
]

{ #category : #accessing }
MOUnaryOperation >> isPrefix [

	" the operator is on the left of the operand: !1 (not 1) "

	^ order = #prefix
]

{ #category : #accessing }
MOUnaryOperation >> isReference [

	^ true
]

{ #category : #accessing }
MOUnaryOperation >> isUnaryOperation [

	^ true
]

{ #category : #generated }
MOUnaryOperation >> operand [

	^ operand
]

{ #category : #generated }
MOUnaryOperation >> operand: aMOVariableReference [

	operand := aMOVariableReference
]

{ #category : #accessing }
MOUnaryOperation >> operator [
	^ operator
]

{ #category : #accessing }
MOUnaryOperation >> operator: aString [ 
	operator := aString
]

{ #category : #accessing }
MOUnaryOperation >> order [
	^ order ifNil: [  order := #prefix ]
]

{ #category : #accessing }
MOUnaryOperation >> order: aSymbol [
	order := aSymbol 
]

{ #category : #accessing }
MOUnaryOperation >> printOn: aStream [

	self isPrefix ifTrue: [ 
		aStream
			nextPutAll: operator;
			nextPutAll: ' ' ].
	aStream print: operand.
	self isPostfix ifTrue: [ 
		aStream
			nextPutAll: operator;
			nextPutAll: ' ' ]
]

{ #category : #accessing }
MOUnaryOperation >> setAsPostfix [
	" the operator is on the right of the operand: 1! (factorial) "
	 order := #postfix
]

{ #category : #accessing }
MOUnaryOperation >> setAsPrefix [

	" the operator is on the left of the operand: !1 (not 1) "

	order := #prefix
]
