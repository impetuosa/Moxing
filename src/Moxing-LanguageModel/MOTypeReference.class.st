Class {
	#name : #MOTypeReference,
	#superclass : #MOTypedReference,
	#instVars : [
		'#packageReference => MOPropertySlot'
	],
	#category : #'Moxing-LanguageModel-References'
}

{ #category : #accessing }
MOTypeReference >> acceptVisitor: aMOJavaModelReader [

	^ aMOJavaModelReader visitTypeReference: self
]

{ #category : #accessing }
MOTypeReference >> dependencies [

	^ { candidate }
]

{ #category : #accessing }
MOTypeReference >> fullName [

	^ (packageReference  ifNotNil: [ :p | p name , '.' ] ifNil: [ '' ]) ,self  name
]

{ #category : #printing }
MOTypeReference >> isDecorator [
	 ^ false 
]

{ #category : #testing }
MOTypeReference >> isSolvable [

	^ (self name = '?') not
]

{ #category : #accessing }
MOTypeReference >> isTypeReference [ 
	^ true 
]

{ #category : #accessing }
MOTypeReference >> packageReference [
	^ packageReference
]

{ #category : #accessing }
MOTypeReference >> packageReference: aMOPackageReference [ 
	packageReference := aMOPackageReference
]

{ #category : #accessing }
MOTypeReference >> packageReferenceName [
	^ packageReference ifNotNil: [ :r | r name  ]
]

{ #category : #printing }
MOTypeReference >> printOn: aStream [

	aStream
		nextPutAll: '->';
		nextPutAll: self name
]

{ #category : #'as yet unclassified' }
MOTypeReference >> refersToObjectsLike: aMOClass [

	^ aMOClass canBeReferredAsType
]

{ #category : #printing }
MOTypeReference >> type [ 
	^ candidate
]
