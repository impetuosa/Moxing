Class {
	#name : #MOArrayLiteralBuilder,
	#superclass : #MOLiteralBuilder,
	#category : #'Moxing-Language-MicroBuilders-literals'
}

{ #category : #asserting }
MOArrayLiteralBuilder >> assertValueType [

	self assert: value isArray
]

{ #category : #asserting }
MOArrayLiteralBuilder >> literalClass [

	^ MOArrayLiteral
]
