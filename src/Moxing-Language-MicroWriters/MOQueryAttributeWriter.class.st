Class {
	#name : #MOQueryAttributeWriter,
	#superclass : #MOAttributeWriter,
	#category : #'Moxing-Language-MicroWriters-Declarations'
}

{ #category : #initialization }
MOQueryAttributeWriter >> initializeWriteBuilder [

	writeBuilder := builder queryAttributeBuilder
]

{ #category : #initialization }
MOQueryAttributeWriter >> reference: aRefe [
	writeBuilder reference: aRefe
]
