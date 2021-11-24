Class {
	#name : #MOBinaryOperation,
	#superclass : #MOLanguageObject,
	#instVars : [
		'left',
		'operator',
		'right'
	],
	#category : #'Moxing-LanguageModel-Model'
}

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
MOBinaryOperation >> right: aMOVariableReference [ 
	right := aMOVariableReference
]
