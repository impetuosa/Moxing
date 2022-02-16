"
i build annotation instantiations 
"
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
MOModelAnnotationInstanceBuilder >> bindingConfiguration [

	"On the left the attribute names for MOAnnotationInstance. On the right the attribute names for this builder. "

	<generated>
	^ { 
		  { #typeReference. #typeReference }.
		  { #arguments. #arguments } }
]

{ #category : #'as yet unclassified' }
MOModelAnnotationInstanceBuilder >> buildsType [
<generated>
	^MOAnnotationInstance
]

{ #category : #'as yet unclassified' }
MOModelAnnotationInstanceBuilder >> loadBuilderWithEntity: anEntity [ 
	self typeReference: anEntity typeReference. 
 self arguments: anEntity arguments. 
 
	
]

{ #category : #'as yet unclassified' }
MOModelAnnotationInstanceBuilder >> privateBuild [

	^ (self instantiate: MOAnnotationInstance)
		  typeReference: self typeReference;
		  arguments: self arguments;
		  yourself
]
