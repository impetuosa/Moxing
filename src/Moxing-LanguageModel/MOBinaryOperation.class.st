Class {
	#name : #MOBinaryOperation,
	#superclass : #MOExpression,
	#instVars : [
		'#left => MOExpressesSlot one',
		'#operator => MOPropertySlot',
		'#right => MOExpressesSlot one'
	],
	#category : #'Moxing-LanguageModel-Expressions'
}

{ #category : #accessing }
MOBinaryOperation class >> isRenamable [
	^ false
]

{ #category : #accessing }
MOBinaryOperation >> isBinaryOperation [

	^ true
]

{ #category : #accessing }
MOBinaryOperation >> isReference [
	" It can be assigned "
	^ true
]

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
MOBinaryOperation >> name [

	^ operator
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
		nextPutAll: '(';
		print: left;
		nextPutAll: ' ';
		nextPutAll: operator;
		nextPutAll: ' ';
		print: right;
		nextPutAll: ')'
]

{ #category : #accessing }
MOBinaryOperation >> referee: aMOVariable [ 

]

{ #category : #accessing }
MOBinaryOperation >> right [
	^ right
]

{ #category : #accessing }
MOBinaryOperation >> right: aMOVariableReference [ 
	right := aMOVariableReference
]
