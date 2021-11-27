Class {
	#name : #MOParametrizedTypeReference,
	#superclass : #MOTypeReference,
	#instVars : [
		'argumentTypeReferences'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #'as yet unclassified' }
MOParametrizedTypeReference >> argumentTypeReferences: aCollection [ 
	argumentTypeReferences := aCollection 
]

{ #category : #accessing }
MOParametrizedTypeReference >> fullName [

	^ '.' join: self accessChain
]

{ #category : #'as yet unclassified' }
MOParametrizedTypeReference >> isArrayReference [
	^ false 
]
