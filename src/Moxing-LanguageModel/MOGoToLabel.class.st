Class {
	#name : #MOGoToLabel,
	#superclass : #MOLanguageObject,
	#instVars : [
		'destination'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #accessing }
MOGoToLabel >> destination: aString [ 
	destination := aString asSymbol
]
