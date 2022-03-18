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
MOTypeReference >> fullName [

	^ (packageReference  ifNotNil: [ :p | p name , '.' ] ifNil: [ '' ]) , name
]

{ #category : #printing }
MOTypeReference >> isDecorator [
	 ^ false 
]

{ #category : #testing }
MOTypeReference >> isSolvable [

	^ (name = '?') not
]

{ #category : #accessing }
MOTypeReference >> isTypeReference [ 
	^ true 
]

{ #category : #printing }
MOTypeReference >> name: aName [

	aName = #Boolean ifTrue: [ self halt ].
	super name: aName
]

{ #category : #accessing }
MOTypeReference >> packageReference [
	^ packageReference
]

{ #category : #accessing }
MOTypeReference >> packageReference: aMOPackageReference [ 
	packageReference := aMOPackageReference
]

{ #category : #printing }
MOTypeReference >> printOn: aStream [

	aStream
		nextPutAll: '->';
		nextPutAll: name
]

{ #category : #'as yet unclassified' }
MOTypeReference >> refersToObjectsLike: aMOClass [

	^ aMOClass canBeReferredAsType
]

{ #category : #printing }
MOTypeReference >> type [ 
	^ candidate
]
