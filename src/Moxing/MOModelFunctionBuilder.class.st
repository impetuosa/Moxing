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
		  selector: selector;
		  parameters: self parameters;
		  block: body;
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
	^ returnTypeReference
]

{ #category : #'as yet unclassified' }
MOModelFunctionBuilder >> returnTypeReference: aMOTypeReference [

	returnTypeReference := aMOTypeReference
]
