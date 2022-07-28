Class {
	#name : #MOExpression,
	#superclass : #MOLanguageObject,
	#category : #'Moxing-LanguageModel-Expressions'
}

{ #category : #'as yet unclassified' }
MOExpression >> callingInvocable [

	| current |
	current := self.
	[ current isNil or: [ current isInvocable ] ] whileFalse: [ 
		current := current parent ].
	^ current
]

{ #category : #testing }
MOExpression >> isExpression [

	^ true
]

{ #category : #testing }
MOExpression >> isLabelledAs: aLabel [
 	 ^ false 
]

{ #category : #'as yet unclassified' }
MOExpression >> usingDeclaration [

	| current |
	current := self.
	[ 
	current isNil or: [ 
		current isInvocable or: [ current isModule or: [ current isType ] ] ] ] 
		whileFalse: [ current := current parent ].
	^ current
]
