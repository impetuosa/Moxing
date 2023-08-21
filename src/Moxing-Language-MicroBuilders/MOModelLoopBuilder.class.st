"
I build loops: such while or do Until kind 
"
Class {
	#name : #MOModelLoopBuilder,
	#superclass : #MOModelConditionalControlFlowBuilder,
	#instVars : [
		'loopingBlock',
		'elementClass'
	],
	#category : #'Moxing-Language-MicroBuilders-Control flow'
}

{ #category : #'as yet unclassified' }
MOModelLoopBuilder >> buildsType [
	 ^ elementClass 
]

{ #category : #accessing }
MOModelLoopBuilder >> elementClass: anObject [

	elementClass := anObject
]

{ #category : #'as yet unclassified' }
MOModelLoopBuilder >> forDoUntil [

	elementClass := MODoUntil
]

{ #category : #'as yet unclassified' }
MOModelLoopBuilder >> forDoWhile [
	elementClass := MODoWhile
]

{ #category : #'as yet unclassified' }
MOModelLoopBuilder >> forWhile [
	elementClass := MOWhile
]

{ #category : #'as yet unclassified' }
MOModelLoopBuilder >> loadBuilderWithEntity: anEntity [

	self condition: anEntity condition.
	self loopingBlock: anEntity loopingBlock
]

{ #category : #accessing }
MOModelLoopBuilder >> loopingBlock [

	^ loopingBlock ifNil: [  self error: 'Looping block is compulsory ' ]
]

{ #category : #accessing }
MOModelLoopBuilder >> loopingBlock: aMOModelBlockBuilder [


	loopingBlock := aMOModelBlockBuilder
]

{ #category : #'as yet unclassified' }
MOModelLoopBuilder >> privateBuild [

	^ (self instantiate: elementClass)
		  condition: self condition;
		  loopingBlock: self loopingBlock;
		  yourself
]
