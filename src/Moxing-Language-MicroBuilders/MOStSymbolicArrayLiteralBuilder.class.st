Class {
	#name : #MOStSymbolicArrayLiteralBuilder,
	#superclass : #MOLiteralBuilder,
	#category : #'Moxing-Language-MicroBuilders-Literals'
}

{ #category : #asserting }
MOStSymbolicArrayLiteralBuilder >> assertValueType [

	self assert: value isArray
]

{ #category : #asserting }
MOStSymbolicArrayLiteralBuilder >> literalClass [

	^ MOSymbolicArrayLiteral
]
