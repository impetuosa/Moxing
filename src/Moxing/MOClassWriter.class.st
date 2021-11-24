Class {
	#name : #MOClassWriter,
	#superclass : #MOModelProceduralWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #writing }
MOClassWriter >> initializeWriteBuilder [
	writeBuilder := builder classBuilder
]

{ #category : #writing }
MOClassWriter >> name: aName [
	writeBuilder name: aName 
]

{ #category : #writing }
MOClassWriter >> privateWriteToSurface: anEntity [
	surface addClass: anEntity.
	anEntity parent: surface. 
]

{ #category : #writing }
MOClassWriter >> superclassReference: superClassReference [

	writeBuilder superclassReference: superClassReference
]

{ #category : #writing }
MOClassWriter >> writeAttribute: aBlock [
	^ self preWrite: aBlock inSubWriter: MOAttributeWriter
]

{ #category : #writing }
MOClassWriter >> writeMethod: aBlock [
	^ self preWrite: aBlock inSubWriter: MOMethodWriter
]
