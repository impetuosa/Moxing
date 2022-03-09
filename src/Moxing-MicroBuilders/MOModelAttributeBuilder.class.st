"
I build attributes 
"
Class {
	#name : #MOModelAttributeBuilder,
	#superclass : #MOModelVariableBuilder,
	#category : #'Moxing-MicroBuilders-variables'
}

{ #category : #'as yet unclassified' }
MOModelAttributeBuilder >> buildsType [
<generated>
	^MOAttribute
]

{ #category : #'as yet unclassified' }
MOModelAttributeBuilder >> loadBuilderWithEntity: anEntity [

	self name: anEntity name.
	self initializer: anEntity initializer.
	self visibility: anEntity visibility.
	self typeReference: anEntity typeReference
]

{ #category : #'as yet unclassified' }
MOModelAttributeBuilder >> privateBuild [

	^ (self instantiate: MOAttribute)
		  name: self name;
		  bindingKind: self bindingKind;
		  modifiers: self modifiers;
		  initializer: self initializer;
		  visibility: self visibility;
		  typeReference: self typeReference;
		  annotationInstances: self annotationInstances;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelAttributeBuilder >> setDefaultBinding [
	self setDynamicBinding.
]
