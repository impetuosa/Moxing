Class {
	#name : #MOLiteralBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'value'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #accessing }
MOLiteralBuilder >> assertValueType [

	self subclassResponsibility
]

{ #category : #accessing }
MOLiteralBuilder >> build [

	^ (self instantiate: self literalClass)
		  literal: self value;
		  yourself
]

{ #category : #accessing }
MOLiteralBuilder >> literalClass [
	^ self subclassResponsibility 
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
