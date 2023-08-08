Class {
	#name : #MOModelJavaClassTypeBuilder,
	#superclass : #MOModelClassTypeBuilder,
	#instVars : [
		'types'
	],
	#category : #'Moxing-Language-MicroBuilders-types'
}

{ #category : #accessing }
MOModelJavaClassTypeBuilder >> addClass: aMOClass [

	self addType: aMOClass
]

{ #category : #adding }
MOModelJavaClassTypeBuilder >> addClassType: aMOClassType [

	self addType: aMOClassType
]

{ #category : #adding }
MOModelJavaClassTypeBuilder >> addEnum: aMOEnum [

	self addType: aMOEnum
]

{ #category : #adding }
MOModelJavaClassTypeBuilder >> addJavaEnum: aMOJavaEnum [

	^ self addEnum: aMOJavaEnum
]

{ #category : #accessing }
MOModelJavaClassTypeBuilder >> addType: aMOPrimitiveType [

	self assert:
		(self types noneSatisfy: [ :t | t name = aMOPrimitiveType name ]).
	self types add: aMOPrimitiveType
]

{ #category : #asserting }
MOModelJavaClassTypeBuilder >> buildsType [

	^ MOJavaClassType
]

{ #category : #accessing }
MOModelJavaClassTypeBuilder >> loadBuilderWithEntity: anEntity [

	super loadBuilderWithEntity: anEntity.
	self types: anEntity types.

]

{ #category : #accessing }
MOModelJavaClassTypeBuilder >> privateBuild [

	^ super privateBuild
		  types: self types;
		  yourself
]

{ #category : #accessing }
MOModelJavaClassTypeBuilder >> types [

	^ types ifNil: [ types := OrderedCollection new ]
]

{ #category : #accessing }
MOModelJavaClassTypeBuilder >> types: anObject [

	types := anObject
]
