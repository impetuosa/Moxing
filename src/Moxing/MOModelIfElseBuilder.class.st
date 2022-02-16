"
i build if and if else structures
"
Class {
	#name : #MOModelIfElseBuilder,
	#superclass : #MOModelConditionalControlFlowBuilder,
	#instVars : [
		'ifTrueBlock',
		'ifFalseBlock'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #asserting }
MOModelIfElseBuilder >> buildsType [

	^ MOIfElse
]

{ #category : #accessing }
MOModelIfElseBuilder >> copyBuilder [
	
	.^ MOModelCopyIfElseBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #accessing }
MOModelIfElseBuilder >> ensureOneBlock [

	self isUpdating ifTrue: [ ^ self ].
	^ (ifTrueBlock isNotNil or: [ ifFalseBlock isNotNil ]) ifFalse: [ 
		  self error: 'IF without any block ' ]
]

{ #category : #accessing }
MOModelIfElseBuilder >> ifFalseBlock [

	^ ifFalseBlock ifNil: [ 
		  self isUpdating
			  ifTrue: [ nil ]
			  ifFalse: [ ifFalseBlock := self instantiateSubClass: MOBlock ] ]
]

{ #category : #accessing }
MOModelIfElseBuilder >> ifFalseBlock: aMOModelBlockBuilder [ 
	ifFalseBlock := aMOModelBlockBuilder
]

{ #category : #accessing }
MOModelIfElseBuilder >> ifTrueBlock [

	^ ifTrueBlock ifNil: [ 
		  self isUpdating
			  ifTrue: [ nil ]
			  ifFalse: [ ifTrueBlock := self instantiateSubClass: MOBlock ] ]
]

{ #category : #accessing }
MOModelIfElseBuilder >> ifTrueBlock: aMOModelBlockBuilder [ 
	ifTrueBlock := aMOModelBlockBuilder
]

{ #category : #'as yet unclassified' }
MOModelIfElseBuilder >> loadBuilderWithEntity: aMOIfElse [

	self condition: aMOIfElse condition.
	self ifTrueBlock: aMOIfElse ifTrue.
	self ifFalseBlock: aMOIfElse ifFalse
]

{ #category : #'as yet unclassified' }
MOModelIfElseBuilder >> privateBuild [

	| ifElse ifTrue ifFalse |
	self ensureOneBlock.
	ifElse := (self instantiate: MOIfElse)
		          condition: self condition;
		          yourself.
	ifTrue := self ifTrueBlock.
	ifFalse := self ifFalseBlock.
	ifElse ifTrue: ifTrue.
	ifElse ifFalse: ifFalse.
	self isUpdating ifFalse: [ 
		ifTrue parent: ifElse.
		ifFalse parent: ifElse ].
	^ ifElse
]
