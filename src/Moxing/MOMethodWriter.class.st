Class {
	#name : #MOMethodWriter,
	#superclass : #MOFunctionWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #writing }
MOMethodWriter >> initializeWriteBuilder [

	writeBuilder := builder methodBuilder
]

{ #category : #writing }
MOMethodWriter >> privateSetAnchor: anEntity [ 
	anEntity anchor: surface anchor / #method / anEntity selector
]

{ #category : #writing }
MOMethodWriter >> privateWriteToSurface: anEntity [

	surface addMethod: anEntity.
	anEntity parent: surface.

]

{ #category : #writing }
MOMethodWriter >> selector: aSelector [
	super selector: aSelector
]
