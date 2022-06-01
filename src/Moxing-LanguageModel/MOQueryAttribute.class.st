Class {
	#name : #MOQueryAttribute,
	#superclass : #MOAttribute,
	#instVars : [
		'#reference => MOExpressionSlot one'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MOQueryAttribute >> reference: anUndefinedObject [ 
	reference := anUndefinedObject
]
