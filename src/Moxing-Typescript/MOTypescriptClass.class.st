Class {
	#name : #MOTypescriptClass,
	#superclass : #MOTypescriptObject,
	#instVars : [
		'types',
		'methods',
		'superclass',
		'properties',
		'decorator',
		'imports'
	],
	#classInstVars : [
		'object'
	],
	#category : #'Moxing-Typescript-Model'
}

{ #category : #accessing }
MOTypescriptClass class >> object [
	^ object
		ifNil:
			[ object := MOTypescriptPrebuiltTypeReferenceFactory default object ]
]

{ #category : #visiting }
MOTypescriptClass >> acceptVisitor: aJinTypescriptCodeGenerator [ 
	aJinTypescriptCodeGenerator visitTypescriptClass: self .
]

{ #category : #'as yet unclassified' }
MOTypescriptClass >> addImport: aMOTypescriptImport [ 
	imports add: aMOTypescriptImport 
]

{ #category : #adding }
MOTypescriptClass >> addMethod: aJinTypescriptMethod [ 
	methods  add: aJinTypescriptMethod .
	aJinTypescriptMethod setOwnerClass: self . 
]

{ #category : #adding }
MOTypescriptClass >> addProperty: aProperty [
	properties add: aProperty.
	aProperty setOwnerClass: self
]

{ #category : #accessing }
MOTypescriptClass >> decorator [

	^ decorator
]

{ #category : #accessing }
MOTypescriptClass >> decorator: aDeco [

	decorator := aDeco
]

{ #category : #generated }
MOTypescriptClass >> dependencies [
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
	^ MOTypescriptDependency compressDependencyCollection: deps
]

{ #category : #generated }
MOTypescriptClass >> implements: aCollection [ 
	types := aCollection 
]

{ #category : #'as yet unclassified' }
MOTypescriptClass >> imports [
	^ imports
]

{ #category : #generated }
MOTypescriptClass >> initialize [ 
	super initialize .
	methods := OrderedCollection new .
	properties := OrderedCollection new. 
	imports := OrderedCollection new. 
]

{ #category : #accessing }
MOTypescriptClass >> methods [
	^ methods
]

{ #category : #accessing }
MOTypescriptClass >> parents [
	self shouldBeImplemented.
]

{ #category : #accessing }
MOTypescriptClass >> properties [
	^ properties 
]

{ #category : #accessing }
MOTypescriptClass >> superclass [

	^ superclass ifNil: [ superclass := self class object  ]
]

{ #category : #accessing }
MOTypescriptClass >> types [
	^ types ifNil: [ {  } ]
]
