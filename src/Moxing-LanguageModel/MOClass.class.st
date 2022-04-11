Class {
	#name : #MOClass,
	#superclass : #MOType,
	#instVars : [
		'#superTypeReferences => MOReferenceSlot many',
		'#superclassReference => MOReferenceSlot one',
		'#attributes => MOContainmentSlot many',
		'#methods => MOContainmentSlot many',
		'#annotationInstances => MOReferenceSlot many'
	],
	#classInstVars : [
		'#object'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MOClass class >> object [
	^ object
		ifNil:
			[ object := MOTypescriptPrebuiltTypeReferenceFactory default object ]
]

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
	parent ifNotNil: [ parent = aParent ifFalse: [ self halt ] ].
	parent := aParent
]

{ #category : #accessing }
MOClass >> parents [
	self shouldBeImplemented.
]

{ #category : #generated }
MOClass >> printOn: aStream [

	aStream
		nextPutAll: 'class: ';
		nextPutAll: name
]

{ #category : #'as yet unclassified' }
MOClass >> superClass [

	^ self superclassReference ifNotNil: [ :s | s candidate ]
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
