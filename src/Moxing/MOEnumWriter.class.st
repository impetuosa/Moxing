Class {
	#name : #MOEnumWriter,
	#superclass : #MOPrimitiveTypeWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #visiting }
MOEnumWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitEnumWriter: self 


]

{ #category : #adding }
MOEnumWriter >> addConstant: aMOConstant [
	writeBuilder  addEntry: aMOConstant
]

{ #category : #adding }
MOEnumWriter >> addEnumEntry: aMOEnumEntry [ 
	writeBuilder addEnumEntry: aMOEnumEntry 
]

{ #category : #adding }
MOEnumWriter >> addModifier: aString [

	writeBuilder addModifier: aString
]

{ #category : #writing }
MOEnumWriter >> initializeWriteBuilder [
	writeBuilder := builder primitiveEnumBuilder 
]

{ #category : #generated }
MOEnumWriter >> modifiers: aCollection [ 
	writeBuilder modifiers: aCollection 
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
MOEnumWriter >> writeEntry: aBlock [
	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOEnumEntryWriter.
	^ stmnt
]

{ #category : #writing }
MOEnumWriter >> writeLocalConstant: aFullBlockClosure [
	^ self writeEntry: aFullBlockClosure
]
