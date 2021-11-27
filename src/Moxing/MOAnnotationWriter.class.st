Class {
	#name : #MOAnnotationWriter,
	#superclass : #MOModelProceduralWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #'as yet unclassified' }
MOAnnotationWriter >> annotationTypeReference: aMOTypeReference [

	writeBuilder annotationTypeReference: aMOTypeReference
]

{ #category : #generated }
MOAnnotationWriter >> arguments: aCollection [

	writeBuilder arguments: aCollection
]

{ #category : #writing }
MOAnnotationWriter >> initializeWriteBuilder [
	writeBuilder := builder annotationInstanceBuilder.
.
]

{ #category : #writing }
MOAnnotationWriter >> privateSetAnchor: anEntity [

	anEntity anchor: surface anchor / #annotationInstance / anEntity typeReference name
]

{ #category : #writing }
MOAnnotationWriter >> privateWriteToSurface: anEntity [

	surface setAsParentOf: anEntity.
	surface  addAnnotationInstance: anEntity.

]
