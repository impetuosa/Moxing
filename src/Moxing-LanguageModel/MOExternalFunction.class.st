Class {
	#name : #MOExternalFunction,
	#superclass : #MOFunction,
	#instVars : [
		'#librarySelector => MOPropertySlot',
		'#libraryName => MOPropertySlot'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MOExternalFunction >> libraryName: aString [ 
	libraryName := aString
]

{ #category : #accessing }
MOExternalFunction >> librarySelector: anUndefinedObject [ 
	librarySelector := anUndefinedObject
]

{ #category : #asserting }
MOExternalFunction >> realSelector: anUndefinedObject [

	self librarySelector: anUndefinedObject
]
