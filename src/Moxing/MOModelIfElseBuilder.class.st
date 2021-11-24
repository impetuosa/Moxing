Class {
	#name : #MOModelIfElseBuilder,
	#superclass : #MOModelControlFlowBuilder,
	#instVars : [
		'ifTrueBlock',
		'ifFalseBlock'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #building }
MOModelIfElseBuilder >> build [

	^ (self instantiate: MOIfElse)
		  condition: self condition;
		  ifTrue: self ifTrueBlock;
		  ifFalse: self ifFalseBlock;
		  yourself
]

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
