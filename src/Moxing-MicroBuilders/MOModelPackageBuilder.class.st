"
I build packages 
"
Class {
	#name : #MOModelPackageBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'name',
		'declarationUnits',
		'types',
		'parent',
		'packageReference'
	],
	#category : #'Moxing-MicroBuilders-project'
}

{ #category : #adding }
MOModelPackageBuilder >> addClass: aMOClass [

	self addType: aMOClass
]

{ #category : #adding }
MOModelPackageBuilder >> addClassType: aMOClass [

	self addType: aMOClass
]

{ #category : #adding }
MOModelPackageBuilder >> addDeclarationUnit: aMODeclarationUnit [

	self declarationUnits add: aMODeclarationUnit
]

{ #category : #adding }
MOModelPackageBuilder >> addModule: aMOModule [

	self types add: aMOModule
]

{ #category : #adding }
MOModelPackageBuilder >> addPrimitiveType: aMOPrimitiveType [

	^ self addType: aMOPrimitiveType
]

{ #category : #adding }
MOModelPackageBuilder >> addType: aMOPrimitiveType [

	self assert:
		(self types noneSatisfy: [ :t | t name = aMOPrimitiveType name ]).
	self types add: aMOPrimitiveType
]

{ #category : #'as yet unclassified' }
MOModelPackageBuilder >> buildsType [
<generated>
	^MOPackage
]

{ #category : #'as yet unclassified' }
MOModelPackageBuilder >> computeAnchor [

	^ baseAnchor / #package / name
]

{ #category : #adding }
MOModelPackageBuilder >> declarationUnits [

	^ declarationUnits ifNil: [ 
		  declarationUnits := OrderedCollection new ]
]

{ #category : #accessing }
MOModelPackageBuilder >> declarationUnits: anObject [

	declarationUnits := anObject
]

{ #category : #accessing }
MOModelPackageBuilder >> fullName: aString [ 
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
MOModelPackageBuilder >> loadBuilderWithEntity: anEntity [

	self name: anEntity name.
	self declarationUnits: anEntity declarationUnits.
	self types: anEntity types.
	self packageReference: anEntity packageReference.
	self parent: anEntity parent
]

{ #category : #accessing }
MOModelPackageBuilder >> name [

	^ name ifNil: [ self error: 'Name is Nil' ]
]

{ #category : #accessing }
MOModelPackageBuilder >> name: aName [

	name := aName
]

{ #category : #accessing }
MOModelPackageBuilder >> packageReference [

	^ packageReference
]

{ #category : #accessing }
MOModelPackageBuilder >> packageReference: aParentReference [
	packageReference := aParentReference 
]

{ #category : #accessing }
MOModelPackageBuilder >> parent [

	^ parent
]

{ #category : #accessing }
MOModelPackageBuilder >> parent: aParent [

	parent := aParent.
	
]

{ #category : #'as yet unclassified' }
MOModelPackageBuilder >> privateBuild [

	| pack packRef |
	pack := (self instantiate: self buildsType)
		        name: self name;
		        declarationUnits: self declarationUnits;
		        types: self types;
		        packageReference: self packageReference;
		        parent: self parent;
		        yourself.
	packRef := self packageReferenceBuilder
		           package: pack;
		           build.
	self types , self declarationUnits do: [ :t | 
		(t respondsTo: #packageReference:) ifTrue: [ 
			t packageReference: packRef ] ].
	^ pack
]

{ #category : #adding }
MOModelPackageBuilder >> types [

	^ types ifNil: [ types := OrderedCollection new ]
]

{ #category : #accessing }
MOModelPackageBuilder >> types: anObject [

	types := anObject
]
