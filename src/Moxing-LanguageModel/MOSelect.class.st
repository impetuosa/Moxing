Class {
	#name : #MOSelect,
	#superclass : #MOStatement,
	#instVars : [
		'#expression => MOExpressesSlot one',
		'#cases => MOStatesSlot many'
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
MOSelect >> dependencies [

	^ expression dependencies
	  , (cases flatCollect: [ :a | a dependencies ])
]

{ #category : #accessing }
MOSelect >> expression [
	^ expression
]

{ #category : #accessing }
MOSelect >> expression: aMOVariableReference [ 
	expression := aMOVariableReference
]
