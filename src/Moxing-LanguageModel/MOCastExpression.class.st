Class {
	#name : #MOCastExpression,
	#superclass : #MOTypedReference,
	#instVars : [
		'#typeReference => MORefersSlot one',
		'#expression => MOExpressesSlot one'
	],
	#category : #'Moxing-LanguageModel-References'
}

{ #category : #accessing }
MOCastExpression >> canBeReferredAsArrayAccess [

	^ true
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
MOCastExpression >> referee [
 	^ expression referee 
]

{ #category : #generated }
MOCastExpression >> type [ 
	^ typeReference type 
]

{ #category : #accessing }
MOCastExpression >> typeReference: aMOTypeReference [ 
	typeReference := aMOTypeReference
]
