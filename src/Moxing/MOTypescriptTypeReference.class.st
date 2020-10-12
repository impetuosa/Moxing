Class {
	#name : #MOTypescriptTypeReference,
	#superclass : #MOTypescriptObject,
	#category : #'Moxing-ModelTS'
}

{ #category : #printing }
MOTypescriptTypeReference >> printOn: aStream [
	aStream
		nextPutAll: 'TRef:';
		nextPutAll: name
]
