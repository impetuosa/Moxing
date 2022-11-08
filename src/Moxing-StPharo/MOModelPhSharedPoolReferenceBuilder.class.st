Class {
	#name : #MOModelPhSharedPoolReferenceBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'candidate',
		'name',
		'candidateAnchor',
		'parent'
	],
	#category : #'Moxing-StPharo-Model'
}

{ #category : #'as yet unclassified' }
MOModelPhSharedPoolReferenceBuilder >> buildsType [

	<generated>
	^ MOSharedPoolReference
]

{ #category : #accessing }
MOModelPhSharedPoolReferenceBuilder >> candidate [
	^ candidate
]

{ #category : #accessing }
MOModelPhSharedPoolReferenceBuilder >> candidate: anObject [

	candidate := anObject
]

{ #category : #accessing }
MOModelPhSharedPoolReferenceBuilder >> candidateAnchor [
	^ candidateAnchor
]

{ #category : #accessing }
MOModelPhSharedPoolReferenceBuilder >> candidateAnchor: aMOAnchor [ 
	candidateAnchor := aMOAnchor
]

{ #category : #'as yet unclassified' }
MOModelPhSharedPoolReferenceBuilder >> loadBuilderWithEntity: anEntity [

	self candidateAnchor: anEntity candidateAnchor.
	self name: anEntity name.
	self candidate: anEntity candidate
]

{ #category : #accessing }
MOModelPhSharedPoolReferenceBuilder >> name [

	^ name ifNil: [ self error: ' Name is Nil! ' ]
]

{ #category : #accessing }
MOModelPhSharedPoolReferenceBuilder >> name: aString [ 
	name := aString 
]

{ #category : #accessing }
MOModelPhSharedPoolReferenceBuilder >> package: aPackage [

	self packageName: aPackage name.
	self candidateAnchor: aPackage anchor. 
	candidate := aPackage
]

{ #category : #accessing }
MOModelPhSharedPoolReferenceBuilder >> packageName: aName [ 
	name := aName
]

{ #category : #accessing }
MOModelPhSharedPoolReferenceBuilder >> parent [

	^ parent
]

{ #category : #accessing }
MOModelPhSharedPoolReferenceBuilder >> parent: anObject [

	parent := anObject
]

{ #category : #'as yet unclassified' }
MOModelPhSharedPoolReferenceBuilder >> privateBuild [

	^ self
		  findInModel: [ :a | 
		  (a isKindOf: MOSharedPoolReference) and: [ a name = self name ] ]
		  ifNone: [ 
			  (self instantiate: MOSharedPoolReference)
				  candidateAnchor: self candidateAnchor;
				  name: self name;
				  candidate: self candidate ]
]
