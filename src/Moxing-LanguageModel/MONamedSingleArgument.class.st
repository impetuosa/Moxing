Class {
	#name : #MONamedSingleArgument,
	#superclass : #MOLanguageObject,
	#instVars : [
		'#argumentExpression => MOExpressionSlot one'
	],
	#category : #'Moxing-LanguageModel-Expressions'
}

{ #category : #accessing }
MONamedSingleArgument >> acceptVisitor: aVisitor [

	^ aVisitor visitNamedSingleArgument: self
]

{ #category : #accessing }
MONamedSingleArgument >> argumentExpression [

	^ argumentExpression
]

{ #category : #accessing }
MONamedSingleArgument >> argumentExpression: anObject [

	argumentExpression := anObject
]

{ #category : #accessing }
MONamedSingleArgument >> isExpression [

	^ true
]

{ #category : #accessing }
MONamedSingleArgument >> isLabelledAs: aLabel [

	^ false
]
