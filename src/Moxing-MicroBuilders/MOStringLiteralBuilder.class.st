"
I build string literals. 
I contain only strings 
"
Class {
	#name : #MOStringLiteralBuilder,
	#superclass : #MOLiteralBuilder,
	#category : #'Moxing-MicroBuilders-literals'
}

{ #category : #accessing }
MOStringLiteralBuilder >> assertValueType [

	^ self assert: (value isKindOf: String)
]

{ #category : #accessing }
MOStringLiteralBuilder >> literalClass [

	^ MOStringLiteral
]
