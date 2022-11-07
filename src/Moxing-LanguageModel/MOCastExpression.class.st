Class {
	#name : #MOCastExpression,
	#superclass : #MOTypedReference,
	#instVars : [
		'#typeReference => MOReferesSlot one',
		'#expression => MOExpressesSlot one'
	],
	#category : #'Moxing-LanguageModel-References'
}

{ #category : #accessing }
MOCastExpression >> canBeReferredAsArrayAccess [

	^ true
]

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
