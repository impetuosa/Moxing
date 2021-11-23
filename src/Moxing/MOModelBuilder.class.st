Class {
	#name : #MOModelBuilder,
	#superclass : #Object,
	#instVars : [
		'model',
		'language'
	],
	#category : #Moxing
}

{ #category : #'instance creation' }
MOModelBuilder >> initialize [

	super initialize.
	model := MOModel new.
	model anchor: (MOAnchor on: #/)
]

{ #category : #'instance creation' }
MOModelBuilder >> instantiate: aLangClass [

	^ (model instantiate: aLangClass)
		  language: language;
		  yourself
]

{ #category : #accessing }
MOModelBuilder >> language: aMOLanguage [ 
	language := aMOLanguage
]

{ #category : #accessing }
MOModelBuilder >> model [
	^ model
]

{ #category : #'instance creation' }
MOModelBuilder >> newPackageNamed: aString [

	^ self
		  newPackageNamed: aString
		  anchored: model anchor
		  withParentReference: nil
]

{ #category : #'instance creation' }
MOModelBuilder >> newPackageNamed: aString anchored: anAnchor withParentReference: aRef [

	^ (self instantiate: MOPackage)
		  name: aString;
		  anchor: anAnchor / #package / aString;
		  parent: aRef;
		  yourself
]

{ #category : #'instance creation' }
MOModelBuilder >> newPackageNamed: aString withParent: aMOPackage [

	| reference new |
	aMOPackage subpackages
		detect: [ :p | p name = aString ]
		ifFound: [ :p | ^ p ].

	new := self
		       newPackageNamed: aString
		       anchored: aMOPackage anchor
		       withParentReference:
		       (self newPackageReferenceToPackage: aMOPackage).
	aMOPackage addPackage: new.
	^ new
]

{ #category : #'instance creation' }
MOModelBuilder >> newPackageReferenceToPackage: aMOPackage [

	| ref |
	ref := self instantiate: MOPackageReference.
	ref candidate: aMOPackage.
	^ ref
]
