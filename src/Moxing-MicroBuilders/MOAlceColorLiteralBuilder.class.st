Class {
	#name : #MOAlceColorLiteralBuilder,
	#superclass : #MOLiteralBuilder,
	#category : #'Moxing-MicroBuilders-literals'
}

{ #category : #asserting }
MOAlceColorLiteralBuilder >> assertValueType [

	^ self assert: (value isKindOf: String)
]

{ #category : #asserting }
MOAlceColorLiteralBuilder >> literalClass [

	^ MOColorLiteral
]
