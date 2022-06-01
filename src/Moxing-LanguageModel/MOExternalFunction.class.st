Class {
	#name : #MOExternalFunction,
	#superclass : #MOFunction,
	#instVars : [
		'#librarySelector => MOPropertySlot',
		'#libraryName => MOPropertySlot'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #asserting }
MOExternalFunction >> canBeReferredAsMethod [

	^ parent isKindOf: MOClass
]

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
