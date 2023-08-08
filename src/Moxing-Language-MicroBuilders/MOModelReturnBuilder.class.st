"
i build returns 
"
Class {
	#name : #MOModelReturnBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'returns'
	],
	#category : #'Moxing-Language-MicroBuilders-statements'
}

{ #category : #asserting }
MOModelReturnBuilder >> buildsType [
  ^returns ifNil: [ MOReturnEmpty ] ifNotNil: [ MOReturn ]
]

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
MOModelReturnBuilder >> returns [

	^ returns
]

{ #category : #accessing }
MOModelReturnBuilder >> returns: aMOVariableReference [ 
	returns := aMOVariableReference
]
