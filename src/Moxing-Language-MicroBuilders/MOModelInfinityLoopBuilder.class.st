Class {
	#name : #MOModelInfinityLoopBuilder,
	#superclass : #MOModelControlFlowBuilder,
	#instVars : [
		'loopingBlock',
		'each',
		'collection'
	],
	#category : #'Moxing-Language-MicroBuilders-control flow'
}

{ #category : #'as yet unclassified' }
MOModelInfinityLoopBuilder >> buildsType [

	<generated>
	^ MOInfinityLoop
]

{ #category : #'as yet unclassified' }
MOModelInfinityLoopBuilder >> loadBuilderWithEntity: anEntity [

	self loopingBlock: anEntity loopingBlock
]

{ #category : #accessing }
MOModelInfinityLoopBuilder >> loopingBlock [
	^ loopingBlock ifNil: [  self error: 'Looping Block is Nil' ]
]

{ #category : #accessing }
MOModelInfinityLoopBuilder >> loopingBlock: aMOBlock [ 
	loopingBlock := aMOBlock
]

{ #category : #'as yet unclassified' }
MOModelInfinityLoopBuilder >> privateBuild [

	^ (self instantiate: self buildsType)
		  loopingBlock: self loopingBlock;
		  yourself
]
