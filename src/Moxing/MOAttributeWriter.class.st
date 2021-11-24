Class {
	#name : #MOAttributeWriter,
	#superclass : #MOVariableWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #writing }
MOAttributeWriter >> initializeWriteBuilder [

	writeBuilder := builder attributeBuilder
]

{ #category : #writing }
MOAttributeWriter >> privateWriteToSurface: anEntity [

	surface addAttribute: anEntity.
	anEntity parent: surface
]
