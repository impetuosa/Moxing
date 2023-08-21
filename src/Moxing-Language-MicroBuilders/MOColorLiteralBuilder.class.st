Class {
	#name : #MOColorLiteralBuilder,
	#superclass : #MOLiteralBuilder,
	#category : #'Moxing-Language-MicroBuilders-Literals'
}

{ #category : #asserting }
MOColorLiteralBuilder >> assertValueType [

	^ self assert: (value isKindOf: String)
]

{ #category : #asserting }
MOColorLiteralBuilder >> literalClass [

	^ MOColorLiteral
]
