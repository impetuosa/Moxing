Class {
	#name : #MOModelCaseBuilder,
	#superclass : #MOModelControlFlowBuilder,
	#instVars : [
		'matchingExpression',
		'block',
		'expressions'
	],
	#category : #'Moxing-Language-MicroBuilders-Control flow'
}

{ #category : #accessing }
MOModelCaseBuilder >> block [
	^ block
]

{ #category : #accessing }
MOModelCaseBuilder >> block: aMOBlock [ 
	block := aMOBlock
]

{ #category : #'as yet unclassified' }
MOModelCaseBuilder >> buildsType [

	^ MOCase
]

{ #category : #generated }
MOModelCaseBuilder >> expression [
	self shouldBeImplemented.
]

{ #category : #accessing }
MOModelCaseBuilder >> expressions [

	^ expressions ifNil: [ expressions := OrderedCollection new ]
]

{ #category : #generated }
MOModelCaseBuilder >> expressions: aCollection [

	expressions := aCollection
]

{ #category : #accessing }
MOModelCaseBuilder >> loadBuilderWithEntity: anEntity [

	self expressions: anEntity expressions.
	self block: anEntity block
]

{ #category : #accessing }
MOModelCaseBuilder >> privateBuild [
	^ (self instantiate: MOCase)
		  expressions: self expressions;
		  block: self block;
		  yourself
]
