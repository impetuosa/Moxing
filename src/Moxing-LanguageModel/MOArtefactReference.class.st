Class {
	#name : #MOArtefactReference,
	#superclass : #MOReference,
	#category : #'Moxing-LanguageModel-References'
}

{ #category : #accessing }
MOArtefactReference >> acceptVisitor: ads [

	^ ads visitArtefactReference: self
]

{ #category : #accessing }
MOArtefactReference >> refersToObjectsLike: aDeclarationObject [

	^ aDeclarationObject canBeReferredAsArtefact
]
