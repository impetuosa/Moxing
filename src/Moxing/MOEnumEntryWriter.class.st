Class {
	#name : #MOEnumEntryWriter,
	#superclass : #MOLocalConstantWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #initialization }
MOEnumEntryWriter >> initializeWriteBuilder [

	writeBuilder := builder enumEntryBuilder
]

{ #category : #initialization }
MOEnumEntryWriter >> privateWriteToSurface: anEntity [
	surface addEnumEntry: anEntity
]
