"
I build typeParameters like generics or templates 
"
Class {
	#name : #MOModelTypeParameterBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'name',
		'superTypeReferences',
		'packageRefrence',
		'parent',
		'visibility'
	],
	#category : #'Moxing-MicroBuilders-types'
}

{ #category : #adding }
MOModelTypeParameterBuilder >> addSuperTypeReference: aMOTypeReference [

	self superTypeReferences add: aMOTypeReference
]

{ #category : #'as yet unclassified' }
MOModelTypeParameterBuilder >> buildsType [

	<generated>
	^ MOTypeParameter
]

{ #category : #accessing }
MOModelTypeParameterBuilder >> fullName: aString [

	| parts packageName |
	parts := '.' split: aString.

	self name: parts removeLast.
	packageName := '.' join: parts.

	self packageReference: (self packageReferenceBuilder
			 packageName: packageName;
			 build)
]

{ #category : #'as yet unclassified' }
MOModelTypeParameterBuilder >> loadBuilderWithEntity: anEntity [

	self name: anEntity name.
	self parent: anEntity parent.
	self packageReference: anEntity packageReference.
	self superTypeReferences: anEntity superTypeReferences
]

{ #category : #accessing }
MOModelTypeParameterBuilder >> name [
	^ name ifNil: [  self error: ' NAme is Nil! ' ]
]

{ #category : #accessing }
MOModelTypeParameterBuilder >> name: aString [

	name := aString
]

{ #category : #'as yet unclassified' }
MOModelTypeParameterBuilder >> package: aMOPackage [

	parent := aMOPackage.
	self packageReference: (self packageReferenceBuilder
			 package: aMOPackage;
			 build)
]

{ #category : #accessing }
MOModelTypeParameterBuilder >> packageReference [

	^ packageRefrence 
]

{ #category : #'as yet unclassified' }
MOModelTypeParameterBuilder >> packageReference: aMOPackageReference [

	packageRefrence := aMOPackageReference
]

{ #category : #'as yet unclassified' }
MOModelTypeParameterBuilder >> parent [
 	^ parent
]

{ #category : #'as yet unclassified' }
MOModelTypeParameterBuilder >> parent: aParent [ 
	 parent := aParent 
]

{ #category : #'as yet unclassified' }
MOModelTypeParameterBuilder >> privateBuild [

	^ (self instantiate: MOTypeParameter)
		  name: self name;
		  parent: self parent;
		  visibility: self visibility; 
		  packageReference: self packageReference; 
		  superTypeReferences: self superTypeReferences;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelTypeParameterBuilder >> superTypeReferences [

	^ superTypeReferences ifNil: [ 
		  superTypeReferences := OrderedCollection new ]
]

{ #category : #accessing }
MOModelTypeParameterBuilder >> superTypeReferences: aCollection [

	superTypeReferences := aCollection
]

{ #category : #'as yet unclassified' }
MOModelTypeParameterBuilder >> visibility [

	^ visibility ifNil: [ #default ]
]

{ #category : #'\\' }
MOModelTypeParameterBuilder >> visibility: aString [ 
	visibility := aString 
]
