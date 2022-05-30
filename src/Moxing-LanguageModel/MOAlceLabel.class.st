Class {
	#name : #MOAlceLabel,
	#superclass : #MOStatement,
	#instVars : [
		'#label => MOPropertySlot'
	],
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #accessing }
MOAlceLabel >> acceptVisitor: aVisitor [

	^ aVisitor visitLabel: self
]

{ #category : #accessing }
MOAlceLabel >> isLabelledAs: aLabel [
 	 ^ self name = aLabel
]

{ #category : #accessing }
MOAlceLabel >> label: aString [ 
	label := aString asSymbol
]
