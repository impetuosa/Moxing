Class {
	#name : #MOAlceRedimVariable,
	#superclass : #MOAbstractVariable,
	#instVars : [
		'#redimText => MOPropertySlot',
		'#reference => MOReferenceSlot one'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MOAlceRedimVariable >> redimText: aString [ 
	redimText := aString
]

{ #category : #accessing }
MOAlceRedimVariable >> reference: aMOVariableReference [ 
	reference := aMOVariableReference
]
