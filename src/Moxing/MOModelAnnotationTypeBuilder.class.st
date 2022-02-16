"
I build annotation-types 
"
Class {
	#name : #MOModelAnnotationTypeBuilder,
	#superclass : #MOModelClassTypeBuilder,
	#category : #'Moxing-MicroBuilders'
}

{ #category : #'as yet unclassified' }
MOModelAnnotationTypeBuilder >> buildsType [
<generated>
	^MOAnnotationType
]

{ #category : #'as yet unclassified' }
MOModelAnnotationTypeBuilder >> privateBuild [

	^ (self instantiate: MOAnnotationType)
		  name: self name;
		  modifiers: self modifiers;
		  attributes: self attributes;
		  methods: self methods;
		  parent: self parent;
		  decorators: self decorators;
		  typeParameters: self typeParameters;
		  packageReference: self packageReference;
		  superTypeReferences: self superTypeReferences;
		  yourself
]
