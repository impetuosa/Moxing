Class {
	#name : #MOModelJavaClassBuilder,
	#superclass : #MOModelClassBuilder,
	#instVars : [
		'types',
		'staticInitializer'
	],
	#category : #'Moxing-Language-MicroBuilders-Types'
}

{ #category : #accessing }
MOModelJavaClassBuilder >> addClass: aMOClass [

	self addType: aMOClass
]

{ #category : #adding }
MOModelJavaClassBuilder >> addClassType: aMOClassType [

	self addType: aMOClassType
]

{ #category : #adding }
MOModelJavaClassBuilder >> addEnum: aMOEnum [

	self addType: aMOEnum
]

{ #category : #adding }
MOModelJavaClassBuilder >> addJavaEnum: aMOJavaEnum [

	^ self addEnum: aMOJavaEnum
]

{ #category : #accessing }
MOModelJavaClassBuilder >> addType: aMOPrimitiveType [

	self assert:
		(self types noneSatisfy: [ :t | t name = aMOPrimitiveType name ]).
	self types add: aMOPrimitiveType
]

{ #category : #asserting }
MOModelJavaClassBuilder >> buildsType [

	^ MOJavaClass
]

{ #category : #accessing }
MOModelJavaClassBuilder >> loadBuilderWithEntity: anEntity [

	super loadBuilderWithEntity: anEntity.
	self types: anEntity types.
	self staticInitializer: anEntity staticInitializer
]

{ #category : #accessing }
MOModelJavaClassBuilder >> privateBuild [

	^ super privateBuild
		  types: self types;
		  staticInitializer: self staticInitializer;
		  yourself
]

{ #category : #accessing }
MOModelJavaClassBuilder >> staticInitializer [

	^ staticInitializer
]

{ #category : #accessing }
MOModelJavaClassBuilder >> staticInitializer: aMOStaticInitializer [

	staticInitializer := aMOStaticInitializer
]

{ #category : #accessing }
MOModelJavaClassBuilder >> types [

	^ types ifNil: [ types := OrderedCollection new ]
]

{ #category : #accessing }
MOModelJavaClassBuilder >> types: anObject [

	types := anObject
]
