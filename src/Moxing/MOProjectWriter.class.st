Class {
	#name : #MOProjectWriter,
	#superclass : #MOArtefactWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #writing }
MOProjectWriter >> initializeWriteBuilder [

	writeBuilder := builder projectBuilder
]
