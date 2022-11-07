Class {
	#name : #MOArtefactTypeReference,
	#superclass : #MOTypeReference,
	#instVars : [
		'#artefactReference => MOReferesSlot one'
	],
	#category : #'Moxing-LanguageModel-References'
}

{ #category : #accessing }
MOArtefactTypeReference >> artefactReference: anArtefactRef [

	artefactReference := anArtefactRef
]
