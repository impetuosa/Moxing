Class {
	#name : #MOQueryAttribute,
	#superclass : #MOAttribute,
	#instVars : [
		'#reference => MOExpressesSlot one'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MOQueryAttribute >> reference: anUndefinedObject [ 
	reference := anUndefinedObject
]
