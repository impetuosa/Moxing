Class {
	#name : #MOFileDescriptorLiteralBuilder,
	#superclass : #MOLiteralBuilder,
	#category : #'Moxing-Language-MicroBuilders-Literals'
}

{ #category : #accessing }
MOFileDescriptorLiteralBuilder >> assertValueType [

	self assert: (value isString and: [ value first = $# ])
]

{ #category : #accessing }
MOFileDescriptorLiteralBuilder >> literalClass [

	^ MOFileDescriptorLiteral
]
