Class {
	#name : #MOModelTypeParameterBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'name',
		'superTypeReferences',
		'packageRefrence'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #adding }
MOModelTypeParameterBuilder >> addSuperTypeReference: aMOTypeReference [

	self superTypeReferences add: aMOTypeReference
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
MOModelTypeParameterBuilder >> privateBuild [

	^ (self instantiate: MOTypeParameter)
		  name: self name;
		  parent: self packageReference; 
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
