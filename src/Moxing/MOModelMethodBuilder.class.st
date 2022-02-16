"
I build methods
"
Class {
	#name : #MOModelMethodBuilder,
	#superclass : #MOModelFunctionBuilder,
	#category : #'Moxing-MicroBuilders'
}

{ #category : #'as yet unclassified' }
MOModelMethodBuilder >> bindingConfiguration [

	"On the left the attribute names for MOMethod. On the right the attribute names for this builder. "

	<generated>
	^ { 
		  { #thrownTypeReferences. #thrownTypeReferences }.
		  { #visibility. #visibility }.
		  { #selector. #selector }.
		  { #modifiers. #modifiers }.
		  { #parameters. #parameters }.
		  { #block. #body }.
		  { #returnTypeReference. #returnTypeReference } }
]

{ #category : #'as yet unclassified' }
MOModelMethodBuilder >> buildsType [
<generated>
	^MOMethod
]

{ #category : #'as yet unclassified' }
MOModelMethodBuilder >> loadBuilderWithEntity: anEntity [

	self bindingKind: anEntity bindingKind.
	self annotationInstances: anEntity annotationInstances.
	self typeParameters: anEntity typeParameters.
	self thrownTypeReferences: anEntity thrownTypeReferences.
	self visibility: anEntity visibility.
	self selector: anEntity selector.
	self modifiers: anEntity modifiers.
	self parameters: anEntity parameters.
	self body: anEntity block.
	self returnTypeReference: anEntity returnTypeReference
]

{ #category : #'as yet unclassified' }
MOModelMethodBuilder >> privateBuild [

	^ (self instantiate: MOMethod)
		  thrownTypeReferences: self thrownTypeReferences;
		  visibility: self visibility;
		  selector: self selector;
		  modifiers: self modifiers;
		  parameters: self parameters;
			  bindingKind: self bindingKind;
		  typeParameters: self typeParameters;
		  annotationInstances: self annotationInstances;
		  block: self body;
		  returnTypeReference: self returnTypeReference
]

{ #category : #'as yet unclassified' }
MOModelMethodBuilder >> setDefaultBinding [

	self setDynamicBinding
]
