Class {
	#name : #MOFormWriter,
	#superclass : #MOClassWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #initialization }
MOFormWriter >> initializeWriteBuilder [
	writeBuilder := builder formBuilder
]
