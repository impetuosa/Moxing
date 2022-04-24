Class {
	#name : #MOLibrary,
	#superclass : #MOArtefact,
	#instVars : [
		'#invocables => MOContainmentSlot many',
		'#attributes => MOContainmentSlot many'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #visiting }
MOLibrary >> acceptVisitor: aVisitor [

	^ aVisitor visitLibrary: self
]

{ #category : #accessing }
MOLibrary >> attributes: aCollection [ 
	attributes := aCollection
]

{ #category : #accessing }
MOLibrary >> invocables: aCollection [ 
	invocables := aCollection
]
