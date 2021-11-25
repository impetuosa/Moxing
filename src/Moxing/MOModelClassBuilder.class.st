Class {
	#name : #MOModelClassBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'name',
		'packageRefrence',
		'superclassReference',
		'superTypeReferences'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #accessing }
MOModelClassBuilder >> addAttribute: anAttribute [

	self attributes add: anAttribute
]

{ #category : #adding }
MOModelClassBuilder >> addSuperTypeReference: aMOTypeReference [

	self superTypeReferences add: aMOTypeReference
]

{ #category : #building }
MOModelClassBuilder >> build [

	^ (self instantiate: MOClass)
		  name: name;
		  parent: self packageRefrence;
		  superclass: self superclassReference;
		  supertypes:  self superTypeReferences;
		  yourself
]

{ #category : #accessing }
MOModelClassBuilder >> name: aString [

	name := aString
]

{ #category : #accessing }
MOModelClassBuilder >> package: aMOPackage [

	self packageReference: (self packageReferenceBuilder
			 package: aMOPackage;
			 build)
]

{ #category : #'as yet unclassified' }
MOModelClassBuilder >> packageReference: aMOPackageReference [

	packageRefrence := aMOPackageReference
]

{ #category : #accessing }
MOModelClassBuilder >> packageRefrence [

	^ packageRefrence ifNil: [ 
		  packageRefrence := self packageReferenceBuilder
			                     packageName: '<Default Package>';
			                     build ]
]

{ #category : #'as yet unclassified' }
MOModelClassBuilder >> superTypeReferences [

	^ superTypeReferences ifNil: [ 
		  superTypeReferences := OrderedCollection new ]
]

{ #category : #accessing }
MOModelClassBuilder >> superclass: aMOClass [

	self superclassReference: (self typeReferenceBuilder
			 type: aMOClass;
			 build)
]

{ #category : #accessing }
MOModelClassBuilder >> superclassReference [
	^ superclassReference
]

{ #category : #accessing }
MOModelClassBuilder >> superclassReference: aMOTypeReference [ 
	superclassReference := aMOTypeReference
]
