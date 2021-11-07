Class {
	#name : #MOTypescriptTypeReference,
	#superclass : #MOTypescriptObject,
	#category : #'Moxing-Typescript-Model'
}

{ #category : #printing }
MOTypescriptTypeReference >> isDecorator [
	 ^ false 
]

{ #category : #printing }
MOTypescriptTypeReference >> printOn: aStream [
	aStream nextPutAll: name
]
