Class {
	#name : #MOPrimitiveTypeWriter,
	#superclass : #MOModelProceduralWriter,
	#traits : 'MOHoldsTypeReferences',
	#classTraits : 'MOHoldsTypeReferences classTrait',
	#category : #'Moxing-Language-MicroWriters-Declarations'
}

{ #category : #visiting }
MOPrimitiveTypeWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitTypeWriter: self 


]

{ #category : #writing }
MOPrimitiveTypeWriter >> initializeWriteBuilder [
	writeBuilder := builder primitiveTypeBuilder 
]

{ #category : #writing }
MOPrimitiveTypeWriter >> name: aName [
	writeBuilder name: aName
]

{ #category : #writing }
MOPrimitiveTypeWriter >> privateWriteToSurface: anEntity [
	surface addPrimitiveType: anEntity
]

{ #category : #writing }
MOPrimitiveTypeWriter >> typeReference: aTypeReference [
	 writeBuilder typeReference: aTypeReference
]
