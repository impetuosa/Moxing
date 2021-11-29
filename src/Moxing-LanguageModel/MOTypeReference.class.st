Class {
	#name : #MOTypeReference,
	#superclass : #MOTypedReference,
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #accessing }
MOTypeReference >> acceptVisitor: aMOJavaModelReader [

	^ aMOJavaModelReader visitTypeReference: self
]

{ #category : #accessing }
MOTypeReference >> fullName [

	^ (parent ifNotNil: [ :p | p name , '.' ] ifNil: [ '' ]) , name
]

{ #category : #printing }
MOTypeReference >> isDecorator [
	 ^ false 
]

{ #category : #accessing }
MOTypeReference >> isTypeReference [ 
	^ true 
]

{ #category : #printing }
MOTypeReference >> printOn: aStream [

	aStream
		nextPutAll: '->';
		nextPutAll: name
]

{ #category : #printing }
MOTypeReference >> type [ 
	^ candidate
]
