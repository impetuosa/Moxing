Class {
	#name : #MOModelCastExpressionBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'typeReference',
		'expression'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #accessing }
MOModelCastExpressionBuilder >> expression: aMOVariableReference [ 
	expression := aMOVariableReference
]

{ #category : #'as yet unclassified' }
MOModelCastExpressionBuilder >> privateBuild [

	^ (self instantiate: MOCastExpression)
		  expression: expression;
		  typeReference: typeReference;
		  yourself
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
