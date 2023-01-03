Class {
	#name : #MONamedArguments,
	#superclass : #MOLanguageConstruct,
	#instVars : [
		'#name => MOPropertySlot',
		'#argumentExpressions => MOExpressesSlot many'
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

{ #category : #accessing }
MONamedArguments >> isExpression [

	^ true
]

{ #category : #accessing }
MONamedArguments >> name [

	^ name
]

{ #category : #accessing }
MONamedArguments >> name: anObject [

	name := anObject
]
