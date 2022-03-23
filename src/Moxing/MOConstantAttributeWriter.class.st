Class {
	#name : #MOConstantAttributeWriter,
	#superclass : #MOAttributeWriter,
	#category : #'Moxing-MicroWriters'
}

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
