Class {
	#name : #MOTableWriter,
	#superclass : #MOClassWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #initialization }
MOTableWriter >> initializeWriteBuilder [
	writeBuilder := builder tableBuilder
]
