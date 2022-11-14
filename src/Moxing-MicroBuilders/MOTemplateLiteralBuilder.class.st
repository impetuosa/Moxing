Class {
	#name : #MOTemplateLiteralBuilder,
	#superclass : #MOLiteralBuilder,
	#instVars : [
		'expressions'
	],
	#category : #'Moxing-MicroBuilders-literals'
}

{ #category : #'as yet unclassified' }
MOTemplateLiteralBuilder >> buildsType [

	^ MOTemplateLiteralBuilder
]

{ #category : #accessing }
MOTemplateLiteralBuilder >> expressions [

	^ expressions ifNil: [ expressions := OrderedCollection new ]
]

{ #category : #accessing }
MOTemplateLiteralBuilder >> expressions: aCollection [

	expressions := aCollection
]

{ #category : #accessing }
MOTemplateLiteralBuilder >> literalClass [

	^ MOTemplateLiteral
]

{ #category : #accessing }
MOTemplateLiteralBuilder >> loadBuilderWithEntity: anEntity [

	self expressions: anEntity expressions
]

{ #category : #accessing }
MOTemplateLiteralBuilder >> privateBuild [

	^ (self instantiate: self literalClass)
		  expressions: self expressions;
		  literal:
			  ('/' join: (self expressions collect: [ :a | a asString ]));
		  yourself
]
