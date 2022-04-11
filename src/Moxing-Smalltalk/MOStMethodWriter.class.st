Class {
	#name : #MOStMethodWriter,
	#superclass : #MOMethodWriter,
	#category : #'Moxing-Smalltalk-model'
}

{ #category : #accessing }
MOStMethodWriter >> category: aString [ 
	 writeBuilder category: aString 
]

{ #category : #initialization }
MOStMethodWriter >> initializeWriteBuilder [ 
	writeBuilder := builder stMethodBuilder
]
