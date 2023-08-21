"
I represent a simple conditional control flow builder (

if( condition ). 
while( condition ) 
etc 
"
Class {
	#name : #MOModelConditionalControlFlowBuilder,
	#superclass : #MOModelControlFlowBuilder,
	#instVars : [
		'condition'
	],
	#category : #'Moxing-Language-MicroBuilders-Control flow'
}

{ #category : #accessing }
MOModelConditionalControlFlowBuilder >> condition [

	^ condition
]

{ #category : #accessing }
MOModelConditionalControlFlowBuilder >> condition: aMOComparisonOperator [ 
	condition := aMOComparisonOperator
]
