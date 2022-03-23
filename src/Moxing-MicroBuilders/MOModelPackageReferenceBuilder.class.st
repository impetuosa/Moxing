"
I build references to packages 
"
Class {
	#name : #MOModelPackageReferenceBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'candidate',
		'name',
		'candidateAnchor',
		'parent'
	],
	#category : #'Moxing-MicroBuilders-project'
}

{ #category : #'as yet unclassified' }
MOModelPackageReferenceBuilder >> buildsType [
<generated>
	^MOPackageReference
]

{ #category : #accessing }
MOModelPackageReferenceBuilder >> candidate [
	^ candidate
]

{ #category : #accessing }
MOModelPackageReferenceBuilder >> candidate: anObject [

	candidate := anObject
]

{ #category : #accessing }
MOModelPackageReferenceBuilder >> candidateAnchor [
	^ candidateAnchor
]

{ #category : #accessing }
MOModelPackageReferenceBuilder >> candidateAnchor: aMOAnchor [ 
	candidateAnchor := aMOAnchor
]

{ #category : #'as yet unclassified' }
MOModelPackageReferenceBuilder >> loadBuilderWithEntity: anEntity [

	self candidateAnchor: anEntity candidateAnchor.
	self name: anEntity name.
	self candidate: anEntity candidate
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

{ #category : #accessing }
MOModelPackageReferenceBuilder >> parent: anObject [

	parent := anObject
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
