Class {
	#name : #MOPrimitiveTypeWriter,
	#superclass : #MOModelProceduralWriter,
	#traits : 'MOHoldsTypeReferences',
	#classTraits : 'MOHoldsTypeReferences classTrait',
	#category : #'Moxing-MicroWriters'
}

{ #category : #writing }
MOPrimitiveTypeWriter >> initializeWriteBuilder [
	writeBuilder := builder primitiveTypeBuilder 
]

{ #category : #writing }
MOPrimitiveTypeWriter >> name: aName [
	writeBuilder name: aName
]

{ #category : #initialization }
MOPrimitiveTypeWriter >> privateSetAnchor: anEntity [ 
	anEntity anchor: surface anchor / #type / anEntity name
]

{ #category : #writing }
MOPrimitiveTypeWriter >> privateWriteToSurface: anEntity [

	surface setAsParentOf: anEntity.
	surface addPrimitiveType: anEntity
]
