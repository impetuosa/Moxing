Class {
	#name : #MOEnumEntryWriter,
	#superclass : #MOLocalConstantWriter,
	#category : #'Moxing-Language-MicroWriters'
}

{ #category : #visiting }
MOEnumEntryWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitEntryWriter: self 


]

{ #category : #initialization }
MOEnumEntryWriter >> initializeWriteBuilder [

	writeBuilder := builder enumEntryBuilder
]

{ #category : #initialization }
MOEnumEntryWriter >> privateWriteToSurface: anEntity [
	surface addEnumEntry: anEntity
]
