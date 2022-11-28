Class {
	#name : #MOLabelWithStatement,
	#superclass : #MOStatement,
	#instVars : [
		'#label => MOPropertySlot',
		'#statement => MOStatesSlot one'
	],
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #accessing }
MOLabelWithStatement >> label: aString [ 
	label := aString
]

{ #category : #accessing }
MOLabelWithStatement >> statement: aMOWhile [ 
	statement := aMOWhile
]
