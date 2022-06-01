Class {
	#name : #MONamedArguments,
	#superclass : #MOLanguageObject,
	#instVars : [
		'#argumentExpressions => MOExpressionSlot many'
	],
	#category : #'Moxing-LanguageModel-Expressions'
}

{ #category : #visiting }
MONamedArguments >> acceptVisitor: aVisitor [

	^ aVisitor visitNamedArguments: self
]

{ #category : #accessing }
MONamedArguments >> argumentExpressions [

	^ argumentExpressions
]

{ #category : #accessing }
MONamedArguments >> argumentExpressions: anObject [

	argumentExpressions := anObject
]
