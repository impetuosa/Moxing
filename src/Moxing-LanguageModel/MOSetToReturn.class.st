Class {
	#name : #MOSetToReturn,
	#superclass : #MOReturn,
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #visiting }
MOSetToReturn >> acceptVisitor: aVisitor [

	^ aVisitor visitSetToReturn: self
]

{ #category : #'as yet unclassified' }
MOSetToReturn >> invocableSelector [

	| invocable |
	invocable := parent.
	[ invocable isKindOf: MOInvocable ] whileFalse: [ 
		invocable := invocable parent ].
	^ invocable selector
]
