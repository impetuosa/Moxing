Class {
	#name : #MOSharedPoolReference,
	#superclass : #MOReference,
	#category : #'Moxing-LanguageModel-References'
}

{ #category : #accessing }
MOSharedPoolReference >> acceptVisitor: aMOTypescriptCodeGenerator [

	^ aMOTypescriptCodeGenerator visitSharedPoolReference:  self
]

{ #category : #accessing }
MOSharedPoolReference >> printOn: aStream [

	aStream
		nextPutAll: '-(Pool)>';
		nextPutAll: self name
]

{ #category : #accessing }
MOSharedPoolReference >> refersToObjectsLike: aMOAttribute [

	^ aMOAttribute canBeReferredAsSharedPool
]
