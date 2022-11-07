Class {
	#name : #MOAlceResumeLabel,
	#superclass : #MOAlceResume,
	#instVars : [
		'#destinations => MORefersSlot many'
	],
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #visiting }
MOAlceResumeLabel >> acceptVisitor: aMOModelWriteTypeBasedCopyResolver [ 
	^ aMOModelWriteTypeBasedCopyResolver visitResumeLabel: self 
]

{ #category : #accessing }
MOAlceResumeLabel >> destinations [
	^ destinations
]

{ #category : #accessing }
MOAlceResumeLabel >> destinations: aCollection [ 
	destinations := aCollection
]
