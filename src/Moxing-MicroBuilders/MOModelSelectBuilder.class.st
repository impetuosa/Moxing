Class {
	#name : #MOModelSelectBuilder,
	#superclass : #MOModelControlFlowBuilder,
	#instVars : [
		'matchingExpression',
		'cases',
		'expression'
	],
	#category : #'Moxing-MicroBuilders-control flow'
}

{ #category : #adding }
MOModelSelectBuilder >> addCase: aMOCase [

	self cases add: aMOCase
]

{ #category : #'as yet unclassified' }
MOModelSelectBuilder >> buildsType [

	^ MOSelect
]

{ #category : #accessing }
MOModelSelectBuilder >> cases [
	^ cases ifNil: [ cases := OrderedCollection new ]
]

{ #category : #accessing }
MOModelSelectBuilder >> cases: aCollection [ 
	cases := aCollection
]

{ #category : #accessing }
MOModelSelectBuilder >> expression [
	^ expression
]

{ #category : #generated }
MOModelSelectBuilder >> expression: aMOVariableReference [

	expression := aMOVariableReference
]

{ #category : #accessing }
MOModelSelectBuilder >> loadBuilderWithEntity: anEntity [

	self cases: anEntity cases.
	self expression: anEntity expression
]

{ #category : #accessing }
MOModelSelectBuilder >> privateBuild [

	^ (self instantiate: MOSelect)
		  expression: self expression;
		  cases: self cases;
		  yourself
]
