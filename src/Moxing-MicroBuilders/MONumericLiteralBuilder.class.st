"
I build numeric literals. 
My value must be either an integer (small, long, etc) 
or a float.
Given a numeric value i know which kind of literal to create. 
I do not support fractions or other pharo values.
"
Class {
	#name : #MONumericLiteralBuilder,
	#superclass : #MOLiteralBuilder,
	#category : #'Moxing-MicroBuilders-literals'
}

{ #category : #accessing }
MONumericLiteralBuilder >> assertValueType [

	self assert: value isNumber
]

{ #category : #'as yet unclassified' }
MONumericLiteralBuilder >> privateBuild [

	self value isScaledDecimal ifTrue: [ 
		^ (self instantiate: MOScaleDecimalLiteral)
			  literal: self value;
			  yourself ].
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
