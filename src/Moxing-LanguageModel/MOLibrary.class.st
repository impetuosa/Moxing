Class {
	#name : #MOLibrary,
	#superclass : #MOArtefact,
	#instVars : [
		'#invocables => MODeclaresSlot many',
		'#attributes => MODeclaresSlot many'
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

{ #category : #accessing }
MOLibrary >> isDefinedInLibrary [

	^ true
]
