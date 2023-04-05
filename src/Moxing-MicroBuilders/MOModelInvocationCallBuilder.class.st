Class {
	#name : #MOModelInvocationCallBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'arguments',
		'invocableExpression'
	],
	#category : #'Moxing-MicroBuilders-activation-reference'
}

{ #category : #asserting }
MOModelInvocationCallBuilder >> addArgument: aMOVariableReference [

	self arguments add: aMOVariableReference
]

{ #category : #asserting }
MOModelInvocationCallBuilder >> arguments [

	^ arguments ifNil: [ arguments := OrderedCollection new ]
]

{ #category : #asserting }
MOModelInvocationCallBuilder >> arguments: aCollection [ 
	arguments := aCollection
]

{ #category : #asserting }
MOModelInvocationCallBuilder >> buildsType [

	<generated>
	^ MOInvocationCall 
]

{ #category : #asserting }
MOModelInvocationCallBuilder >> invocableExpression [
	^ invocableExpression ifNil: [ self error: 'need invocable expression' ]
]

{ #category : #asserting }
MOModelInvocationCallBuilder >> invocableExpression: anInvocableExpression [

	invocableExpression := anInvocableExpression
]

{ #category : #asserting }
MOModelInvocationCallBuilder >> loadBuilderWithEntity: anEntity [

	self invocableExpression: anEntity invocableExpression.
	self arguments: anEntity arguments
]

{ #category : #asserting }
MOModelInvocationCallBuilder >> privateBuild [

	^ (self instantiate: self buildsType)
		  invocableExpression: self invocableExpression;
		  arguments: self arguments;
		  yourself
]
