Class {
	#name : #MOReference,
	#superclass : #MOExpression,
	#instVars : [
		'#candidate => MOPropertySlot',
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
