Class {
	#name : #MOArtefactTypeReference,
	#superclass : #MOTypeReference,
	#instVars : [
		'#artefactReference => MOReferenceSlot one'
	],
	#category : #'Moxing-LanguageModel-References'
}

{ #category : #accessing }
MOArtefactTypeReference >> artefactReference: anArtefactRef [

	artefactReference := anArtefactRef
]
