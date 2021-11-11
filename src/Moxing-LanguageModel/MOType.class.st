Class {
	#name : #MOType,
	#superclass : #MOLanguageObject,
	#instVars : [
		'package',
		'modifiers'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #accessing }
MOType >> modifiers: aSet [
	modifiers := aSet
]
