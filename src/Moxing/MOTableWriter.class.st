Class {
	#name : #MOTableWriter,
	#superclass : #MOClassWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #visiting }
MOTableWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitTableWriter: self 


]

{ #category : #initialization }
MOTableWriter >> initializeWriteBuilder [
	writeBuilder := builder tableBuilder
]
