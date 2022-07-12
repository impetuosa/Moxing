Class {
	#name : #MOModelSwitchBuilder,
	#superclass : #MOModelControlFlowBuilder,
	#instVars : [
		'blocks',
		'expression'
	],
	#category : #'Moxing-MicroBuilders-control flow'
}

{ #category : #accessing }
MOModelSwitchBuilder >> blocks [

	^ blocks ifNil: [ blocks := OrderedCollection new ]
]

{ #category : #accessing }
MOModelSwitchBuilder >> blocks: anObject [

	blocks := anObject
]

{ #category : #'as yet unclassified' }
MOModelSwitchBuilder >> buildsType [

	^ MOSwitch
]

{ #category : #accessing }
MOModelSwitchBuilder >> expression [

	^ expression
]

{ #category : #accessing }
MOModelSwitchBuilder >> expression: anObject [

	expression := anObject
]

{ #category : #'as yet unclassified' }
MOModelSwitchBuilder >> privateBuild [

	^ (self instantiate: self buildsType)
		  block: self blocks;
		  expression: self expression;
		  yourself
]
