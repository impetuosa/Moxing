Class {
	#name : #MOGoToLabel,
	#superclass : #MOStatement,
	#instVars : [
		'#destination => MORefersSlot one'
	],
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #accessing }
MOGoToLabel >> acceptVisitor: aVisitor [

	^ aVisitor visitGoTo: self
]

{ #category : #accessing }
MOGoToLabel >> destination [
	^ destination
]

{ #category : #accessing }
MOGoToLabel >> destination: aReference [  
	destination := aReference
]
