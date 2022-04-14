Class {
	#name : #MONamedArgument,
	#superclass : #MOLanguageObject,
	#instVars : [
		'#argumentExpressions => MOExpressionSlot many'
	],
	#category : #'Moxing-LanguageModel-Expressions'
}

{ #category : #accessing }
MONamedArgument >> acceptVisitor: aVisitor [

	^ aVisitor visitNamedArgument: self
]

{ #category : #accessing }
MONamedArgument >> argumentExpressions [

	^ argumentExpressions
]

{ #category : #accessing }
MONamedArgument >> argumentExpressions: aCollection [ 
	argumentExpressions := aCollection
]

{ #category : #accessing }
MONamedArgument >> isExpression [

	^ true
]

{ #category : #accessing }
MONamedArgument >> isLabelledAs: aLabel [

	^ false
]
