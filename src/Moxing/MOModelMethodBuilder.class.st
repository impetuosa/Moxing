Class {
	#name : #MOModelMethodBuilder,
	#superclass : #MOModelFunctionBuilder,
	#category : #'Moxing-MicroBuilders'
}

{ #category : #building }
MOModelMethodBuilder >> build [

	^ (self instantiate: MOMethod)
		  selector: selector;
		  parameters: self parameters;
		  block: body;
		  returnTypeReference: self returnTypeReference
]
