Class {
	#name : #MOModelMethodBuilder,
	#superclass : #MOModelFunctionBuilder,
	#category : #'Moxing-MicroBuilders'
}

{ #category : #building }
MOModelMethodBuilder >> build [

	^ (self instantiate: MOMethod)
		  selector: self selector;
		  parameters: self parameters;
		  block: self body;
		  returnTypeReference: self returnTypeReference
]
