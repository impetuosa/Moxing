Class {
	#name : #MOThrow,
	#superclass : #MOExpression,
	#instVars : [
		'#argument => MOExpressionSlot one'
	],
	#category : #'Moxing-LanguageModel-References'
}

{ #category : #accessing }
MOThrow >> acceptVisitor: ads [

	^ ads visitThrow: self
]

{ #category : #accessing }
MOThrow >> argument [

	^ argument
]

{ #category : #accessing }
MOThrow >> argument: anArgument [ 
	 argument := anArgument 
]
