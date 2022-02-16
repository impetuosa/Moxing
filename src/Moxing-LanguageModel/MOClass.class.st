Class {
	#name : #MOClass,
	#superclass : #MOClassType,
	#instVars : [
		'#superclassReference => MOReferenceSlot one'
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

{ #category : #generated }
MOClass >> dependencies [

	| deps |
	deps := OrderedCollection streamContents: [ :str | 
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
		        str nextPutAll:
			        (superclassReference
				         ifNil: [ {  } ]
				         ifNotNil: [ :s | s dependencies ]) ].
	^ MOImport compressDependencyCollection: deps
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

{ #category : #accessing }
MOClass >> superclassReference [

	^ superclassReference
]

{ #category : #accessing }
MOClass >> superclassReference: anUndefinedObject [ 

	superclassReference := anUndefinedObject
]
