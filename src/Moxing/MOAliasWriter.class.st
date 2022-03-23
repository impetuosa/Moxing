Class {
	#name : #MOAliasWriter,
	#superclass : #MOPrimitiveTypeWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #initialization }
MOAliasWriter >> initializeWriteBuilder [
	writeBuilder := builder aliasTypeBuilder 
]

{ #category : #initialization }
MOAliasWriter >> privateWriteToSurface: anEntity [
	surface addAliasType: anEntity
]
