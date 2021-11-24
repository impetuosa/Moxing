Class {
	#name : #MOModelLoopBuilder,
	#superclass : #MOModelControlFlowBuilder,
	#instVars : [
		'loopingBlock',
		'elementClass'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #building }
MOModelLoopBuilder >> build [

	^ (self instantiate: elementClass)
		  condition: self condition;
		  loopingBlock: self loopingBlock;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelLoopBuilder >> forDoUntil [

	elementClass := MODoUntil
]

{ #category : #'as yet unclassified' }
MOModelLoopBuilder >> forWhile [
	elementClass := MOWhile
]

{ #category : #accessing }
MOModelLoopBuilder >> loopingBlock [

	^ loopingBlock ifNil: [ self error: 'Looping block is nil ' ]
]

{ #category : #accessing }
MOModelLoopBuilder >> loopingBlock: aMOModelBlockBuilder [

	self assert: (aMOModelBlockBuilder isKindOf: MOBlock).
	loopingBlock := aMOModelBlockBuilder
]
