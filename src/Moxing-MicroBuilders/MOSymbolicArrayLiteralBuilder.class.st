Class {
	#name : #MOSymbolicArrayLiteralBuilder,
	#superclass : #MOLiteralBuilder,
	#category : #'Moxing-MicroBuilders-literals'
}

{ #category : #asserting }
MOSymbolicArrayLiteralBuilder >> assertValueType [

	self assert: value isArray
]

{ #category : #asserting }
MOSymbolicArrayLiteralBuilder >> literalClass [

	^ MOSymbolicArrayLiteral
]
