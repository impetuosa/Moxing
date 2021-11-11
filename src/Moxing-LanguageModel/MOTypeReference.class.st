Class {
	#name : #MOTypeReference,
	#superclass : #MOLanguageObject,
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #printing }
MOTypeReference >> isDecorator [
	 ^ false 
]

{ #category : #printing }
MOTypeReference >> printOn: aStream [
	aStream nextPutAll: name
]
