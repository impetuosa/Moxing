"
I do allow to write a copy of a given entity. 
"
Class {
	#name : #MOCopyWriter,
	#superclass : #MOModelProceduralWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #'as yet unclassified' }
MOCopyWriter >> initializeWriteBuilder [

	copyHelper := builder modelCopyHelper
]

{ #category : #'as yet unclassified' }
MOCopyWriter >> installCopyingBuilder [
	writeBuilder useAnchor: anchor
]

{ #category : #writing }
MOCopyWriter >> privateSetAnchor: aMOVariableReference [ 
	aMOVariableReference anchor: writeBuilder anchor
]