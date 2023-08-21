Class {
	#name : #MOCharacterLiteralBuilder,
	#superclass : #MOLiteralBuilder,
	#category : #'Moxing-Language-MicroBuilders-Literals'
}

{ #category : #accessing }
MOCharacterLiteralBuilder >> assertValueType [
	self assert: (value isKindOf: Character)
]

{ #category : #accessing }
MOCharacterLiteralBuilder >> literalClass [

	^ MOCharacterLiteral 
]
