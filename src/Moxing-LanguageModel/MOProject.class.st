Class {
	#name : #MOProject,
	#superclass : #MOArtefact,
	#instVars : [
		'#dependencies => MOReferesSlot many'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MOProject >> acceptVisitor: aVisitor [

	^ aVisitor visitProject: self
]

{ #category : #accessing }
MOProject >> dependencies: aCollection [

	dependencies := aCollection
]
