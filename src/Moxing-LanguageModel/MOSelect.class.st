Class {
	#name : #MOSelect,
	#superclass : #MOStatement,
	#instVars : [
		'#expression => MOExpressionSlot one',
		'#cases => MOContainmentSlot many'
	],
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #visiting }
MOSelect >> acceptVisitor: aMOModelWriteTypeBasedCopyResolver [

	^ aMOModelWriteTypeBasedCopyResolver visitSelect: self
]

{ #category : #accessing }
MOSelect >> cases [
	^ cases
]

{ #category : #accessing }
MOSelect >> cases: aCollection [ 
	cases := aCollection
]

{ #category : #accessing }
MOSelect >> expression [
	^ expression
]

{ #category : #accessing }
MOSelect >> expression: aMOVariableReference [ 
	expression := aMOVariableReference
]