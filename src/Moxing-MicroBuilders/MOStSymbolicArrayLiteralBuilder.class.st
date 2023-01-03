Class {
	#name : #MOStSymbolicArrayLiteralBuilder,
	#superclass : #MOLiteralBuilder,
	#category : #'Moxing-MicroBuilders-literals'
}

{ #category : #asserting }
MOStSymbolicArrayLiteralBuilder >> assertValueType [

	self assert: value isArray
]

{ #category : #asserting }
MOStSymbolicArrayLiteralBuilder >> literalClass [

	^ MOSymbolicArrayLiteral
]
