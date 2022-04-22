"
I am an annotation writer. I now how to write and annotation instances and add them on the context of usag 
"
Class {
	#name : #MOAnnotationWriter,
	#superclass : #MOModelProceduralWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #visiting }
MOAnnotationWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitAnnotationWriter: self 


]

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
	surface  addAnnotationInstance: anEntity.

]
