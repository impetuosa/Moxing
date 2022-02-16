Class {
	#name : #MOModelAccessorBuilder,
	#superclass : #MOModelMethodBuilder,
	#instVars : [
		'kind'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #asserting }
MOModelAccessorBuilder >> buildsType [

	<generated>
	^ MOAccessor
]

{ #category : #accessing }
MOModelAccessorBuilder >> kind [
	^ kind ifNil: [ self error: 'Accessor kind must be explicited' ]
]

{ #category : #accessing }
MOModelAccessorBuilder >> kind: aString [ 
	kind := aString
]

{ #category : #asserting }
MOModelAccessorBuilder >> loadBuilderWithEntity: anEntity [
	self bindingKind: anEntity bindingKind.
	self annotationInstances: anEntity annotationInstances.	
	self typeParameters: anEntity typeParameters.
	self thrownTypeReferences: anEntity thrownTypeReferences.
	self visibility: anEntity visibility.
	self selector: anEntity selector.
	self modifiers: anEntity modifiers.
	self parameters: anEntity parameters.
	self body: anEntity block.
	self returnTypeReference: anEntity returnTypeReference.
	self kind: anEntity kind.
]

{ #category : #asserting }
MOModelAccessorBuilder >> privateBuild [

	^ (self instantiate: MOAccessor)
		  thrownTypeReferences: self thrownTypeReferences;
		  visibility: self visibility;
		  selector: self selector;
		  modifiers: self modifiers;
		  parameters: self parameters;
		  bindingKind: self bindingKind;
		  typeParameters: self typeParameters;
		  annotationInstances: self annotationInstances;
		  block: self body;
		  kind: self kind;
		  returnTypeReference: self returnTypeReference
]
