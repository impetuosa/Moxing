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

{ #category : #building }
MOModelInvocationBuilder >> build [
	^ (self instantiate: MOInvocation)
		  selector: selector;
		  arguments: self arguments;
		  yourself
]

{ #category : #accessing }
MOModelInvocationBuilder >> selector: aString [ 
	selector := aString
]
