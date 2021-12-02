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
MOModelPackageBuilder >> fullName: aString [ 
	self shouldBeImplemented.
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
MOModelPackageBuilder >> parent: aParent [

	self parentReference: (self packageReferenceBuilder
			 package: aParent;
			 build)
]

{ #category : #accessing }
MOModelPackageBuilder >> parentReference: aParentReference [
	parentReference := aParentReference 
]

{ #category : #'as yet unclassified' }
MOModelPackageBuilder >> privateBuild [

	^ (self instantiate: MOPackage)
		  name: self name;
		  anchor: baseAnchor / #package / name;
		  parent: parentReference;
		  yourself
]
