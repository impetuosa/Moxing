Class {
	#name : #MOConstantAttributeWriter,
	#superclass : #MOAttributeWriter,
	#category : #'Moxing-Language-MicroWriters-Declarations'
}

{ #category : #visiting }
MOConstantAttributeWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitAttributeWriter: self 


]

{ #category : #initialization }
MOConstantAttributeWriter >> initializeWriteBuilder [

	writeBuilder := builder constantAttributeBuilder
]

{ #category : #initialization }
MOConstantAttributeWriter >> privateWriteToSurface: anEntity [
	surface addConstantAttribute: anEntity
]

{ #category : #initialization }
MOConstantAttributeWriter >> value: aValue [ 
	writeBuilder value: aValue 
]
