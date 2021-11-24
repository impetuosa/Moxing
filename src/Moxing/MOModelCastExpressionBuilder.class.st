Class {
	#name : #MOModelCastExpressionBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'typeReference',
		'expression'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #building }
MOModelCastExpressionBuilder >> build [

	^ (self instantiate: MOCastExpression)
		  expression: expression;
		  typeReference: typeReference;
		  yourself
]

{ #category : #accessing }
MOModelCastExpressionBuilder >> expression: aMOVariableReference [ 
	expression := aMOVariableReference
]

{ #category : #generated }
MOModelCastExpressionBuilder >> type: aMOClass [

	self typeReference: (self typeReferenceBuilder
			 type: aMOClass;
			 build)
]

{ #category : #accessing }
MOModelCastExpressionBuilder >> typeReference: aMOTypeReference [ 
	typeReference := aMOTypeReference
]
