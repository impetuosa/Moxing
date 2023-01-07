Class {
	#name : #MONamedSingleArgument,
	#superclass : #MOLanguageConstruct,
	#instVars : [
		'#name => MOPropertySlot',
		'#argumentExpression => MOExpressesSlot one'
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

{ #category : #accessing }
MONamedSingleArgument >> isNamedArgument [

	^ true
]

{ #category : #accessing }
MONamedSingleArgument >> name [

	^ name
]

{ #category : #accessing }
MONamedSingleArgument >> name: anObject [

	name := anObject
]
