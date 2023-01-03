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
MOAnnotationWriter >> accessAttribute: aString receiver: anExpressionBuildingBlock [

	^ builder attributeAccessBuilder
		  name: aString;
		  receiverReference:
			  (self writeUnregisteredExpression: anExpressionBuildingBlock);
		  build
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

{ #category : #writing }
MOAnnotationWriter >> initializeWriteBuilder [
	writeBuilder := builder annotationInstanceBuilder.
.
]

{ #category : #writing }
MOAnnotationWriter >> privateWriteToSurface: anEntity [
	surface  addAnnotationInstance: anEntity.

]

{ #category : #accessing }
MOAnnotationWriter >> refereeAnchor: anUndefinedObject [

	
]

{ #category : #accessing }
MOAnnotationWriter >> selector: anUndefinedObject [ 
	 " nothing to do here "
]

{ #category : #accessing }
MOAnnotationWriter >> typeReference: aMOTypeReference [

	^ self annotationTypeReference: aMOTypeReference
]
