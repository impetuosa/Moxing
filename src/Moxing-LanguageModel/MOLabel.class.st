Class {
	#name : #MOLabel,
	#superclass : #MOStatement,
	#instVars : [
		'#label => MOPropertySlot'
	],
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #visiting }
MOLabel >> acceptVisitor: aMOModelVariableResolver [

	^ aMOModelVariableResolver visitLabel: self
]

{ #category : #accessing }
MOLabel >> label: aString [ 
	label := aString
]
