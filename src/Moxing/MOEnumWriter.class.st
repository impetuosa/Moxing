Class {
	#name : #MOEnumWriter,
	#superclass : #MOPrimitiveTypeWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #adding }
MOEnumWriter >> addConstant: aMOConstant [
	writeBuilder  addEntry: aMOConstant
]

{ #category : #adding }
MOEnumWriter >> addEnumEntry: aMOEnumEntry [ 
	writeBuilder addEnumEntry: aMOEnumEntry 
]

{ #category : #writing }
MOEnumWriter >> initializeWriteBuilder [
	writeBuilder := builder primitiveEnumBuilder 
]

{ #category : #writing }
MOEnumWriter >> privateWriteToSurface: anEntity [
	surface addEnum: anEntity
]

{ #category : #accessing }
MOEnumWriter >> visibility: aString [ 
	writeBuilder visibility: aString 
]

{ #category : #writing }
MOEnumWriter >> writeConstant: aFullBlockClosure [
	^ self writeEntry: aFullBlockClosure
]

{ #category : #writing }
MOEnumWriter >> writeEntry: aBlock [
	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOEnumEntryWriter.
	^ stmnt
]
