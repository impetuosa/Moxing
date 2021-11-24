Class {
	#name : #MOModelPackageBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'name',
		'parentReference'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #accessing }
MOModelPackageBuilder >> build [

	^ (self instantiate: MOPackage)
		  name: name;
		  anchor: baseAnchor / #package / name;
		  parent: parentReference;
		  yourself
]

{ #category : #accessing }
MOModelPackageBuilder >> name: aName [

	name := aName
]

{ #category : #accessing }
MOModelPackageBuilder >> parent: aParent [

	self parentReference: (self packageReferenceBuilder
			 package: aParent;
			 build)
]

{ #category : #accessing }
MOModelPackageBuilder >> parentReference: aParentReference [
	parentReference := aParentReference 
]