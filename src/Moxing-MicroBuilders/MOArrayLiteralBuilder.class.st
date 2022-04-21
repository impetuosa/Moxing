Class {
	#name : #MOArrayLiteralBuilder,
	#superclass : #MOLiteralBuilder,
	#category : #'Moxing-MicroBuilders-literals'
}

{ #category : #asserting }
MOArrayLiteralBuilder >> assertValueType [

	self assert: value isArray
]

{ #category : #asserting }
MOArrayLiteralBuilder >> literalClass [

	^ MOArrayLiteral
]
