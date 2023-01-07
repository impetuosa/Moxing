Class {
	#name : #MOImport,
	#superclass : #MOStatement,
	#instVars : [
		'#name => MOPropertySlot',
		'#typeReference => MORefersSlot one',
		'#packageReference => MORefersSlot one'
	],
	#category : #'Moxing-LanguageModel-Statements'
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

	^ aJinTypescriptCodeGenerator visitImport: self
]

{ #category : #'as yet unclassified' }
MOImport >> importsAllPackage [

	^ typeReference isNil
]

{ #category : #'as yet unclassified' }
MOImport >> name [

	^ name ifNil: [ 
		  name := typeReference ifNil: [ #ALL ] ifNotNil: [ :r | r name ] ]
]

{ #category : #accessing }
MOImport >> packageReference [
	^ packageReference
]

{ #category : #accessing }
MOImport >> packageReference: aMOPackageReference [

	packageReference := aMOPackageReference
]

{ #category : #accessing }
MOImport >> packageReferenceName [
	^ packageReference ifNotNil: [ :r | r name  ]
]

{ #category : #'as yet unclassified' }
MOImport >> printOn: aStream [

	aStream nextPutAll: 'import '.
	typeReference printOn: aStream
]

{ #category : #visiting }
MOImport >> resolvesType: aTypeReference [

	(aTypeReference packageReference isNil or: [ 
		 aTypeReference packageReference = packageReference ]) ifFalse: [ 
		^ false ].

	^ name = #ALL
		  ifTrue: [ 
			  packageReference referee allTypes contains: [ :a | 
				  a name = aTypeReference name ] ]
		  ifFalse: [ 
		  self types anySatisfy: [ :tr | tr name = aTypeReference name ] ]
]

{ #category : #']as yet unclassified' }
MOImport >> type [

	^ typeReference referee
]

{ #category : #visiting }
MOImport >> typeNamed: aString [

	^ self types detect: [ :a | a name = aString ]
]

{ #category : #']as yet unclassified' }
MOImport >> typeReference [

	^ typeReference 
]

{ #category : #'as yet unclassified' }
MOImport >> typeReference: aReference [

	typeReference := aReference
]

{ #category : #']as yet unclassified' }
MOImport >> types [

	^ typeReference
		  ifNil: [ packageReference referee allTypes ]
		  ifNotNil: [ 
			  typeReference referee
				  ifNil: [ {  } ]
				  ifNotNil: [ { typeReference referee } ] ]
]
