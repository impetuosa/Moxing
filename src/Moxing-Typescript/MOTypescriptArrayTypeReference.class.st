Class {
	#name : #MOTypescriptArrayTypeReference,
	#superclass : #Object,
	#instVars : [
		'innerType'
	],
	#category : #'Moxing-Typescript-Model'
}

{ #category : #'as yet unclassified' }
MOTypescriptArrayTypeReference >> dependencies [
	^ innerType dependencies 
]

{ #category : #'as yet unclassified' }
MOTypescriptArrayTypeReference >> innerType: aMOTypescriptTypeReference [ 
	innerType := aMOTypescriptTypeReference
]

{ #category : #'as yet unclassified' }
MOTypescriptArrayTypeReference >> printOn: aStream [
	aStream nextPutAll: innerType name ; nextPutAll:'[]'
]
