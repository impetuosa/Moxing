Class {
	#name : #MOParameterWriter,
	#superclass : #MOVariableWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #writing }
MOParameterWriter >> initializeWriteBuilder [
	writeBuilder := builder parameterBuilder 
]

{ #category : #'as yet unclassified' }
MOParameterWriter >> mapsToVariableArguments [
	writeBuilder mapsToVariableArguments: true. 
]

{ #category : #writing }
MOParameterWriter >> privateSetAnchor: anEntity [ 
	anEntity anchor: surface anchor / #parameter / anEntity name
]

{ #category : #writing }
MOParameterWriter >> privateWriteToSurface: anEntity [

	surface setAsParentOf: anEntity.
	surface addParameter: anEntity
]
