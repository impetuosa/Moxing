Class {
	#name : #MOImport,
	#superclass : #MOLanguageObject,
	#instVars : [
		'types',
		'from'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #'as yet unclassified' }
MOImport class >> compressDependencyCollection: deps [
	^ (deps groupedBy: #from) associations
		inject: OrderedCollection new
		into: [ :acc :ass | 
			| compressed each |
			each := ass value.
			each size = 1
				ifTrue: [ acc add: each first ]
				ifFalse: [ | adding |
					adding := OrderedCollection new.
					compressed := MOImport new.
					(each flatCollect:[ :e | e types ] )do: [ :e | 
							(adding noneSatisfy: [ :t | t name = e name ])
								ifTrue: [ adding add: e ] ].
					compressed
						types: adding;
						from: ass key.
					acc add: compressed ].
			acc ]
]

{ #category : #'as yet unclassified' }
MOImport >> acceptVisitor: aJinTypescriptCodeGenerator [ 
	aJinTypescriptCodeGenerator visitDependency:  self .
]

{ #category : #'as yet unclassified' }
MOImport >> from [
	^ from
]

{ #category : #'as yet unclassified' }
MOImport >> from: aFileReference [
	(aFileReference isKindOf: FileReference)
		ifTrue: [ self halt ].
	from := aFileReference
]

{ #category : #'as yet unclassified' }
MOImport >> fromString [
	^ from ifNil: [ 'ERROR! FROM IS EMPTTY' ] ifNotNil: [ from ]
]

{ #category : #'as yet unclassified' }
MOImport >> name [
	^ name ifNil: [ name := '|' join: (types collect:#name)  ]
]

{ #category : #'as yet unclassified' }
MOImport >> printOn: aStream [
	aStream
		nextPutAll: ' import { ';
		nextPutAll: (',' join: (types collect: [ :t | t name ]));
		nextPutAll: ' } from ';
		nextPutAll: self fromString
]

{ #category : #'as yet unclassified' }
MOImport >> type: aString [
	types
		ifNil: [ types := {aString} asOrderedCollection ]
		ifNotNil: [ types add: aString ]
]

{ #category : #']as yet unclassified' }
MOImport >> types [
	^ types
]

{ #category : #'as yet unclassified' }
MOImport >> types: aCollection [
	types := aCollection
]
