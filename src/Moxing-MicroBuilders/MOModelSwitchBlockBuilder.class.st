Class {
	#name : #MOModelSwitchBlockBuilder,
	#superclass : #MOModelControlFlowBuilder,
	#instVars : [
		'labels',
		'block'
	],
	#category : #'Moxing-MicroBuilders-control flow'
}

{ #category : #accessing }
MOModelSwitchBlockBuilder >> block [

	^ block ifNil: [ self error: 'Cannot be nil' ]
]

{ #category : #accessing }
MOModelSwitchBlockBuilder >> block: anObject [

	block := anObject
]

{ #category : #asserting }
MOModelSwitchBlockBuilder >> buildsType [

	^ MOSwitchBlock
]

{ #category : #accessing }
MOModelSwitchBlockBuilder >> labels [

	^ labels ifNil: [ labels := OrderedCollection new ]
]

{ #category : #accessing }
MOModelSwitchBlockBuilder >> labels: anObject [

	labels := anObject
]

{ #category : #accessing }
MOModelSwitchBlockBuilder >> privateBuild [

	^ (self instantiate: self buildsType)
		  block: self block;
		  labels: self labels;
		  yourself
]
