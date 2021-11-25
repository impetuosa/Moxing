Class {
	#name : #MOClassType,
	#superclass : #MOType,
	#instVars : [
		'attributes',
		'imports',
		'decorator',
		'methods',
		'supertypes'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #adding }
MOClassType >> addAttribute: aProperty [
	attributes add: aProperty.
	aProperty setOwnerType: self
]

{ #category : #'as yet unclassified' }
MOClassType >> addImport: aMOTypescriptImport [ 
	imports add: aMOTypescriptImport 
]

{ #category : #adding }
MOClassType >> addMethod: aJinTypescriptMethod [ 
	methods  add: aJinTypescriptMethod .
	aJinTypescriptMethod setOwnerClass: self . 
]

{ #category : #'as yet unclassified' }
MOClassType >> allVisibleMethods [

	^ methods , (supertypes
		   ifNotNil: [ supertypes flatCollect: [ :t | t allVisibleMethods ] ]
		   ifNil: [ {  } ])
]

{ #category : #accessing }
MOClassType >> attributes [
	^ attributes 
]

{ #category : #generated }
MOClassType >> decorator [
	^ decorator
]

{ #category : #generated }
MOClassType >> decorator: aDe [	
	decorator := aDe 
]

{ #category : #generated }
MOClassType >> dependencies [

	| deps |
	deps := OrderedCollection streamContents: [ :str | 
		        str nextPutAll: imports.
		        decorator ifNotNil: [ 
			        str nextPutAll: decorator dependencies ].
		        str nextPutAll:
			        (attributes flatCollect: [ :t | t dependencies ]) ].
	^ MOImport compressDependencyCollection: deps
]

{ #category : #'as yet unclassified' }
MOClassType >> imports [
	^ imports
]

{ #category : #generated }
MOClassType >> initialize [ 
	super initialize .
	attributes := OrderedCollection new. 
	imports := OrderedCollection new. 
]

{ #category : #accessing }
MOClassType >> methods [
	^ methods
]

{ #category : #adding }
MOClassType >> printOn: aStream [

	aStream
		nextPutAll: 'interface: ';
		nextPutAll: name
]

{ #category : #accessing }
MOClassType >> supertypes: aCollection [ 
	supertypes := aCollection
]
