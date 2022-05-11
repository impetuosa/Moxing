Class {
	#name : #MOStructureWriter,
	#superclass : #MOPrimitiveTypeWriter,
	#instVars : [
		'visibility'
	],
	#category : #'Moxing-MicroWriters'
}

{ #category : #visiting }
MOStructureWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitStructureWriter: self 


]

{ #category : #adding }
MOStructureWriter >> addAttribute: aMOAttribute [ 
	writeBuilder addAttribute: aMOAttribute 
]

{ #category : #adding }
MOStructureWriter >> initializeWriteBuilder [
	writeBuilder := builder structureBuilder  
]

{ #category : #generated }
MOStructureWriter >> modifiers: aCollection [

	writeBuilder modifiers: aCollection
]

{ #category : #adding }
MOStructureWriter >> privateWriteToSurface: anEntity [
	surface addStructureType: anEntity
]

{ #category : #accessing }
MOStructureWriter >> visibility: aString [
	writeBuilder visibility: aString
]

{ #category : #writing }
MOStructureWriter >> writeAttribute: aBlock [
	^ self write: aBlock inSubWriter: MOAttributeWriter
]
