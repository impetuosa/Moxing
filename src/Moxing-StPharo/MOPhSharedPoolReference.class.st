Class {
	#name : #MOPhSharedPoolReference,
	#superclass : #MOReference,
	#category : #'Moxing-StPharo-Model'
}

{ #category : #accessing }
MOPhSharedPoolReference >> acceptVisitor: aMOTypescriptCodeGenerator [

	^ aMOTypescriptCodeGenerator visitSharedPoolReference:  self
]

{ #category : #accessing }
MOPhSharedPoolReference >> printOn: aStream [

	aStream
		nextPutAll: '-(Pool)>';
		nextPutAll: name
]

{ #category : #accessing }
MOPhSharedPoolReference >> refersToObjectsLike: aMOAttribute [

	^ aMOAttribute canBeReferredAsSharedPool
]
