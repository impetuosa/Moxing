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
MOModelPackageReferenceBuilder >> packageName: aName [ 
	name := aName
]

{ #category : #accessing }
MOModelPackageReferenceBuilder >> parent [
	^ parent
]

{ #category : #'as yet unclassified' }
MOModelPackageReferenceBuilder >> privateBuild [

	^ self
		  findInModel: [ :a | 
		  (a isKindOf: MOPackageReference) and: [ a name = self name ] ]
		  ifNone: [ 
			  (self instantiate: MOPackageReference)
				  candidateAnchor: self candidateAnchor;
				  name: self name;
				  candidate: self candidate ]
]
