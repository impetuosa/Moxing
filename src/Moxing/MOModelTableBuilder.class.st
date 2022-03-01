Class {
	#name : #MOModelTableBuilder,
	#superclass : #MOModelClassBuilder,
	#category : #'Moxing-MicroBuilders'
}

{ #category : #accessing }
MOModelTableBuilder >> privateBuild [

	^ (self instantiate: MOAlceTable)
		  name: self name;
		  modifiers: self modifiers;
		  visibility: self visibility;
		  attributes: self attributes;
		  methods: self methods;
		  parent: self parent;
		  decorators: self decorators;
		  typeParameters: self typeParameters;
		  packageReference: self packageReference;
		  superclassReference: self superclassReference;
		  superTypeReferences: self superTypeReferences;
		  yourself
]
