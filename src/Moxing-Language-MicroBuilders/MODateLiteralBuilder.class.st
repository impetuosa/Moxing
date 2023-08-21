Class {
	#name : #MODateLiteralBuilder,
	#superclass : #MOLiteralBuilder,
	#category : #'Moxing-Language-MicroBuilders-Literals'
}

{ #category : #accessing }
MODateLiteralBuilder >> assertValueType [
	self assert: (value isKindOf: String)
]

{ #category : #accessing }
MODateLiteralBuilder >> literalClass [

	^ MODateLiteral 
]
