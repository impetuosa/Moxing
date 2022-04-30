Class {
	#name : #MOTableWriter,
	#superclass : #MOClassWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #visiting }
MOTableWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitTableWriter: self 


]

{ #category : #accessing }
MOTableWriter >> attributes [
	^ writeBuilder attributes 
]

{ #category : #initialization }
MOTableWriter >> indexes: someIndexSet [
	writeBuilder indexes: someIndexSet 
]

{ #category : #initialization }
MOTableWriter >> initializeWriteBuilder [
	writeBuilder := builder tableBuilder
]
