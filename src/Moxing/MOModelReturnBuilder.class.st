Class {
	#name : #MOModelReturnBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'returns'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #accessing }
MOModelReturnBuilder >> expression: aMOVariableReference [

	self returns: aMOVariableReference
]

{ #category : #'as yet unclassified' }
MOModelReturnBuilder >> privateBuild [

	returns ifNil: [ ^ self instantiate: MOReturnEmpty ].
	^ (self instantiate: MOReturn)
		  expression: returns;
		  yourself
]

{ #category : #accessing }
MOModelReturnBuilder >> returns: aMOVariableReference [ 
	returns := aMOVariableReference
]
