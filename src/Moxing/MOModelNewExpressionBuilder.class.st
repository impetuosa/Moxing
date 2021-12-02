Class {
	#name : #MOModelNewExpressionBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'arguments',
		'typeReference'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #accessing }
MOModelNewExpressionBuilder >> arguments [
	^ arguments
]

{ #category : #accessing }
MOModelNewExpressionBuilder >> arguments: aCollection [ 
	arguments := aCollection
]

{ #category : #'as yet unclassified' }
MOModelNewExpressionBuilder >> privateBuild [

	^ (self instantiate: MONewExpression)
		  typeReference: self typeReference;
		  arguments: self arguments;
		  yourself
]

{ #category : #accessing }
MOModelNewExpressionBuilder >> typeReference [
	^ typeReference
]

{ #category : #accessing }
MOModelNewExpressionBuilder >> typeReference: aMOTypeReference [

	typeReference := aMOTypeReference
]
