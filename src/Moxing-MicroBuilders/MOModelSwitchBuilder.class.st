Class {
	#name : #MOModelSwitchBuilder,
	#superclass : #MOModelControlFlowBuilder,
	#instVars : [
		'expression',
		'cases'
	],
	#category : #'Moxing-MicroBuilders-control flow'
}

{ #category : #'as yet unclassified' }
MOModelSwitchBuilder >> buildsType [

	^ MOSwitch
]

{ #category : #accessing }
MOModelSwitchBuilder >> cases [

	^ cases ifNil: [ cases := OrderedCollection new ]
]

{ #category : #accessing }
MOModelSwitchBuilder >> cases: anObject [

	cases := anObject
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
		  cases: self cases;
		  expression: self expression;
		  yourself
]
