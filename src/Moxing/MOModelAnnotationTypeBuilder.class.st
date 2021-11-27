Class {
	#name : #MOModelAnnotationTypeBuilder,
	#superclass : #MOModelClassTypeBuilder,
	#category : #'Moxing-MicroBuilders'
}

{ #category : #'as yet unclassified' }
MOModelAnnotationTypeBuilder >> privateBuild [

	^ (self instantiate: MOAnnotationType)
		  name: self name;
		  parent: self parent; 
		  modifiers: self modifiers;
		  imports: self imports;
		  parent: self packageReference;
		  superTypeReferences: self superTypeReferences;
		  yourself
]
