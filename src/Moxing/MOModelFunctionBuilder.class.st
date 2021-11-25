Class {
	#name : #MOModelFunctionBuilder,
	#superclass : #MOModelProcedureBuilder,
	#instVars : [
		'returnTypeReference'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #building }
MOModelFunctionBuilder >> build [

	self assert: self returnTypeReference isNotNil .
	^ (self instantiate: MOFunction)
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
