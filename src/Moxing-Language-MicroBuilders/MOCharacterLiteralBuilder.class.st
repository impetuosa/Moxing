Class {
	#name : #MOCharacterLiteralBuilder,
	#superclass : #MOLiteralBuilder,
	#category : #'Moxing-Language-MicroBuilders-literals'
}

{ #category : #accessing }
MOCharacterLiteralBuilder >> assertValueType [
	self assert: (value isKindOf: Character)
]

{ #category : #accessing }
MOCharacterLiteralBuilder >> literalClass [

	^ MOCharacterLiteral 
]
