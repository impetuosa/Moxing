Class {
	#name : #MOAssertionStatement,
	#superclass : #MOStatement,
	#instVars : [
		'#argument => MORefersSlot one',
		'#message => MORefersSlot one'
	],
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #visiting }
MOAssertionStatement >> acceptVisitor: aVisitor [

	^ aVisitor visitAssertion: self
]

{ #category : #accessing }
MOAssertionStatement >> argument [

	^ argument
]

{ #category : #accessing }
MOAssertionStatement >> argument: anObject [

	argument := anObject
]

{ #category : #accessing }
MOAssertionStatement >> message [

	^ message
]

{ #category : #accessing }
MOAssertionStatement >> message: anObject [

	message := anObject
]
