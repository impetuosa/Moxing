Class {
	#name : #MOModelClassBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'name',
		'packageRefrence',
		'superclassReference'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #accessing }
MOModelClassBuilder >> addAttribute: anAttribute [

	self attributes add: anAttribute
]

{ #category : #building }
MOModelClassBuilder >> build [

	^ (self instantiate: MOClass)
		  name: name;
		  parent: self packageRefrence;
		  superclass: self superclassReference;
		  anchor: self packageRefrence candidate anchor / #class / name
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
			                     package: (self packageBuilder
					                      name: '<Default Package>';
					                      build);
			                     build ]
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
