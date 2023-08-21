Class {
	#name : #MOModelOOTypeBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'name',
		'superTypeReferences',
		'packageRefrence',
		'parent',
		'visibility'
	],
	#category : #'Moxing-Language-MicroBuilders-Types'
}

{ #category : #adding }
MOModelOOTypeBuilder >> addSuperTypeReference: aMOTypeReference [

	self superTypeReferences add: aMOTypeReference
]

{ #category : #'as yet unclassified' }
MOModelOOTypeBuilder >> buildsType [

	<generated>
	^ MOTypeParameter
]

{ #category : #'as yet unclassified' }
MOModelOOTypeBuilder >> declarationUnit: aMODeclarationUnit [
 
	parent := aMODeclarationUnit
]

{ #category : #accessing }
MOModelOOTypeBuilder >> fullName: aString [

	| parts packageName |
	parts := '.' split: aString.

	self name: parts removeLast.
	packageName := '.' join: parts.

	self packageReference: (self packageReferenceBuilder
			 packageName: packageName;
			 build)
]

{ #category : #'as yet unclassified' }
MOModelOOTypeBuilder >> loadBuilderWithEntity: anEntity [

	self name: anEntity name.
	self parent: anEntity parent.
	self packageReference: anEntity packageReference.
	self superTypeReferences: anEntity superTypeReferences.
	self visibility: anEntity visibility
]

{ #category : #accessing }
MOModelOOTypeBuilder >> name [
	^ name ifNil: [  self error: ' NAme is Nil! ' ]
]

{ #category : #accessing }
MOModelOOTypeBuilder >> name: aString [

	name := aString
]

{ #category : #'as yet unclassified' }
MOModelOOTypeBuilder >> package: aMOPackage [

	parent := aMOPackage.
	self packageReference: (self packageReferenceBuilder
			 package: aMOPackage;
			 build)
]

{ #category : #accessing }
MOModelOOTypeBuilder >> packageReference [

	^ packageRefrence 
]

{ #category : #'as yet unclassified' }
MOModelOOTypeBuilder >> packageReference: aMOPackageReference [

	packageRefrence := aMOPackageReference
]

{ #category : #'as yet unclassified' }
MOModelOOTypeBuilder >> parent [
 	^ parent
]

{ #category : #'as yet unclassified' }
MOModelOOTypeBuilder >> parent: aParent [ 
	 parent := aParent 
]

{ #category : #'as yet unclassified' }
MOModelOOTypeBuilder >> privateBuild [

	^ (self instantiate: self buildsType)
		  name: self name;
		  parent: self parent;
		  visibility: self visibility;
		  packageReference: self packageReference;
		  superTypeReferences: self superTypeReferences;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelOOTypeBuilder >> superTypeReferences [

	^ superTypeReferences ifNil: [ 
		  superTypeReferences := OrderedCollection new ]
]

{ #category : #accessing }
MOModelOOTypeBuilder >> superTypeReferences: aCollection [

	superTypeReferences := aCollection
]

{ #category : #'as yet unclassified' }
MOModelOOTypeBuilder >> visibility [

	^ visibility ifNil: [ #default ]
]

{ #category : #'\\' }
MOModelOOTypeBuilder >> visibility: aString [ 
	visibility := aString 
]
