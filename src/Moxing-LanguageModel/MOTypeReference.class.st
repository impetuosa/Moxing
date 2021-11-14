Class {
	#name : #MOTypeReference,
	#superclass : #MOLanguageObject,
	#instVars : [
		'type'
	],
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

{ #category : #accessing }
MOTypeReference >> type: aMOClass [ 
	type := aMOClass
]
