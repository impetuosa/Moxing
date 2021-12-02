Class {
	#name : #MOClass,
	#superclass : #MOClassType,
	#instVars : [
		'superclassReference'
	],
	#classInstVars : [
		'object'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #accessing }
MOClass class >> object [
	^ object
		ifNil:
			[ object := MOTypescriptPrebuiltTypeReferenceFactory default object ]
]

{ #category : #visiting }
MOClass >> acceptVisitor: aJinTypescriptCodeGenerator [ 
	aJinTypescriptCodeGenerator visitClass: self .
]

{ #category : #adding }
MOClass >> addConstructor: aMOConstructor [

	methods add: aMOConstructor
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

{ #category : #generated }
MOClass >> dependencies [
	| deps |
	deps := OrderedCollection
		streamContents: [ :str | 
			str nextPutAll: imports.
			decorator ifNotNil: [ str nextPutAll: decorator dependencies ].
			str nextPutAll: (self types flatCollect: [ :t | t dependencies ]).
			str nextPutAll: (attributes flatCollect: [ :t | t dependencies ]).
			str nextPutAll: (methods flatCollect: [ :t | t dependencies ]).
			str
				nextPutAll: (superclassReference ifNil: [ {} ] ifNotNil: [ :s | s dependencies ]) ].
	^ MOImport compressDependencyCollection: deps
]

{ #category : #generated }
MOClass >> hierarchicalChildren [

	^ self annotations , self imports , self typeParameters
	  , self attributes , self methods
]

{ #category : #'as yet unclassified' }
MOClass >> inheritanceTypeReferences [

	^ super inheritanceTypeReferences , (superclassReference
		   ifNotNil: [ { superclassReference } ]
		   ifNil: [ {  } ])
]

{ #category : #generated }
MOClass >> initialize [

	super initialize.
	methods := OrderedCollection new.
	visibility := #default
]

{ #category : #accessing }
MOClass >> parent: aParent [

	aParent ifNil: [ ^ self ].
	parent ifNotNil: [ self halt ].
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

{ #category : #accessing }
MOClass >> superclassReference [

	^ superclassReference
]

{ #category : #accessing }
MOClass >> superclassReference: anUndefinedObject [ 
	superclassReference := anUndefinedObject
]
