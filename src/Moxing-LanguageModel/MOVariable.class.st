Class {
	#name : #MOVariable,
	#superclass : #MOLanguageObject,
	#instVars : [
		'type',
		'class',
		'visibility',
		'defaultValue',
		'modifiers'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #accessing }
MOVariable >> acceptVisitor: aJinTypescriptCodeGenerator [
	aJinTypescriptCodeGenerator visitVariable: self
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
	deps := type ifNotNil: [ type dependencies ] ifNil: [ {} ].
	^ defaultValue
		ifNil: [ deps ]
		ifNotNil: [ deps , defaultValue dependencies ]
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
MOVariable >> printOn: aStream [

	aStream
		nextPutAll: 'VD:';
		nextPutAll: name;
		nextPutAll: '(';
		nextPutAll: (type ifNil: [ ' unknown' ] ifNotNil: [ :t | t name ]);
		nextPutAll: ')'
]

{ #category : #accessing }
MOVariable >> setOwnerClass: aClassObject [ 
	class := aClassObject 
]

{ #category : #accessing }
MOVariable >> type [
	^ type
]

{ #category : #accessing }
MOVariable >> type: aJinTypescriptTypeReference [ 
(	aJinTypescriptTypeReference isKindOf: MOTypescriptTypeLoader ) ifTrue: [ self halt  ].

	type := aJinTypescriptTypeReference
]

{ #category : #'as yet unclassified' }
MOVariable >> visibility [
	^ visibility
]

{ #category : #'as yet unclassified' }
MOVariable >> visibility: aString [
	visibility := aString
]
