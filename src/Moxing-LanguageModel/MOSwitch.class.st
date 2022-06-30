Class {
	#name : #MOSwitch,
	#superclass : #MOStatement,
	#instVars : [
		'#expression => MOExpressionSlot one',
		'#cases => MOContainmentSlot many'
	],
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #visiting }
MOSwitch >> acceptVisitor: aVisitor [

	^ aVisitor visitSwitch: self
]

{ #category : #accessing }
MOSwitch >> cases [

	^ cases
]

{ #category : #accessing }
MOSwitch >> cases: anObject [

	cases := anObject
]

{ #category : #accessing }
MOSwitch >> expression [

	^ expression
]

{ #category : #accessing }
MOSwitch >> expression: anObject [

	expression := anObject
]
