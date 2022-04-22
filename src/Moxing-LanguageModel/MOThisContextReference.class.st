Class {
	#name : #MOThisContextReference,
	#superclass : #MOTypedReference,
	#category : #'Moxing-LanguageModel-References'
}

{ #category : #accessing }
MOThisContextReference >> acceptVisitor: aVisitor [

	^ aVisitor visitThisContext: self
]

{ #category : #accessing }
MOThisContextReference >> refersToObjectsLike: aType [

	^ aType canbeReferredAsThisContext
]
