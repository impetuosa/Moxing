Class {
	#name : #MOModelPackageReferenceBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'candidate',
		'name',
		'candidateAnchor'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #accessing }
MOModelPackageReferenceBuilder >> build [

	^ (self instantiate: MOPackageReference)
		  candidateAnchor: candidateAnchor;
		  name: name;
		  candidate: candidate
]

{ #category : #accessing }
MOModelPackageReferenceBuilder >> candidateAnchor: aMOAnchor [ 
	candidateAnchor := aMOAnchor
]

{ #category : #accessing }
MOModelPackageReferenceBuilder >> package: aPackage [

	self packageName: aPackage name.
	self candidateAnchor: aPackage anchor. 
	candidate := aPackage
]

{ #category : #accessing }
MOModelPackageReferenceBuilder >> packageName: aName [ 
	name := aName
]
