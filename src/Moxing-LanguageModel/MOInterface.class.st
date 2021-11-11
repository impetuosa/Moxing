Class {
	#name : #MOInterface,
	#superclass : #MOType,
	#instVars : [
		'properties',
		'imports',
		'decorator'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #'as yet unclassified' }
MOInterface >> addImport: aMOTypescriptImport [ 
	imports add: aMOTypescriptImport 
]

{ #category : #adding }
MOInterface >> addProperty: aProperty [
	properties add: aProperty.
	aProperty setOwnerClass: self
]

{ #category : #adding }
MOInterface >> addVariable: aMOVariable [

	self addProperty: aMOVariable
]

{ #category : #generated }
MOInterface >> decorator [
	^ decorator
]

{ #category : #generated }
MOInterface >> decorator: aDe [	
	decorator := aDe 
]

{ #category : #generated }
MOInterface >> dependencies [

	| deps |
	deps := OrderedCollection streamContents: [ :str | 
		        str nextPutAll: imports.
		        decorator ifNotNil: [ 
			        str nextPutAll: decorator dependencies ].
		        str nextPutAll:
			        (properties flatCollect: [ :t | t dependencies ]) ].
	^ MOImport compressDependencyCollection: deps
]

{ #category : #'as yet unclassified' }
MOInterface >> imports [
	^ imports
]

{ #category : #generated }
MOInterface >> initialize [ 
	super initialize .
	properties := OrderedCollection new. 
	imports := OrderedCollection new. 
]

{ #category : #adding }
MOInterface >> printOn: aStream [

	aStream
		nextPutAll: 'interface: ';
		nextPutAll: name
]

{ #category : #accessing }
MOInterface >> properties [
	^ properties 
]
