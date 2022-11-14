Class {
	#name : #MOJavaEnumWriter,
	#superclass : #MOJavaClassWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #initialization }
MOJavaEnumWriter >> addEnumEntry: aMOEnumEntry [ 
	writeBuilder addEnumEntry: aMOEnumEntry 
]

{ #category : #initialization }
MOJavaEnumWriter >> initializeWriteBuilder [

	writeBuilder := builder primitiveJavaEnumBuilder
]

{ #category : #initialization }
MOJavaEnumWriter >> privateWriteToSurface: anEntity [

	surface addJavaEnum: anEntity
]

{ #category : #writing }
MOJavaEnumWriter >> writeEntry: aBlock [
	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOEnumEntryWriter.
	^ stmnt
]
