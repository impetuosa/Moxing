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
MOModelPackageReferenceBuilder >> candidateAnchor [
	^ candidateAnchor
]

{ #category : #'as yet unclassified' }
MOModelPackageReferenceBuilder >> loadBuilderWithEntity: anEntity [

	self refereeAnchor: anEntity candidateAnchor.
	self name: anEntity name.
	self referee: anEntity referee
]

{ #category : #accessing }
MOModelPackageReferenceBuilder >> name [

	^ name ifNil: [ self error: ' Name is Nil! ' ]
]

{ #category : #accessing }
MOModelPackageReferenceBuilder >> package: aPackage [

	self packageName: aPackage name.
	self refereeAnchor: aPackage anchor. 
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
				  refereeAnchor: self candidateAnchor;
				  name: self name;
				  referee: self referee ]
]

{ #category : #accessing }
MOModelPackageReferenceBuilder >> referee [
	^ candidate
]

{ #category : #accessing }
MOModelPackageReferenceBuilder >> referee: anObject [

	candidate := anObject
]

{ #category : #accessing }
MOModelPackageReferenceBuilder >> refereeAnchor: aMOAnchor [ 
	candidateAnchor := aMOAnchor
]
