"
I build new expressions: new Type () 
"
Class {
	#name : #MOModelNewExpressionBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'arguments',
		'typeReference'
	],
	#category : #'Moxing-MicroBuilders-type-reference'
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
MOModelNewExpressionBuilder >> buildsType [
<generated>
	^MONewInvocation
]

{ #category : #'as yet unclassified' }
MOModelNewExpressionBuilder >> loadBuilderWithEntity: anEntity [ 
	self typeReference: anEntity typeReference. 
 self arguments: anEntity arguments. 
 
	
]

{ #category : #'as yet unclassified' }
MOModelNewExpressionBuilder >> privateBuild [

	^ (self instantiate: MONewInvocation)
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
