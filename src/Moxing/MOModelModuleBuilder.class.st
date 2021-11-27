Class {
	#name : #MOModelModuleBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'name',
		'superclassReference',
		'packageReference'
	],
	#category : #'Moxing-MicroBuilders'
}

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

{ #category : #accessing }
MOModelModuleBuilder >> packageReference [

	^ packageReference ifNil: [ 
		  packageReference := self packageReferenceBuilder
			                     package: (self packageBuilder
					                      name: '<Default Package>';
					                      build);
			                     build ]
]

{ #category : #'as yet unclassified' }
MOModelModuleBuilder >> packageReference: aMOPackageReference [

	packageReference := aMOPackageReference
]

{ #category : #'as yet unclassified' }
MOModelModuleBuilder >> privateBuild [

	^ (self instantiate: MOClass)
		  name: name;
		  parent: self packageReference;
		  anchor: self packageReference candidate anchor / #module / name
]
