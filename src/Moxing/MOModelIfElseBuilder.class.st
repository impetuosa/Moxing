Class {
	#name : #MOModelIfElseBuilder,
	#superclass : #MOModelControlFlowBuilder,
	#instVars : [
		'ifTrueBlock',
		'ifFalseBlock'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #accessing }
MOModelIfElseBuilder >> ifFalseBlock [

	^ ifFalseBlock ifNil: [ ifFalseBlock := self instantiate: MOBlock ]
]

{ #category : #accessing }
MOModelIfElseBuilder >> ifFalseBlock: aMOModelBlockBuilder [ 
	ifFalseBlock := aMOModelBlockBuilder
]

{ #category : #accessing }
MOModelIfElseBuilder >> ifTrueBlock [

	^ ifTrueBlock ifNil: [ ifTrueBlock := self instantiate: MOBlock ]
]

{ #category : #accessing }
MOModelIfElseBuilder >> ifTrueBlock: aMOModelBlockBuilder [ 
	ifTrueBlock := aMOModelBlockBuilder
]

{ #category : #'as yet unclassified' }
MOModelIfElseBuilder >> privateBuild [

	^ (self instantiate: MOIfElse)
		  condition: self condition;
		  ifTrue: self ifTrueBlock;
		  ifFalse: self ifFalseBlock;
		  yourself
]
