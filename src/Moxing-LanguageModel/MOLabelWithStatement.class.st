Class {
	#name : #MOLabelWithStatement,
	#superclass : #MOLabel,
	#instVars : [
		'#statement => MOStatesSlot one'
	],
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #visiting }
MOLabelWithStatement >> acceptVisitor: aMOModelVariableResolver [

	^ aMOModelVariableResolver visitLabelWithStatement: self
]

{ #category : #accessing }
MOLabelWithStatement >> statement: aMOWhile [ 
	statement := aMOWhile
]
