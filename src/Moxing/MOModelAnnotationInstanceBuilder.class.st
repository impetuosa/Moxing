Class {
	#name : #MOModelAnnotationInstanceBuilder,
	#superclass : #MOModelNewExpressionBuilder,
	#category : #'Moxing-MicroBuilders'
}

{ #category : #'as yet unclassified' }
MOModelAnnotationInstanceBuilder >> annotationTypeReference: aMOTypeReference [

	self typeReference: aMOTypeReference
]

{ #category : #'as yet unclassified' }
MOModelAnnotationInstanceBuilder >> privateBuild [

	^ (self instantiate: MOAnnotationInstance)
		  typeReference: self typeReference;
		  arguments: self arguments;
		  yourself
]
