Class {
	#name : #MODictionaryLiteralBuilder,
	#superclass : #MOLiteralBuilder,
	#category : #'Moxing-Language-MicroBuilders-Literals'
}

{ #category : #asserting }
MODictionaryLiteralBuilder >> assertValueType [

	self assert: value isDictionary 
]

{ #category : #asserting }
MODictionaryLiteralBuilder >> literalClass [

	^ MODictionaryLiteral
]
