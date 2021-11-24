Class {
	#name : #MOModelModuleBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'name',
		'packageRefrence',
		'superclassReference'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #building }
MOModelModuleBuilder >> build [

	^ (self instantiate: MOClass)
		  name: name;
		  parent: self packageRefrence;
		  superclass: self superclassReference;
		  anchor: self packageRefrence candidate anchor / #class / name
]

{ #category : #accessing }
MOModelModuleBuilder >> name: aString [

	name := aString
]

{ #category : #accessing }
MOModelModuleBuilder >> package: aMOPackage [

	self packageReference: (self packageReferenceBuilder
			 package: aMOPackage;
			 build)
]

{ #category : #'as yet unclassified' }
MOModelModuleBuilder >> packageReference: aMOPackageReference [

	packageRefrence := aMOPackageReference
]

{ #category : #accessing }
MOModelModuleBuilder >> packageRefrence [

	^ packageRefrence ifNil: [ 
		  packageRefrence := self packageReferenceBuilder
			                     package: (self packageBuilder
					                      name: '<Default Package>';
					                      build);
			                     build ]
]
