Class {
	#name : #MOTypedReference,
	#superclass : #MOReference,
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #'as yet unclassified' }
MOTypedReference >> accessChain [

	| current chain |
	chain := OrderedCollection new.

	current := self .

	[ current isNil ] whileFalse: [ 
		chain add: current name.
		current := current parent ].
	^ chain reversed
]

{ #category : #generated }
MOTypedReference >> type [

	^ candidate type
]
