Class {
	#name : #MOLabelReference,
	#superclass : #MOReference,
	#category : #'Moxing-LanguageModel-References'
}

{ #category : #visiting }
MOLabelReference >> acceptVisitor: aVisitor [

	^ aVisitor visitLabelReference: self
]

{ #category : #visiting }
MOLabelReference >> isLabelledAs: aLabel [
 	 ^ self name = aLabel
]

{ #category : #visiting }
MOLabelReference >> printOn: aStream [

	aStream nextPutAll: 'Label: ' , self name
]

{ #category : #'as yet unclassified' }
MOLabelReference >> refersToObjectsLike: aFylgjaMissingCandidateStub [

	^ aFylgjaMissingCandidateStub canBeReferredAsLabel
]
