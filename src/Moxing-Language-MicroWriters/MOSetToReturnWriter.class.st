Class {
	#name : #MOSetToReturnWriter,
	#superclass : #MOReturnWriter,
	#category : #'Moxing-Language-MicroWriters'
}

{ #category : #visiting }
MOSetToReturnWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitReturnWriter: self 


]

{ #category : #initialization }
MOSetToReturnWriter >> initializeWriteBuilder [

	writeBuilder := builder setToReturnBuilder
]