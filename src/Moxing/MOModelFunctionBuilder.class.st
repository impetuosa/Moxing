Class {
	#name : #MOModelFunctionBuilder,
	#superclass : #MOModelProcedureBuilder,
	#instVars : [
		'returnTypeReference'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #'as yet unclassified' }
MOModelFunctionBuilder >> privateBuild [

	self assert: self returnTypeReference isNotNil.
	^ (self instantiate: MOFunction)
		  thrownTypeReferences: self thrownTypeReferences;
		  visibility: self visibility;
		  modifiers: self modifiers;
		  selector: self selector;
		  parameters: self parameters;
		  block: self body;
		  returnTypeReference: self returnTypeReference
]

{ #category : #'as yet unclassified' }
MOModelFunctionBuilder >> returnType: aMOClass [

	self returnTypeReference: (self typeReferenceBuilder
			 type: aMOClass;
			 build)
]

{ #category : #accessing }
MOModelFunctionBuilder >> returnTypeReference [

	self assert: (returnTypeReference isKindOf: MOTypeReference).
	^ returnTypeReference
]

{ #category : #'as yet unclassified' }
MOModelFunctionBuilder >> returnTypeReference: aMOTypeReference [

	returnTypeReference := aMOTypeReference
]
