Class {
	#name : #MOAlceLabelReference,
	#superclass : #MOReference,
	#category : #'Moxing-LanguageModel-References'
}

{ #category : #visiting }
MOAlceLabelReference >> acceptVisitor: aVisitor [

	^ aVisitor visitLabelReference: self
]

{ #category : #visiting }
MOAlceLabelReference >> isLabelledAs: aLabel [
 	 ^ name = aLabel
]

{ #category : #visiting }
MOAlceLabelReference >> printOn: aStream [

	aStream nextPutAll: 'Label: ' , name
]

{ #category : #'as yet unclassified' }
MOAlceLabelReference >> refersToObjectsLike: aFylgjaMissingCandidateStub [

	^ aFylgjaMissingCandidateStub canBeReferredAsLabel
]
