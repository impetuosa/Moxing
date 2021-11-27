Class {
	#name : #MOArrayTypeReference,
	#superclass : #MOParametrizedTypeReference,
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #testing }
MOArrayTypeReference >> isArrayReference [
	^ true 
]

{ #category : #testing }
MOArrayTypeReference >> printOn: aStream [

	aStream nextPutAll: '->'.
	argumentTypeReferences printOn: aStream.
	aStream nextPutAll: '[]'
]
