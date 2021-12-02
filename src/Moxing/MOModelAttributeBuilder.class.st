Class {
	#name : #MOModelAttributeBuilder,
	#superclass : #MOModelVariableBuilder,
	#category : #'Moxing-MicroBuilders'
}

{ #category : #'as yet unclassified' }
MOModelAttributeBuilder >> privateBuild [

	^ (self instantiate: MOAttribute)
		  name: self name;
		  visibility: self visibility;
		  typeReference: self typeReference;
		  yourself
]
