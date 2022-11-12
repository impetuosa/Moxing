Class {
	#name : #MOReference,
	#superclass : #MOExpression,
	#instVars : [
		'#referee => MORefereeSlot',
		'#refereeAnchor => MOPropertySlot',
		'#name => MOPropertySlot'
	],
	#category : #'Moxing-LanguageModel-References'
}

{ #category : #testing }
MOReference >> isReference [
	^ true
]

{ #category : #accessing }
MOReference >> isTypeReference [ 
	^ false
]

{ #category : #accessing }
MOReference >> name [

	^ name
]

{ #category : #accessing }
MOReference >> name: aName [
	name := aName 
]

{ #category : #accessing }
MOReference >> referee [
	^ referee
]

{ #category : #accessing }
MOReference >> referee: aMOPackage [

	referee := aMOPackage
]

{ #category : #accessing }
MOReference >> refereeAnchor: aCandidateAnchor [ 
	refereeAnchor := aCandidateAnchor
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
