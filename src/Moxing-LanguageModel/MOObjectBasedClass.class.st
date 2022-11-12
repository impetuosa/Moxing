Class {
	#name : #MOObjectBasedClass,
	#superclass : #MOType,
	#instVars : [
		'#superTypeReferences => MORefersSlot many',
		'#attributes => MODeclaresSlot many',
		'#methods => MODeclaresSlot many'
	],
	#classInstVars : [
		'#object'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MOObjectBasedClass class >> object [
	^ object
		ifNil:
			[ object := MOTypescriptPrebuiltTypeReferenceFactory default object ]
]

{ #category : #visiting }
MOObjectBasedClass >> acceptVisitor: aJinTypescriptCodeGenerator [

	^ aJinTypescriptCodeGenerator visitObjectBasedClass: self
]

{ #category : #navigation }
MOObjectBasedClass >> allMethods [

	^ methods
]

{ #category : #generated }
MOObjectBasedClass >> allVisibleMethods [

	^ methods
]

{ #category : #generated }
MOObjectBasedClass >> attributes [

	^ attributes
]

{ #category : #generated }
MOObjectBasedClass >> attributes: aCollection [ 

	attributes :=aCollection
]

{ #category : #generated }
MOObjectBasedClass >> dependencies [

	| deps |
	self shouldBeImplemented .
	"deps := OrderedCollection streamContents: [ :str | 
		        parent ifNotNil: [ :p | str nextPutAll: p dependencies ].
		        self decorators ifNotNil: [ 
			        str nextPutAll:
				        (self decorators flatCollect: [ :e | e dependencies ]) ].
		        str nextPutAll:
			        (self superTypeReferences flatCollect: [ :t | 
				         t dependencies ]).
		        str nextPutAll:
			        (attributes flatCollect: [ :t | t dependencies ]).
		        str nextPutAll:
			        (methods flatCollect: [ :t | t dependencies ]).
		        ].
	^ MOImport compressDependencyCollection: deps"
]

{ #category : #generated }
MOObjectBasedClass >> initialize [

	super initialize.
	methods := OrderedCollection new.
	visibility := #default
]

{ #category : #accessing }
MOObjectBasedClass >> parent: aParent [

	aParent ifNil: [ ^ self ].
	self parent ifNotNil: [ self parent = aParent ifFalse: [ self halt ] ].
	parent := aParent
]

{ #category : #generated }
MOObjectBasedClass >> printOn: aStream [

	aStream
		nextPutAll: 'class: ';
		nextPutAll: self  name
]

{ #category : #'as yet unclassified' }
MOObjectBasedClass >> superClass [

	^ self superclassReference ifNotNil: [ :s | s referee ]
]

{ #category : #navigation }
MOObjectBasedClass >> superTypeReferences [
	^ superTypeReferences
]

{ #category : #generated }
MOObjectBasedClass >> superTypeReferences: aCollection [ 
	superTypeReferences := aCollection
]
