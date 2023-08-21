"
I build simple static invocations 
"
Class {
	#name : #MOModelInvocationBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'selector',
		'arguments'
	],
	#category : #'Moxing-Language-MicroBuilders-Activation-reference'
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
MOModelInvocationBuilder >> buildsType [

	<generated>
	^ MOInvocation
]

{ #category : #'as yet unclassified' }
MOModelInvocationBuilder >> loadBuilderWithEntity: anEntity [

	self selector: anEntity selector.
	self arguments: anEntity arguments
]

{ #category : #'as yet unclassified' }
MOModelInvocationBuilder >> privateBuild [

	^ (self instantiate: self buildsType )
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
