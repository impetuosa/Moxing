Class {
	#name : #MOBinaryOperation,
	#superclass : #MOExpression,
	#instVars : [
		'#left => MOExpressionSlot one',
		'#operator => MOPropertySlot',
		'#right => MOExpressionSlot one'
	],
	#category : #'Moxing-LanguageModel-Expressions'
}

{ #category : #accessing }
MOBinaryOperation >> kindOfOp [
	^ 'binary'
]

{ #category : #accessing }
MOBinaryOperation >> left [
	^ left
]

{ #category : #accessing }
MOBinaryOperation >> left: aMOVariableReference [ 
	left := aMOVariableReference
]

{ #category : #accessing }
MOBinaryOperation >> operator [
	^ operator
]

{ #category : #accessing }
MOBinaryOperation >> operator: aString [ 
	operator := aString
]

{ #category : #accessing }
MOBinaryOperation >> printOn: aStream [

	aStream
		nextPutAll: self kindOfOp;
		nextPutAll: '(';
		print: left;
		nextPutAll: ' ';
		nextPutAll: operator;
		nextPutAll: ' ';
		print: right;
		nextPutAll: ')'
]

{ #category : #accessing }
MOBinaryOperation >> right [
	^ right
]

{ #category : #accessing }
MOBinaryOperation >> right: aMOVariableReference [ 
	right := aMOVariableReference
]
