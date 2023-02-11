Class {
	#name : #MOJavaEnum,
	#superclass : #MOJavaClass,
	#instVars : [
		'#entries => MODeclaresSlot many'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MOJavaEnum >> entries [

	^ entries
]

{ #category : #accessing }
MOJavaEnum >> entries: aCollection [ 
	entries := aCollection
]
