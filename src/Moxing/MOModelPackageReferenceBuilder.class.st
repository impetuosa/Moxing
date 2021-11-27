Class {
	#name : #MOModelPackageReferenceBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'candidate',
		'name',
		'candidateAnchor',
		'parent'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #accessing }
MOModelPackageReferenceBuilder >> candidate [
	^ candidate
]

{ #category : #accessing }
MOModelPackageReferenceBuilder >> candidateAnchor [
	^ candidateAnchor
]

{ #category : #accessing }
MOModelPackageReferenceBuilder >> candidateAnchor: aMOAnchor [ 
	candidateAnchor := aMOAnchor
]

{ #category : #accessing }
MOModelPackageReferenceBuilder >> name [

	^ name ifNil: [ self error: ' Name is Nil! ' ]
]

{ #category : #accessing }
MOModelPackageReferenceBuilder >> package: aPackage [

	self packageName: aPackage name.
	self candidateAnchor: aPackage anchor. 
	candidate := aPackage
]

{ #category : #accessing }
MOModelPackageReferenceBuilder >> packageFullName: aString [

	| parts |
	parts := '.' split: aString.
	self packageName: parts removeLast. 
	parent := parts allButFirst
		inject: (self packageReferenceBuilder
				 packageName: parts first;
				 build)
		into: [ :prev :each | 
			(self packageReferenceBuilder
				 packageName: each;
				 build)
				parent: prev;
				yourself ]
]

{ #category : #accessing }
MOModelPackageReferenceBuilder >> packageName: aName [ 
	name := aName
]

{ #category : #accessing }
MOModelPackageReferenceBuilder >> parent [
	^ parent
]

{ #category : #'as yet unclassified' }
MOModelPackageReferenceBuilder >> privateBuild [

	^ (self instantiate: MOPackageReference)
		  parent: self parent;
		  candidateAnchor: self candidateAnchor;
		  name: self name;
		  candidate: self candidate
]
