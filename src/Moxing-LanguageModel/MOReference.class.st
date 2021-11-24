Class {
	#name : #MOReference,
	#superclass : #MOLanguageObject,
	#instVars : [
		'candidate',
		'candidateAnchor'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #adding }
MOReference >> addVariableReference: aMOVariableReference [ 
	" Nothing to do "
]

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
