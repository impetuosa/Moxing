Class {
	#name : #MOTypeReference,
	#superclass : #MOReference,
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #accessing }
MOTypeReference >> acceptVisitor: aMOJavaModelReader [

	^ aMOJavaModelReader visitTypeReference: self
]

{ #category : #printing }
MOTypeReference >> isDecorator [
	 ^ false 
]

{ #category : #printing }
MOTypeReference >> printOn: aStream [

	aStream
		nextPutAll: '->';
		nextPutAll: type name
]
