Class {
	#name : #MOClassWriter,
	#superclass : #MOClassTypeWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #initialization }
MOClassWriter >> initializeWriteBuilder [
	writeBuilder := builder classBuilder
]

{ #category : #writing }
MOClassWriter >> privateSetAnchor: anEntity [ 
	anEntity anchor: surface anchor / #class / anEntity name
]

{ #category : #writing }
MOClassWriter >> privateWriteToSurface: anEntity [

	surface setAsParentOf: anEntity.
	surface addClass: anEntity
]

{ #category : #writing }
MOClassWriter >> superclassReference: superClassReference [

	writeBuilder superclassReference: superClassReference
]
