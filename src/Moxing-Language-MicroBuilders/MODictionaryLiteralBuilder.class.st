Class {
	#name : #MODictionaryLiteralBuilder,
	#superclass : #MOLiteralBuilder,
	#category : #'Moxing-Language-MicroBuilders-literals'
}

{ #category : #asserting }
MODictionaryLiteralBuilder >> assertValueType [

	self assert: value isDictionary 
]

{ #category : #asserting }
MODictionaryLiteralBuilder >> literalClass [

	^ MODictionaryLiteral
]
