Class {
	#name : #MOArrayTypeReference,
	#superclass : #MOParametrizedTypeReference,
	#category : #'Moxing-LanguageModel-References'
}

{ #category : #testing }
MOArrayTypeReference >> acceptVisitor: aMOJavaModelReader [

	^ aMOJavaModelReader visitArrayTypeReference: self
]

{ #category : #testing }
MOArrayTypeReference >> fullName [

	| conf |
	conf := argumentTypeReferences collect: [ :t | t fullName ].
	conf := ',' join: conf.
	^ conf , '[]'
]

{ #category : #testing }
MOArrayTypeReference >> isArrayReference [
	^ true 
]

{ #category : #testing }
MOArrayTypeReference >> name [

	self assert: argumentTypeReferences size = 1.
	^ argumentTypeReferences first name , '[]'
]

{ #category : #testing }
MOArrayTypeReference >> printOn: aStream [

	aStream nextPutAll: '->'.
	argumentTypeReferences printOn: aStream.
	aStream nextPutAll: '[]'
]
