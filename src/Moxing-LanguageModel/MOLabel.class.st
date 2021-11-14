Class {
	#name : #MOLabel,
	#superclass : #MOLanguageObject,
	#instVars : [
		'label'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #accessing }
MOLabel >> acceptVisitor: aVisitor [

	^ aVisitor visitLabel: self
]

{ #category : #accessing }
MOLabel >> label: aString [ 
	label := aString asSymbol
]
