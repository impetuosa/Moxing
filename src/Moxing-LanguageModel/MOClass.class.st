Class {
	#name : #MOClass,
	#superclass : #MOType,
	#instVars : [
		'#superTypeReferences => MORefersSlot many',
		'#superclassReference => MORefersSlot one',
		'#attributes => MODeclaresSlot many',
		'#methods => MODeclaresSlot many',
		'#annotationInstances => MORefersSlot many'
	],
	#classInstVars : [
		'#object'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #visiting }
MOClass >> acceptVisitor: aJinTypescriptCodeGenerator [

	^ aJinTypescriptCodeGenerator visitClass: self
]

{ #category : #navigation }
MOClass >> allMethods [

	^ methods
	  , (self superClass ifNotNil: [ :s | s allMethods ] ifNil: [ {  } ])
]

{ #category : #generated }
MOClass >> allVisibleMethods [

	^ super allVisibleMethods 
	  ,
	  (superclassReference
		   ifNotNil: [ superclassReference allVisibleMethods ]
		   ifNil: [ {  } ])
]

{ #category : #accessing }
MOClass >> annotationInstances [
	^ annotationInstances
]

{ #category : #accessing }
MOClass >> annotationInstances: aCollection [ 
	annotationInstances := aCollection
]

{ #category : #accessing }
MOClass >> attributes [

	^ attributes
]

{ #category : #accessing }
MOClass >> attributes: aCollection [ 

	attributes :=aCollection
]

{ #category : #'as yet unclassified' }
MOClass >> canbeReferredAsSelf [

	^ true
]

{ #category : #'as yet unclassified' }
MOClass >> constructors [

	^ self methods select: [ :m | m isKindOf: MOConstructor ]
]

{ #category : #generated }
MOClass >> dependencies [

	| deps |
	deps := OrderedCollection streamContents: [ :str | 
		        str nextPutAll: self superTypeReferences.
		        self superclassReference ifNotNil: [ 
			        str nextPut: self superclassReference ].
		        annotationInstances ifNotNil: [ 
			        str nextPutAll:
				        (annotationInstances flatCollect: #dependencies) ].
		        str nextPutAll:
			        (attributes flatCollect: [ :t | t dependencies ]).
		        str nextPutAll:
			        (methods flatCollect: [ :t | t dependencies ]).
		        str nextPutAll:
			        (superclassReference
				         ifNil: [ {  } ]
				         ifNotNil: [ :s | s dependencies ]) ].
	^ (deps reject: #isNil) removeDuplicates
]

{ #category : #'as yet unclassified' }
MOClass >> inheritanceTypeReferences [

	^ superclassReference
		  ifNotNil: [ { superclassReference } ]
		  ifNil: [ {  } ]
]

{ #category : #generated }
MOClass >> initialize [

	super initialize.
	methods := OrderedCollection new.
	visibility := #default
]

{ #category : #navigation }
MOClass >> isClassLike [

	^ true
]

{ #category : #accessing }
MOClass >> isStMetaclass [

	^ false
]

{ #category : #'accessing - methods' }
MOClass >> methodNamed: aString [

	| m |
	m := methods select: [ :a | a selector = aString ].
	self assert: m size = 1.
	^ m first
]

{ #category : #'as yet unclassified' }
MOClass >> methodNamed: aString parameters: aCollection [

	^ (methods detect: [ :a | 
		  a selector = aString and: [ 
			  (a parameters collect: [ :p | p typeReference name ]) asArray
			  = aCollection ] ])
]

{ #category : #accessing }
MOClass >> methods [
	^ methods
]

{ #category : #accessing }
MOClass >> methods: aCollection [ 
	methods := aCollection
]

{ #category : #accessing }
MOClass >> parent: aParent [

	aParent ifNil: [ ^ self ].
	self parent ifNotNil: [ 
		self parent = aParent ifFalse: [ "self halt " ] ].
	parent := aParent
]

{ #category : #generated }
MOClass >> printOn: aStream [

	aStream
		nextPutAll: 'class: ';
		nextPutAll:self  name
]

{ #category : #'as yet unclassified' }
MOClass >> superClass [

	^ self superclassReference ifNotNil: [ :s | s referee ]
]

{ #category : #navigation }
MOClass >> superTypeReferences [
	^ superTypeReferences
]

{ #category : #generated }
MOClass >> superTypeReferences: aCollection [ 
	superTypeReferences := aCollection
]

{ #category : #accessing }
MOClass >> superclassReference [

	^ superclassReference
]

{ #category : #accessing }
MOClass >> superclassReference: anUndefinedObject [ 

	superclassReference := anUndefinedObject
]
