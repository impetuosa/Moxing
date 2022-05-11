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

{ #category : #accessing }
MOAnnotationWriter >> arguments [
	^ writeBuilder arguments
]

{ #category : #generated }
MOAnnotationWriter >> arguments: aCollection [

	writeBuilder arguments: aCollection
]

{ #category : #accessing }
MOAnnotationWriter >> candidateAnchor: anUndefinedObject [

	
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

{ #category : #accessing }
MOAnnotationWriter >> selector: anUndefinedObject [ 
	 " nothing to do here "
]

{ #category : #accessing }
MOAnnotationWriter >> typeReference: aMOTypeReference [

	^ self annotationTypeReference: aMOTypeReference
]
