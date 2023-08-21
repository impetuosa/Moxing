"
I build booleans. 
My value must be a pharo boolean.
"
Class {
	#name : #MOBooleanLiteralBuilder,
	#superclass : #MOLiteralBuilder,
	#category : #'Moxing-Language-MicroBuilders-Literals'
}

{ #category : #accessing }
MOBooleanLiteralBuilder >> assertValueType [
	self assert: (value isKindOf: Boolean)
]

{ #category : #building }
MOBooleanLiteralBuilder >> literalClass [

	^ MOBooleanLiteral
]
