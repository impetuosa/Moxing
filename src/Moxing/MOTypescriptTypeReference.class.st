Class {
	#name : #MOTypescriptTypeReference,
	#superclass : #MOTypescriptObject,
	#category : #'Moxing-ModelTS'
}

{ #category : #printing }
MOTypescriptTypeReference >> isDecorator [
	 ^ false 
]

{ #category : #printing }
MOTypescriptTypeReference >> printOn: aStream [
	aStream nextPutAll: name
]
