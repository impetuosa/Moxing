"
I build functions. 
"
Class {
	#name : #MOModelFunctionBuilder,
	#superclass : #MOModelProcedureBuilder,
	#instVars : [
		'returnTypeReference'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #'as yet unclassified' }
MOModelFunctionBuilder >> bindingConfiguration [

	"On the left the attribute names for MOFunction. On the right the attribute names for this builder. "

	<generated>
	^ { 
		  { #thrownTypeReferences. #thrownTypeReferences }.
		  { #visibility. #visibility }.
		  { #modifiers. #modifiers }.
		  { #selector. #selector }.
		  { #parameters. #parameters }.
		  { #block. #body }.
		  { #returnTypeReference. #returnTypeReference } }
]

{ #category : #'as yet unclassified' }
MOModelFunctionBuilder >> buildsType [
<generated>
	^MOFunction
]

{ #category : #'as yet unclassified' }
MOModelFunctionBuilder >> loadBuilderWithEntity: anEntity [

	self bindingKind: anEntity bindingKind.
	self annotationInstances: anEntity annotationInstances.
	self typeParameters: anEntity typeParameters.
	self thrownTypeReferences: anEntity thrownTypeReferences.
	self visibility: anEntity visibility.
	self modifiers: anEntity modifiers.
	self selector: anEntity selector.
	self parameters: anEntity parameters.
	self body: anEntity block.
	self returnTypeReference: anEntity returnTypeReference
]

{ #category : #'as yet unclassified' }
MOModelFunctionBuilder >> privateBuild [

	"self assert: self returnTypeReference isNotNil."
	^ (self instantiate: MOFunction)
		  thrownTypeReferences: self thrownTypeReferences;
		  visibility: self visibility;
			  bindingKind: self bindingKind;
		  typeParameters: self typeParameters;
		  modifiers: self modifiers;
		  selector: self selector;
		  annotationInstances: self annotationInstances;
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

	self assert:
		(returnTypeReference isNil or: [ 
			 returnTypeReference isTypeReference ]).
	^ returnTypeReference
]

{ #category : #'as yet unclassified' }
MOModelFunctionBuilder >> returnTypeReference: aMOTypeReference [

	returnTypeReference := aMOTypeReference
]
