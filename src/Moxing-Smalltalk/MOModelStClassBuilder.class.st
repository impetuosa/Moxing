Class {
	#name : #MOModelStClassBuilder,
	#superclass : #MOModelClassBuilder,
	#instVars : [
		'metaclass',
		'category',
		'sharedVariables',
		'comment',
		'isPreexisting',
		'metaclassAttributes',
		'metaclassMethods',
		'sharedPoolReferences'
	],
	#category : #'Moxing-Smalltalk-builer'
}

{ #category : #asserting }
MOModelStClassBuilder >> addAttribute: anAttribute [

	(anAttribute isStaticBinding and: [ anAttribute isSharedVariable not ])
		ifTrue: [ self addMetaclassAttribute: anAttribute ]
		ifFalse: [ super addAttribute: anAttribute ]
]

{ #category : #adding }
MOModelStClassBuilder >> addMetaclassAttribute: aMOAttribute [

	^ self metaclassAttributes add: aMOAttribute
]

{ #category : #adding }
MOModelStClassBuilder >> addMetaclassMethod: aMOMethod [

	^ (aMOMethod selector beginsWith: #test)
		  ifTrue: [ self methods add: aMOMethod ]
		  ifFalse: [ self metaclassMethods add: aMOMethod ]
]

{ #category : #asserting }
MOModelStClassBuilder >> addMethod: aMethod [

	aMethod isStaticBinding
		ifTrue: [ self addMetaclassMethod: aMethod ] 
		ifFalse: [ super addMethod: aMethod ]
]

{ #category : #asserting }
MOModelStClassBuilder >> addSharedPoolReference: aReference [

	self sharedPoolReferences add: aReference
]

{ #category : #'as yet unclassified' }
MOModelStClassBuilder >> buildMetaclass [

	^ self metaclass
		  attributes: self metaclassAttributes;
		  methods: self metaclassMethods;
		  yourself
]

{ #category : #asserting }
MOModelStClassBuilder >> buildsType [

	^ MOStClass
]

{ #category : #accessing }
MOModelStClassBuilder >> category [
	^ category
]

{ #category : #accessing }
MOModelStClassBuilder >> category: aString [

	category := aString
]

{ #category : #asserting }
MOModelStClassBuilder >> comment [ 
	^ comment ifNil: [ 'no comment' ]
]

{ #category : #asserting }
MOModelStClassBuilder >> comment: aComment [

	comment := aComment
]

{ #category : #accessing }
MOModelStClassBuilder >> isPreexisting [

	^ isPreexisting
]

{ #category : #testing }
MOModelStClassBuilder >> isPreexisting: anUndefinedObject [
  isPreexisting := anUndefinedObject
]

{ #category : #asserting }
MOModelStClassBuilder >> loadBuilderWithEntity: anEntity [

	super loadBuilderWithEntity: anEntity.
	self metaclass: anEntity metaclass.
	self category: anEntity category.
	self comment: anEntity comment.
	self isPreexisting: anEntity isPreexisting.
	self sharedPoolReferences: anEntity sharedPoolReferences
]

{ #category : #asserting }
MOModelStClassBuilder >> metaclass [

	^ metaclass ifNil: [ 
		  metaclass := self instantiate: MOMetaClass.
		  metaclass name: self name , ' class'.
		  metaclass ]
]

{ #category : #asserting }
MOModelStClassBuilder >> metaclass: aMetaClass [
	self assert: (aMetaClass isKindOf: MOMetaClass).
	metaclass := aMetaClass.

	metaclass ifNotNil: [ 
		self metaclassAttributes: metaclass attributes.
		self metaclassMethods: metaclass methods ]
]

{ #category : #'as yet unclassified' }
MOModelStClassBuilder >> metaclassAttributes [

	^ metaclassAttributes ifNil: [ 
		  metaclassAttributes := OrderedCollection new ]
]

{ #category : #asserting }
MOModelStClassBuilder >> metaclassAttributes: col [ 
	 metaclassAttributes := col
]

{ #category : #'as yet unclassified' }
MOModelStClassBuilder >> metaclassMethods [

	^ metaclassMethods ifNil: [ 
		  metaclassMethods := OrderedCollection new ]
]

{ #category : #asserting }
MOModelStClassBuilder >> metaclassMethods: col [ 
	 metaclassMethods := col
]

{ #category : #asserting }
MOModelStClassBuilder >> privateBuild [

	^ super privateBuild
		  metaclass: self buildMetaclass;
		  category: self category;
		  comment: self comment;
		  sharedPoolReferences: self sharedPoolReferences;
		  isPreexisting: self isPreexisting;
		  yourself
]

{ #category : #asserting }
MOModelStClassBuilder >> sharedPoolReferences [

	^ sharedPoolReferences ifNil: [ 
		  sharedPoolReferences := OrderedCollection new ]
]

{ #category : #asserting }
MOModelStClassBuilder >> sharedPoolReferences: aCollection [

	sharedPoolReferences := aCollection
]
