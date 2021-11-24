Class {
	#name : #MOParameterWriter,
	#superclass : #MOVariableWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #writing }
MOParameterWriter >> initializeWriteBuilder [
	writeBuilder := builder parameterBuilder 
]

{ #category : #writing }
MOParameterWriter >> privateWriteToSurface: anEntity [

	surface addParameter: anEntity.
	anEntity parent: surface
]
