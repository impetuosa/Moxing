Class {
	#name : #MOTypeReference,
	#superclass : #MOTypedReference,
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
		nextPutAll: self name
]

{ #category : #printing }
MOTypeReference >> type [ 
	^ candidate
]
