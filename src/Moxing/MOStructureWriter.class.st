Class {
	#name : #MOStructureWriter,
	#superclass : #MOPrimitiveTypeWriter,
	#instVars : [
		'visibility'
	],
	#category : #'Moxing-MicroWriters'
}

{ #category : #adding }
MOStructureWriter >> addAttribute: aMOAttribute [ 
	writeBuilder addAttribute: aMOAttribute 
]

{ #category : #adding }
MOStructureWriter >> initializeWriteBuilder [
	writeBuilder := builder structureBuilder  
]

{ #category : #adding }
MOStructureWriter >> privateWriteToSurface: anEntity [

	surface setAsParentOf: anEntity.
	surface addStructureType: anEntity
]

{ #category : #accessing }
MOStructureWriter >> visibility: aString [
writeBuilder visibility: aString
]

{ #category : #writing }
MOStructureWriter >> writeAttribute: aBlock [
	^ self preWrite: aBlock inSubWriter: MOAttributeWriter
]
