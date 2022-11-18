Class {
	#name : #MOClassType,
	#superclass : #MOType,
	#instVars : [
		'#superTypeReferences => MORefersSlot many',
		'#attributes => MODeclaresSlot many',
		'#methods => MODeclaresSlot many',
		'#annotationInstances => MORefersSlot many'
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
MOClassType >> annotationInstances: aCollection [ 
	annotationInstances := aCollection
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
MOClassType >> dependencies [

	| deps |
	self shouldBeImplemented ."
	deps := OrderedCollection streamContents: [ :str | 
		      
		        str nextPutAll:
			        (attributes flatCollect: [ :t | t dependencies ]) ].
	^ MOImport compressDependencyCollection: deps"
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

{ #category : #accessing }
MOClassType >> isClassType [
	^ true .
]

{ #category : #'as yet unclassified' }
MOClassType >> methodNamed: aString [

	| m |
	m := methods select: [ :a | a selector = aString ].
	self assert: m size = 1.
	^ m first
]

{ #category : #'as yet unclassified' }
MOClassType >> methodNamed: aString parameters: aCollection [

	^ (methods detect: [ :a | 
		  a selector = aString and: [ 
			  (a parameters collect: [ :p | p typeReference name ]) asArray
			  = aCollection ] ])
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
		nextPutAll: self name
]

{ #category : #accessing }
MOClassType >> superTypeReferences [
	^ superTypeReferences
]

{ #category : #adding }
MOClassType >> superTypeReferences: aCollection [ 
	superTypeReferences := aCollection
]
