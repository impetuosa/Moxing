Class {
	#name : #MOCastExpression,
	#superclass : #MOTypedReference,
	#instVars : [
		'typeReference',
		'expression'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #generated }
MOCastExpression >> candidate [
 	^ expression candidate 
]

{ #category : #generated }
MOCastExpression >> expression [

	^ expression
]

{ #category : #accessing }
MOCastExpression >> expression: aMOVariableReference [ 
	expression := aMOVariableReference
]

{ #category : #generated }
MOCastExpression >> type [ 
	^ typeReference type 
]

{ #category : #accessing }
MOCastExpression >> typeReference: aMOTypeReference [ 
	typeReference := aMOTypeReference
]
