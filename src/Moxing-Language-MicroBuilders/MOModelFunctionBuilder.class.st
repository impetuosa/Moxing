"
I build functions. 
"
Class {
	#name : #MOModelFunctionBuilder,
	#superclass : #MOModelProcedureBuilder,
	#instVars : [
		'returnTypeReference'
	],
	#category : #'Moxing-Language-MicroBuilders-invocables'
}

{ #category : #'as yet unclassified' }
MOModelFunctionBuilder >> buildsType [
<generated>
	^MOFunction
]

{ #category : #'as yet unclassified' }
MOModelFunctionBuilder >> loadBuilderWithEntity: anEntity [

	super loadBuilderWithEntity: anEntity.
	self returnTypeReference: anEntity returnTypeReference
]

{ #category : #'as yet unclassified' }
MOModelFunctionBuilder >> privateBuild [

	"self assert: self returnTypeReference isNotNil."

	^ super privateBuild
		  returnTypeReference: self returnTypeReference;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelFunctionBuilder >> returnType: aMOClass [

	self returnTypeReference: (self typeReferenceBuilder
			 type: aMOClass;
			 build)
]

{ #category : #accessing }
MOModelFunctionBuilder >> returnTypeReference [

	self assert:
		(returnTypeReference isNil or: [ 
			 returnTypeReference isTypeReference ]).
	^ returnTypeReference
]

{ #category : #'as yet unclassified' }
MOModelFunctionBuilder >> returnTypeReference: aMOTypeReference [

	returnTypeReference := aMOTypeReference
]
