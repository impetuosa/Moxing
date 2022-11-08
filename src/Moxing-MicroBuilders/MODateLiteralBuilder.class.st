Class {
	#name : #MODateLiteralBuilder,
	#superclass : #MOLiteralBuilder,
	#category : #'Moxing-MicroBuilders-literals'
}

{ #category : #accessing }
MODateLiteralBuilder >> assertValueType [
	self assert: (value isKindOf: String)
]

{ #category : #accessing }
MODateLiteralBuilder >> literalClass [

	^ MODateLiteral 
]
