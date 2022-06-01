Class {
	#name : #MOFileDescriptorLiteralBuilder,
	#superclass : #MOLiteralBuilder,
	#category : #'Moxing-MicroBuilders-literals'
}

{ #category : #accessing }
MOFileDescriptorLiteralBuilder >> assertValueType [

	self assert: (value isString and: [ value first = $# ])
]

{ #category : #accessing }
MOFileDescriptorLiteralBuilder >> literalClass [

	^ MOFileDescriptorLiteral
]
