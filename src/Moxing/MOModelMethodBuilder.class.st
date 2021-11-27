Class {
	#name : #MOModelMethodBuilder,
	#superclass : #MOModelFunctionBuilder,
	#category : #'Moxing-MicroBuilders'
}

{ #category : #'as yet unclassified' }
MOModelMethodBuilder >> privateBuild [

	^ (self instantiate: MOMethod)
		  thrownTypeReferences: self thrownTypeReferences;
		  visibility: self visibility;
		  selector: self selector;
		  modifiers: self modifiers;
		  parameters: self parameters;
		  block: self body;
		  returnTypeReference: self returnTypeReference
]
