Class {
	#name : #MONumericLiteralBuilder,
	#superclass : #MOLiteralBuilder,
	#category : #'Moxing-MicroBuilders'
}

{ #category : #accessing }
MONumericLiteralBuilder >> assertValueType [

	self assert: value isNumber
]

{ #category : #'as yet unclassified' }
MONumericLiteralBuilder >> privateBuild [

	self value isInteger ifTrue: [ 
		^ (self instantiate: MOIntegerLiteral)
			  literal: self value;
			  yourself ].
	self value isFloat ifTrue: [ 
		^ (self instantiate: MOFloatLiteral)
			  literal: self value;
			  yourself ].
	self error: 'Value type does not correspond to existing literals'
]
