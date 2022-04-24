Class {
	#name : #MOExternalProcedure,
	#superclass : #MOProcedure,
	#instVars : [
		'#librarySelector => MOPropertySlot',
		'#libraryName => MOPropertySlot'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MOExternalProcedure >> libraryName: aString [ 
	libraryName := aString
]

{ #category : #accessing }
MOExternalProcedure >> librarySelector: anUndefinedObject [ 
	librarySelector := anUndefinedObject
]

{ #category : #asserting }
MOExternalProcedure >> realSelector: anUndefinedObject [

	self librarySelector: anUndefinedObject
]
