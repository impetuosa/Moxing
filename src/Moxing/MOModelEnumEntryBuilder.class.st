Class {
	#name : #MOModelEnumEntryBuilder,
	#superclass : #MOModelConstantBuilder,
	#category : #'Moxing-MicroBuilders'
}

{ #category : #asserting }
MOModelEnumEntryBuilder >> buildsType [

	<generated>
	^ MOEnumEntry 
]

{ #category : #asserting }
MOModelEnumEntryBuilder >> privateBuild [

	^ (self instantiate: MOEnumEntry)
		  name: self name;
		  bindingKind: self bindingKind;
		  modifiers: self modifiers;
		  initializer: self initializer;
		  visibility: self visibility;
		  typeReference: self typeReference;
		  annotationInstances: self annotationInstances;
		  value: self value;
		  yourself
]
