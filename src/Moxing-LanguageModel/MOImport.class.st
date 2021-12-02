Class {
	#name : #MOImport,
	#superclass : #MOLanguageObject,
	#instVars : [
		'typeReference'
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

	^ name ifNil: [ name := typeReference name ]
]

{ #category : #'as yet unclassified' }
MOImport >> printOn: aStream [

	aStream nextPutAll: 'import '.
	typeReference printOn: aStream
]

{ #category : #'as yet unclassified' }
MOImport >> resolvesType: aString [

	^ typeReference name = aString
]

{ #category : #']as yet unclassified' }
MOImport >> type [

	^ typeReference candidate
]

{ #category : #'sdk functions' }
MOImport >> typeNamed: aString [

	self assert: (self resolvesType: aString).
	^ self type 
]

{ #category : #']as yet unclassified' }
MOImport >> typeReference [

	^ typeReference 
]

{ #category : #'as yet unclassified' }
MOImport >> typeReference: aReference [

	typeReference := aReference
]
