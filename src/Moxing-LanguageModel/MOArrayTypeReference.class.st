Class {
	#name : #MOArrayTypeReference,
	#superclass : #Object,
	#instVars : [
		'innerType'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #'as yet unclassified' }
MOArrayTypeReference >> dependencies [
	^ innerType dependencies 
]

{ #category : #'as yet unclassified' }
MOArrayTypeReference >> innerType: aMOTypescriptTypeReference [ 
	innerType := aMOTypescriptTypeReference
]

{ #category : #'as yet unclassified' }
MOArrayTypeReference >> printOn: aStream [
	aStream nextPutAll: innerType name ; nextPutAll:'[]'
]
