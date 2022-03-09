Class {
	#name : #MOModelConstantBuilder,
	#superclass : #MOModelVariableBuilder,
	#instVars : [
		'value'
	],
	#category : #'Moxing-MicroBuilders-variables'
}

{ #category : #asserting }
MOModelConstantBuilder >> buildsType [

	<generated>
	^ MOLocalConstant
]

{ #category : #asserting }
MOModelConstantBuilder >> loadBuilderWithEntity: anEntity [

	self name: anEntity name.
	self initializer: anEntity initializer.
	self visibility: anEntity visibility.
	self typeReference: anEntity typeReference.
	self value: anEntity value .
]

{ #category : #asserting }
MOModelConstantBuilder >> privateBuild [

	^ (self instantiate: MOLocalConstant)
		  name: self name;
		  bindingKind: self bindingKind;
		  modifiers: self modifiers;
		  initializer: self initializer;
		  visibility: self visibility;
		  typeReference: self typeReference;
		  annotationInstances: self annotationInstances;
		  value: self value;
		  yourself
]

{ #category : #asserting }
MOModelConstantBuilder >> value [ 
	 ^ value
]

{ #category : #asserting }
MOModelConstantBuilder >> value: aValue [

	value := aValue
]
