Class {
	#name : #MOModelWithBuilder,
	#superclass : #MOModelControlFlowBuilder,
	#instVars : [
		'block',
		'expression'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #accessing }
MOModelWithBuilder >> block [

	^ block ifNil: [ self error: ' Block cannot be nil ' ]
]

{ #category : #accessing }
MOModelWithBuilder >> block: aMOBlock [ 
	block := aMOBlock
]

{ #category : #'as yet unclassified' }
MOModelWithBuilder >> buildsType [

	^ MOAlceWith
]

{ #category : #accessing }
MOModelWithBuilder >> expression [
	^ expression
]

{ #category : #accessing }
MOModelWithBuilder >> expression: aMOMethodInvocation [ 
	expression := aMOMethodInvocation
]

{ #category : #accessing }
MOModelWithBuilder >> loadBuilderWithEntity: anEntity [

	self expression: anEntity expression.
	self block: anEntity block
]

{ #category : #accessing }
MOModelWithBuilder >> privateBuild [

	^ (self instantiate: MOAlceWith)
		  expression: self expression;
		  block: self block;
		  yourself
]
