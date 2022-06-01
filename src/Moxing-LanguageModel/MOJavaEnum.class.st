Class {
	#name : #MOJavaEnum,
	#superclass : #MOClass,
	#instVars : [
		'#entries => MOContainmentSlot many'
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
