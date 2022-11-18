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
MOModelPhSharedPoolReferenceBuilder >> candidateAnchor [
	^ candidateAnchor
]

{ #category : #'as yet unclassified' }
MOModelPhSharedPoolReferenceBuilder >> loadBuilderWithEntity: anEntity [

	self refereeAnchor: anEntity candidateAnchor.
	self name: anEntity name.
	self referee: anEntity referee
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
	self refereeAnchor: aPackage anchor. 
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
				  refereeAnchor: self candidateAnchor;
				  name: self name;
				  referee: self referee ]
]

{ #category : #accessing }
MOModelPhSharedPoolReferenceBuilder >> referee [
	^ candidate
]

{ #category : #accessing }
MOModelPhSharedPoolReferenceBuilder >> referee: anObject [

	candidate := anObject
]

{ #category : #accessing }
MOModelPhSharedPoolReferenceBuilder >> refereeAnchor: aMOAnchor [ 
	candidateAnchor := aMOAnchor
]
