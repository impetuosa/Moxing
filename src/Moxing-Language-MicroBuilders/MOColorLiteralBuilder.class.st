Class {
	#name : #MOColorLiteralBuilder,
	#superclass : #MOLiteralBuilder,
	#category : #'Moxing-Language-MicroBuilders-literals'
}

{ #category : #asserting }
MOColorLiteralBuilder >> assertValueType [

	^ self assert: (value isKindOf: String)
]

{ #category : #asserting }
MOColorLiteralBuilder >> literalClass [

	^ MOColorLiteral
]
