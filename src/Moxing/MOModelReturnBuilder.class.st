Class {
	#name : #MOModelReturnBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'returns'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #building }
MOModelReturnBuilder >> build [

	returns ifNil: [ ^ self instantiate: MOReturnEmpty ].
	^ (self instantiate: MOReturn)
		  expression: returns;
		  yourself
]

{ #category : #accessing }
MOModelReturnBuilder >> expression: aMOVariableReference [

	self returns: aMOVariableReference
]

{ #category : #accessing }
MOModelReturnBuilder >> returns: aMOVariableReference [ 
	returns := aMOVariableReference
]
