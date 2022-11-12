"
I do allow to write a copy of a given entity. 
"
Class {
	#name : #MOCopyWriter,
	#superclass : #MOModelProceduralWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #visiting }
MOCopyWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitCopyWriter: self 


]

{ #category : #'as yet unclassified' }
MOCopyWriter >> initializeWriteBuilder [

	copyHelper := builder modelCopyHelper
]

{ #category : #'as yet unclassified' }
MOCopyWriter >> installCopyingBuilder [
	writeBuilder useAnchor: anchor
]
