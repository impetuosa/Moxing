Class {
	#name : #MOVariable,
	#superclass : #MOLanguageObject,
	#instVars : [
		'class',
		'visibility',
		'defaultValue',
		'modifiers',
		'typeReference'
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

{ #category : #accessing }
MOVariable >> initialize [ 
	super initialize.
	modifiers := OrderedCollection new
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
		nextPutAll: '(';
		nextPutAll: (typeReference ifNil: [ ' unknown' ] ifNotNil: [ :t | t type name ]);
		nextPutAll: ')'
]

{ #category : #accessing }
MOVariable >> setOwnerClass: aClassObject [ 
	class := aClassObject 
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

{ #category : #'as yet unclassified' }
MOVariable >> visibility [
	^ visibility
]

{ #category : #'as yet unclassified' }
MOVariable >> visibility: aString [
	visibility := aString
]
