Class {
	#name : #MOClass,
	#superclass : #MOClassType,
	#instVars : [
		'types',
		'superclass'
	],
	#classInstVars : [
		'object'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #accessing }
MOClass class >> object [
	^ object
		ifNil:
			[ object := MOTypescriptPrebuiltTypeReferenceFactory default object ]
]

{ #category : #visiting }
MOClass >> acceptVisitor: aJinTypescriptCodeGenerator [ 
	aJinTypescriptCodeGenerator visitClass: self .
]

{ #category : #generated }
MOClass >> allVisibleMethods [

	^ super allVisibleMethods 
	  ,
	  (superclass
		   ifNotNil: [ superclass allVisibleMethods ]
		   ifNil: [ {  } ])
]

{ #category : #generated }
MOClass >> dependencies [
	| deps |
	deps := OrderedCollection
		streamContents: [ :str | 
			str nextPutAll: imports.
			decorator ifNotNil: [ str nextPutAll: decorator dependencies ].
			str nextPutAll: (self types flatCollect: [ :t | t dependencies ]).
			str nextPutAll: (attributes flatCollect: [ :t | t dependencies ]).
			str nextPutAll: (methods flatCollect: [ :t | t dependencies ]).
			str
				nextPutAll: (superclass ifNil: [ {} ] ifNotNil: [ :s | s dependencies ]) ].
	^ MOImport compressDependencyCollection: deps
]

{ #category : #generated }
MOClass >> hierarchicalChildren [

	^ self properties , self methods
]

{ #category : #generated }
MOClass >> implements: aCollection [ 
	types := aCollection 
]

{ #category : #generated }
MOClass >> initialize [

	super initialize.
	methods := OrderedCollection new.
	visibility := #default
]

{ #category : #accessing }
MOClass >> parents [
	self shouldBeImplemented.
]

{ #category : #generated }
MOClass >> printOn: aStream [

	aStream
		nextPutAll: 'class: ';
		nextPutAll: name
]

{ #category : #accessing }
MOClass >> superclass [

	^ superclass
]

{ #category : #accessing }
MOClass >> superclass: anUndefinedObject [ 
	superclass := anUndefinedObject
]
