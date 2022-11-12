Class {
	#name : #MONamedDeclaration,
	#superclass : #MODeclaration,
	#instVars : [
		'#name => MOPropertySlot'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MONamedDeclaration >> name [

	^ name
]

{ #category : #accessing }
MONamedDeclaration >> name: anObject [

	name := anObject
]
