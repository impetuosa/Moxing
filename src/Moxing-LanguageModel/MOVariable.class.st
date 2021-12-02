Class {
	#name : #MOVariable,
	#superclass : #MOLanguageObject,
	#instVars : [
		'defaultValue',
		'modifiers',
		'typeReference',
		'initializer'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #accessing }
MOVariable >> acceptVisitor: aJinTypescriptCodeGenerator [
	aJinTypescriptCodeGenerator visitVariable: self
]

{ #category : #adding }
MOVariable >> addModifier: aModifier [

	modifiers add: aModifier
]

{ #category : #adding }
MOVariable >> addStatement: aMONewExpression [

	initializer := aMONewExpression
]

{ #category : #'as yet unclassified' }
MOVariable >> defaultValue [
	^ defaultValue
]

{ #category : #'as yet unclassified' }
MOVariable >> defaultValue: aMOTypescriptLiteral [
	defaultValue := aMOTypescriptLiteral
]

{ #category : #accessing }
MOVariable >> dependencies [
	| deps |
	deps := typeReference ifNotNil: [ typeReference dependencies ] ifNil: [ {} ].
	^ defaultValue
		ifNil: [ deps ]
		ifNotNil: [ deps , defaultValue dependencies ]
]

{ #category : #generated }
MOVariable >> hierarchicalChildren [

	^ self annotations
	  , (self initializer ifNil: [ {  } ] ifNotNil: [ :i | { i } ])
]

{ #category : #accessing }
MOVariable >> initialize [ 
	super initialize.
	modifiers := OrderedCollection new
]

{ #category : #accessing }
MOVariable >> initializer [
	^ initializer
]

{ #category : #'as yet unclassified' }
MOVariable >> modifiers [

	^ modifiers 
]

{ #category : #'as yet unclassified' }
MOVariable >> modifiers: aSet [
	modifiers := aSet
]

{ #category : #accessing }
MOVariable >> name: aName [

	name = 'hibernateProperties' ifTrue: [ self halt ].
	super name: aName
]

{ #category : #accessing }
MOVariable >> printOn: aStream [

	aStream
		nextPutAll: 'VD:';
		nextPutAll: name;
		nextPutAll: '('.
	typeReference
		ifNil: [ aStream nextPutAll: ' unknown' ]
		ifNotNil: [ :t | t printOn: aStream ].
	aStream nextPutAll: ')'
]

{ #category : #generated }
MOVariable >> type [

	^ typeReference type
]

{ #category : #accessing }
MOVariable >> typeReference [
	^ typeReference
]

{ #category : #accessing }
MOVariable >> typeReference: aJinTypescriptTypeReference [ 
(	aJinTypescriptTypeReference isNil) ifTrue: [ self halt  ].

	typeReference := aJinTypescriptTypeReference
]
