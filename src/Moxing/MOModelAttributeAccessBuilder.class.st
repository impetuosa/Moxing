Class {
	#name : #MOModelAttributeAccessBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'segments'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #adding }
MOModelAttributeAccessBuilder >> addAttributeName: aString [

	self addVariableReference: (self variableReferenceBuilder
			 name: aString;
			 build)
]

{ #category : #adding }
MOModelAttributeAccessBuilder >> addVariable: aMOAttribute [

	self addVariableReference: (self variableReferenceBuilder
			 variable: aMOAttribute;
			 build)
]

{ #category : #adding }
MOModelAttributeAccessBuilder >> addVariableReference: aMOVariableReference [

	segments ifNotEmpty: [ aMOVariableReference parent: segments last ].
	segments add: aMOVariableReference
]

{ #category : #building }
MOModelAttributeAccessBuilder >> build [

	^ (self instantiate: MOAttributeAccess)
		  segments: segments;
		  yourself
]

{ #category : #adding }
MOModelAttributeAccessBuilder >> initialize [

	super initialize.
	segments := OrderedCollection new
]
