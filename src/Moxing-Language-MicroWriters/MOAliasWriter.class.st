Class {
	#name : #MOAliasWriter,
	#superclass : #MOPrimitiveTypeWriter,
	#category : #'Moxing-Language-MicroWriters'
}

{ #category : #visiting }
MOAliasWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitAliasWriter: self 


]

{ #category : #initialization }
MOAliasWriter >> initializeWriteBuilder [
	writeBuilder := builder aliasTypeBuilder 
]

{ #category : #initialization }
MOAliasWriter >> privateWriteToSurface: anEntity [
	surface addAliasType: anEntity
]
