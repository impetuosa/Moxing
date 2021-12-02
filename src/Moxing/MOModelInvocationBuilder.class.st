Class {
	#name : #MOModelInvocationBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'selector',
		'arguments'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #adding }
MOModelInvocationBuilder >> addArgument: aMOVariableReference [

	self arguments add: aMOVariableReference
]

{ #category : #accessing }
MOModelInvocationBuilder >> arguments [

	^ arguments ifNil: [ arguments := OrderedCollection new ]
]

{ #category : #accessing }
MOModelInvocationBuilder >> arguments: aCollection [ 
	arguments := aCollection
]

{ #category : #'as yet unclassified' }
MOModelInvocationBuilder >> privateBuild [

	^ (self instantiate: MOInvocation)
		  selector: self selector;
		  arguments: self arguments;
		  yourself
]

{ #category : #accessing }
MOModelInvocationBuilder >> selector [
	^ selector
]

{ #category : #accessing }
MOModelInvocationBuilder >> selector: aString [ 
	selector := aString
]
