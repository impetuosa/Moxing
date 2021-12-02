Class {
	#name : #MOModelClassBuilder,
	#superclass : #MOModelClassTypeBuilder,
	#instVars : [
		'superclassReference'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #'as yet unclassified' }
MOModelClassBuilder >> privateBuild [

	^ (self instantiate: MOClass)
		  name: self name;
		  modifiers: self modifiers;
		  imports: self imports;
		  parent: self packageReference;
		  superclassReference: self superclassReference;
		  superTypeReferences: self superTypeReferences;
		  yourself
]

{ #category : #accessing }
MOModelClassBuilder >> superclass: aMOClass [

	self superclassReference: (self typeReferenceBuilder
			 type: aMOClass;
			 build)
]

{ #category : #accessing }
MOModelClassBuilder >> superclassReference [
	^ superclassReference
]

{ #category : #accessing }
MOModelClassBuilder >> superclassReference: aMOTypeReference [ 
	superclassReference := aMOTypeReference
]
