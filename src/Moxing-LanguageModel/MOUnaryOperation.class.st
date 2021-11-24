Class {
	#name : #MOUnaryOperation,
	#superclass : #MOLanguageObject,
	#instVars : [
		'operator',
		'operand',
		'order'
	],
	#category : #'Moxing-LanguageModel-Model'
}

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
MOUnaryOperation >> setAsPostfix [
	" the operator is on the right of the operand: 1! (factorial) "
	 order := #postfix
]

{ #category : #accessing }
MOUnaryOperation >> setAsPrefix [

	" the operator is on the left of the operand: !1 (not 1) "

	order := #prefix
]
