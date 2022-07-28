Class {
	#name : #MOQueryAttributeWriter,
	#superclass : #MOAttributeWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #initialization }
MOQueryAttributeWriter >> initializeWriteBuilder [

	writeBuilder := builder queryAttributeBuilder
]

{ #category : #initialization }
MOQueryAttributeWriter >> reference: aRefe [
	writeBuilder reference: aRefe
]
