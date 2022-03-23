Class {
	#name : #MOSetToReturnWriter,
	#superclass : #MOReturnWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #initialization }
MOSetToReturnWriter >> initializeWriteBuilder [

	writeBuilder := builder setToReturnBuilder
]
