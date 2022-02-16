Class {
	#name : #MOClassType,
	#superclass : #MOTypeParameter,
	#instVars : [
		'#attributes => MOContainmentSlot many',
		'#decorators => MOReferenceSlot many',
		'#methods => MOContainmentSlot many',
		'#typeParameters => MOContainmentSlot many'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MOClassType >> acceptVisitor: aMOCatalogTypeInstaller [

	^ aMOCatalogTypeInstaller visitClassType: self
]

{ #category : #'as yet unclassified' }
MOClassType >> allVisibleMethods [

	^ self methods , (superTypeReferences
		   ifNotNil: [ superTypeReferences flatCollect: [ :t | t allVisibleMethods ] ]
		   ifNil: [ {  } ])
]

{ #category : #accessing }
MOClassType >> attributes [
	^ attributes 
]

{ #category : #accessing }
MOClassType >> attributes: aCollection [ 
	attributes := aCollection
]

{ #category : #'as yet unclassified' }
MOClassType >> constructors [

	^ self methods select: [ :m | m isKindOf: MOConstructor ]
]

{ #category : #generated }
MOClassType >> decorators [
	^ decorators
]

{ #category : #accessing }
MOClassType >> decorators: aCollection [ 
	decorators := aCollection
]

{ #category : #generated }
MOClassType >> dependencies [

	| deps |
	deps := OrderedCollection streamContents: [ :str | 
		        decorators do: [ :d | str nextPutAll: d dependencies ].
		        str nextPutAll:
			        (attributes flatCollect: [ :t | t dependencies ]) ].
	^ MOImport compressDependencyCollection: deps
]

{ #category : #adding }
MOClassType >> fullName [

	^ (packageReference ifNotNil: [ :p | p name , '.' ] ifNil: [ '' ])
	  , self name
]

{ #category : #'as yet unclassified' }
MOClassType >> inheritanceTypeReferences [

	^ superTypeReferences copy
]

{ #category : #generated }
MOClassType >> initialize [ 
	super initialize .
	attributes := OrderedCollection new. 
]

{ #category : #adding }
MOClassType >> methods [

	^ methods ifNil: [ methods := OrderedCollection new ]
]

{ #category : #accessing }
MOClassType >> methods: aCollection [ 
	methods := aCollection
]

{ #category : #adding }
MOClassType >> printOn: aStream [

	aStream
		nextPutAll: 'interface: ';
		nextPutAll: name
]

{ #category : #generated }
MOClassType >> typeParameters [

	^ typeParameters
]

{ #category : #generated }
MOClassType >> typeParameters: aCollection [

	typeParameters := aCollection
]
