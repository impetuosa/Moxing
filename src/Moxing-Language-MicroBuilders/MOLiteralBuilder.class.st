"
I build literals in general
"
Class {
	#name : #MOLiteralBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'value'
	],
	#category : #'Moxing-Language-MicroBuilders-Literals'
}

{ #category : #accessing }
MOLiteralBuilder >> assertValueType [

	self subclassResponsibility
]

{ #category : #accessing }
MOLiteralBuilder >> literalClass [
  self subclassResponsibility
]

{ #category : #'as yet unclassified' }
MOLiteralBuilder >> privateBuild [

	^ (self instantiate: self literalClass)
		  literal: self value;
		  yourself
]

{ #category : #accessing }
MOLiteralBuilder >> value [

	^ value ifNil: [ 'Literal value is Nil ' ]
]

{ #category : #accessing }
MOLiteralBuilder >> value: aValue [

	value := aValue.
	self assertValueType
]
