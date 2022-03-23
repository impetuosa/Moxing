Class {
	#name : #MOQueryWriter,
	#superclass : #MOClassWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #initialization }
MOQueryWriter >> initializeWriteBuilder [
	writeBuilder := builder queryBuilder
]
