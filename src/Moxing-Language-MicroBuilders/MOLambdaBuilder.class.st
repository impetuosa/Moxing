Class {
	#name : #MOLambdaBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'block',
		'parameters'
	],
	#category : #'Moxing-Language-MicroBuilders-Invocables'
}

{ #category : #adding }
MOLambdaBuilder >> addParameter: aMOParameter [
  self parameters add: aMOParameter
]

{ #category : #asserting }
MOLambdaBuilder >> block [

	^ block ifNil: [ self error: 'block is nil' ]
]

{ #category : #asserting }
MOLambdaBuilder >> block: aBlock [

	block := aBlock
]

{ #category : #asserting }
MOLambdaBuilder >> buildsType [

	^ MOLambda
]

{ #category : #asserting }
MOLambdaBuilder >> loadBuilderWithEntity: aClosure [
  self block: aClosure block.
  self parameters: aClosure parameters
]

{ #category : #asserting }
MOLambdaBuilder >> parameters [
  ^parameters ifNil: [ parameters := OrderedCollection new ]
]

{ #category : #accessing }
MOLambdaBuilder >> parameters: anObject [

	parameters := anObject
]

{ #category : #asserting }
MOLambdaBuilder >> privateBuild [

	^ (self instantiate: self buildsType)
		  block: self block;
		  parameters: self parameters; 
		  yourself
]
