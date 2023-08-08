"
I build cast expressions such as (typeReference) element
"
Class {
	#name : #MOModelCastExpressionBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'typeReference',
		'expression'
	],
	#category : #'Moxing-Language-MicroBuilders-expressions'
}

{ #category : #'as yet unclassified' }
MOModelCastExpressionBuilder >> buildsType [
<generated>
	^MOCastExpression
]

{ #category : #accessing }
MOModelCastExpressionBuilder >> expression [
	^ expression
]

{ #category : #accessing }
MOModelCastExpressionBuilder >> expression: aMOVariableReference [ 
	expression := aMOVariableReference
]

{ #category : #'as yet unclassified' }
MOModelCastExpressionBuilder >> loadBuilderWithEntity: anEntity [ 
	self expression: anEntity expression. 
 self typeReference: anEntity typeReference. 
 
	
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
MOModelCastExpressionBuilder >> typeReference [
	^ typeReference
]

{ #category : #accessing }
MOModelCastExpressionBuilder >> typeReference: aMOTypeReference [ 
	typeReference := aMOTypeReference
]
