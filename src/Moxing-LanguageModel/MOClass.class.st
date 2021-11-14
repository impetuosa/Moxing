Class {
	#name : #MOClass,
	#superclass : #MOInterface,
	#instVars : [
		'types',
		'methods',
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

{ #category : #adding }
MOClass >> addMethod: aJinTypescriptMethod [ 
	methods  add: aJinTypescriptMethod .
	aJinTypescriptMethod setOwnerClass: self . 
]

{ #category : #generated }
MOClass >> dependencies [
	| deps |
	deps := OrderedCollection
		streamContents: [ :str | 
			str nextPutAll: imports.
			decorator ifNotNil: [ str nextPutAll: decorator dependencies ].
			str nextPutAll: (self types flatCollect: [ :t | t dependencies ]).
			str nextPutAll: (properties flatCollect: [ :t | t dependencies ]).
			str nextPutAll: (methods flatCollect: [ :t | t dependencies ]).
			str
				nextPutAll: (superclass ifNil: [ {} ] ifNotNil: [ :s | s dependencies ]) ].
	^ MOImport compressDependencyCollection: deps
]

{ #category : #generated }
MOClass >> implements: aCollection [ 
	types := aCollection 
]

{ #category : #generated }
MOClass >> initialize [ 
	super initialize .
	methods := OrderedCollection new .

]

{ #category : #accessing }
MOClass >> methods [
	^ methods
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

	^ superclass ifNil: [ superclass := self class object  ]
]

{ #category : #accessing }
MOClass >> types [
	^ types ifNil: [ {  } ]
]
