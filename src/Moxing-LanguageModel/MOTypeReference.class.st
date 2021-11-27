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
MOTypeReference >> candidate: aCandidate [

	(aCandidate isKindOf: MOModelLinker) ifTrue: [ self halt ].
	super candidate: aCandidate
]

{ #category : #accessing }
MOTypeReference >> fullName [

	^ '.' join: self accessChain
]

{ #category : #printing }
MOTypeReference >> isDecorator [
	 ^ false 
]

{ #category : #printing }
MOTypeReference >> name: aName [

	(aName isKindOf: String) ifFalse: [ self halt ].
	super name: aName
]

{ #category : #printing }
MOTypeReference >> printOn: aStream [

	parent printOn: aStream.
	aStream
		nextPutAll: '.';
		nextPutAll: name
]

{ #category : #printing }
MOTypeReference >> type [ 
	^ candidate
]
