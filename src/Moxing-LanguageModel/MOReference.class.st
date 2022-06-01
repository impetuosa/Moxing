Class {
	#name : #MOReference,
	#superclass : #MOExpression,
	#instVars : [
		'#candidate => MOCandidateSlot',
		'#candidateAnchor => MOPropertySlot'
	],
	#category : #'Moxing-LanguageModel-References'
}

{ #category : #accessing }
MOReference >> candidate [
	^ candidate
]

{ #category : #accessing }
MOReference >> candidate: aMOPackage [
	candidate := aMOPackage
]

{ #category : #accessing }
MOReference >> candidateAnchor: aCandidateAnchor [ 
	candidateAnchor := aCandidateAnchor
]

{ #category : #testing }
MOReference >> isReference [
	^ true
]

{ #category : #accessing }
MOReference >> isTypeReference [ 
	^ false
]

{ #category : #accessing }
MOReference >> name: aName [

	super name: aName
]

{ #category : #'as yet unclassified' }
MOReference >> refersToObjectsLike: aDeclarationObject [

	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
MOReference >> refersToObjectsLikeOrStonRef: aDeclarationObject [

	^ aDeclarationObject isStonReference or: [ 
		  self refersToObjectsLike: aDeclarationObject ]
]
