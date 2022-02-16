Class {
	#name : #MOEnum,
	#superclass : #MOType,
	#instVars : [
		'#entries => MOContainmentSlot many'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MOEnum >> acceptVisitor: aMOModelWriteTypeBasedCopyResolver [

	^ aMOModelWriteTypeBasedCopyResolver visitEnum: self
]

{ #category : #accessing }
MOEnum >> entries [

	^ entries
]

{ #category : #accessing }
MOEnum >> entries: aCollection [ 
	entries := aCollection
]
