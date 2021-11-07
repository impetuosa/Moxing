Class {
	#name : #MOTypescriptDependency,
	#superclass : #MOTypescriptObject,
	#instVars : [
		'types',
		'from'
	],
	#category : #'Moxing-Typescript-Model'
}

{ #category : #'as yet unclassified' }
MOTypescriptDependency class >> compressDependencyCollection: deps [
	^ (deps groupedBy: #from) associations
		inject: OrderedCollection new
		into: [ :acc :ass | 
			| compressed each |
			each := ass value.
			each size = 1
				ifTrue: [ acc add: each first ]
				ifFalse: [ | adding |
					adding := OrderedCollection new.
					compressed := MOTypescriptDependency new.
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
MOTypescriptDependency >> acceptVisitor: aJinTypescriptCodeGenerator [ 
	aJinTypescriptCodeGenerator visitTypescriptDependency:  self .
]

{ #category : #'as yet unclassified' }
MOTypescriptDependency >> from [
	^ from
]

{ #category : #'as yet unclassified' }
MOTypescriptDependency >> from: aFileReference [
	(aFileReference isKindOf: FileReference)
		ifTrue: [ self halt ].
	from := aFileReference
]

{ #category : #'as yet unclassified' }
MOTypescriptDependency >> fromString [
	^ from ifNil: [ 'ERROR! FROM IS EMPTTY' ] ifNotNil: [ from ]
]

{ #category : #'as yet unclassified' }
MOTypescriptDependency >> printOn: aStream [
	aStream
		nextPutAll: ' import { ';
		nextPutAll: (',' join: (types collect: [ :t | t name ]));
		nextPutAll: ' } from ';
		nextPutAll: self fromString
]

{ #category : #'as yet unclassified' }
MOTypescriptDependency >> type: aString [
	types
		ifNil: [ types := {aString} asOrderedCollection ]
		ifNotNil: [ types add: aString ]
]

{ #category : #']as yet unclassified' }
MOTypescriptDependency >> types [
	^ types
]

{ #category : #'as yet unclassified' }
MOTypescriptDependency >> types: aCollection [
	types := aCollection
]
