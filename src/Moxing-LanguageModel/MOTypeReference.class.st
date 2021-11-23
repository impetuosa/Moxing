Class {
	#name : #MOTypeReference,
	#superclass : #MOLanguageObject,
	#instVars : [
		'type'
	],
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

{ #category : #accessing }
MOTypeReference >> type [
	^ type
]

{ #category : #accessing }
MOTypeReference >> type: aMOClass [ 
	type := aMOClass
]
