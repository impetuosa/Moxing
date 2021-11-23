Class {
	#name : #MOReference,
	#superclass : #MOLanguageObject,
	#instVars : [
		'candidate'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #accessing }
MOReference >> candidate [
	^ candidate
]

{ #category : #accessing }
MOReference >> candidate: aMOPackage [ 
	candidate := aMOPackage
]
