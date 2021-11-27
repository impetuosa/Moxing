Class {
	#name : #MOImport,
	#superclass : #MOLanguageObject,
	#instVars : [
		'typeReferences'
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
MOImport >> name [
	^ name ifNil: [ name := '|' join: (typeReferences collect:#name)  ]
]

{ #category : #'as yet unclassified' }
MOImport >> printOn: aStream [

	aStream nextPutAll: 'import '.
	typeReferences do: [ :t | t printOn: aStream ]
]

{ #category : #'as yet unclassified' }
MOImport >> resolvesType: aString [

	^ typeReferences anySatisfy: [ :tr | tr name = aString ]
]

{ #category : #'sdk functions' }
MOImport >> typeNamed: aString [

	^ (typeReferences detect: [ :tr | tr name = aString ]) candidate
]

{ #category : #'as yet unclassified' }
MOImport >> typeReference: aString [
	typeReferences
		ifNil: [ typeReferences := {aString} asOrderedCollection ]
		ifNotNil: [ typeReferences add: aString ]
]

{ #category : #']as yet unclassified' }
MOImport >> typeReferences [
	^ typeReferences
]

{ #category : #'as yet unclassified' }
MOImport >> typeReferences: aCollection [
	typeReferences := aCollection
]
