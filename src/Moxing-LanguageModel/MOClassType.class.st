Class {
	#name : #MOClassType,
	#superclass : #MOTypeParameter,
	#instVars : [
		'attributes',
		'imports',
		'decorator',
		'methods',
		'typeParameters'
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

	self methods add: aJinTypescriptMethod.
	aJinTypescriptMethod setOwnerClass: self
]

{ #category : #adding }
MOClassType >> addTypeParameter: aMOTypeParameter [

	self typeParameters add: aMOTypeParameter
]

{ #category : #'as yet unclassified' }
MOClassType >> allVisibleMethods [

	^ self methods , (supertypeReferences
		   ifNotNil: [ supertypeReferences flatCollect: [ :t | t allVisibleMethods ] ]
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

{ #category : #accessing }
MOClassType >> imports: aCollection [ 
	imports := aCollection
]

{ #category : #generated }
MOClassType >> initialize [ 
	super initialize .
	attributes := OrderedCollection new. 
	imports := OrderedCollection new. 
]

{ #category : #adding }
MOClassType >> methods [

	^ methods ifNil: [ methods := OrderedCollection new ]
]

{ #category : #adding }
MOClassType >> printOn: aStream [

	aStream
		nextPutAll: 'interface: ';
		nextPutAll: name
]

{ #category : #generated }
MOClassType >> typeParameters [

	^ typeParameters ifNil: [ typeParameters := OrderedCollection new ]
]
