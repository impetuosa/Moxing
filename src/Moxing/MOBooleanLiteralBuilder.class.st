"
I build booleans. 
My value must be a pharo boolean.
"
Class {
	#name : #MOBooleanLiteralBuilder,
	#superclass : #MOLiteralBuilder,
	#category : #'Moxing-MicroBuilders'
}

{ #category : #accessing }
MOBooleanLiteralBuilder >> assertValueType [
	self assert: (value isKindOf: Boolean)
]

{ #category : #building }
MOBooleanLiteralBuilder >> literalClass [

	^ MOBooleanLiteral
]
