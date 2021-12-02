Class {
	#name : #MOModelControlFlowBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'condition'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #accessing }
MOModelControlFlowBuilder >> condition [

	^ condition ifNil: [ self error: 'Condition is Nil' ]
]

{ #category : #accessing }
MOModelControlFlowBuilder >> condition: aMOComparisonOperator [ 
	condition := aMOComparisonOperator
]
