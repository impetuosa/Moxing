Class {
	#name : #MOAlceGoToLabel,
	#superclass : #MOStatement,
	#instVars : [
		'#destination => MOReferenceSlot one'
	],
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #accessing }
MOAlceGoToLabel >> destination [
	^ destination
]

{ #category : #accessing }
MOAlceGoToLabel >> destination: aReference [  
	destination := aReference
]