Class {
	#name : #MOClassType,
	#superclass : #MOType,
	#instVars : [
		'#superTypeReferences => MOReferenceSlot many',
		'#attributes => MOContainmentSlot many',
		'#methods => MOContainmentSlot many',
		'#annotationInstances => MOReferenceSlot many'
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

{ #category : #accessing }
MOClassType >> superTypeReferences [
	^ superTypeReferences
]

{ #category : #adding }
MOClassType >> superTypeReferences: aCollection [ 
	superTypeReferences := aCollection
]
