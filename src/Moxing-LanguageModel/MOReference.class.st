Class {
	#name : #MOReference,
	#superclass : #MOExpression,
	#instVars : [
		'#candidateAnchor => MOPropertySlot',
		'#referee => MORefereeSlot'
	],
	#category : #'Moxing-LanguageModel-References'
}

{ #category : #accessing }
MOReference >> candidate [
	^ referee
]

{ #category : #accessing }
MOReference >> candidate: aMOPackage [

	referee := aMOPackage
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
