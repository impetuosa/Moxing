Class {
	#name : #MOStArrayExpressionBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'elements'
	],
	#category : #'Moxing-Smalltalk-Builer'
}

{ #category : #asserting }
MOStArrayExpressionBuilder >> buildsType [

	^ MOStArrayExpression
]

{ #category : #accessing }
MOStArrayExpressionBuilder >> elements [
	^ elements
]

{ #category : #accessing }
MOStArrayExpressionBuilder >> elements: aCollection [ 
	elements := aCollection
]

{ #category : #asserting }
MOStArrayExpressionBuilder >> loadBuilderWithEntity: anEntity [

	self elements: anEntity elements .
	
]

{ #category : #asserting }
MOStArrayExpressionBuilder >> privateBuild [

	^ (self instantiate: self buildsType)
		  elements: self elements;
		  yourself
]
