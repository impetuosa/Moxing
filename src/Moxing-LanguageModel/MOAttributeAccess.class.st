Class {
	#name : #MOAttributeAccess,
	#superclass : #MOTypedReference,
	#instVars : [
		'segments'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #private }
MOAttributeAccess >> name [
	^ segments last name 
]

{ #category : #private }
MOAttributeAccess >> segments: aCollection [

	segments := aCollection.
	segments first parent: self
]
