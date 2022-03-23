Class {
	#name : #MOExpression,
	#superclass : #MOLanguageObject,
	#category : #'Moxing-LanguageModel-Expressions'
}

{ #category : #testing }
MOExpression >> isExpression [

	^ true
]

{ #category : #testing }
MOExpression >> isLabelledAs: aLabel [
 	 ^ false 
]
