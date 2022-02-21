"
I build classes 
"
Class {
	#name : #MOModelClassBuilder,
	#superclass : #MOModelClassTypeBuilder,
	#instVars : [
		'superclassReference'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #adding }
MOModelClassBuilder >> addAccessor: aMOAccessor [

	self addMethod: aMOAccessor
]

{ #category : #adding }
MOModelClassBuilder >> addConstructor: aMOConstructor [

	self addMethod: aMOConstructor
]

{ #category : #'as yet unclassified' }
MOModelClassBuilder >> bindingConfiguration [

	"On the left the attribute names for MOClass. On the right the attribute names for this builder. "

	<generated>
	^ { 
		  { #name. #name }.
		  { #modifiers. #modifiers }.
		  { #attributes. #attributes }.
		  { #methods. #methods }.
		  { #parent. #parent }.
		  { #typeParameters. #typeParameters }.
		  { #packageReference. #packageReference }.
		  { #superclassReference. #superclassReference }.
		  { #superTypeReferences. #superTypeReferences } }
]

{ #category : #'as yet unclassified' }
MOModelClassBuilder >> buildsType [
<generated>
	^MOClass
]

{ #category : #'as yet unclassified' }
MOModelClassBuilder >> loadBuilderWithEntity: anEntity [

	self name: anEntity name.
	self modifiers: anEntity modifiers.
	self attributes: anEntity attributes.
	self methods: anEntity methods.
	self parent: anEntity parent.
	self typeParameters: anEntity typeParameters.
	self packageReference: anEntity packageReference.
	self superclassReference: anEntity superclassReference.
	self superTypeReferences: anEntity superTypeReferences
]

{ #category : #'as yet unclassified' }
MOModelClassBuilder >> privateBuild [

	^ (self instantiate: MOClass)
		  name: self name;
		  modifiers: self modifiers;
		  visibility: self visibility;
		  attributes: self attributes;
		  methods: self methods;
		  parent: self parent;
		  decorators: self decorators;
		  typeParameters: self typeParameters;
		  packageReference: self packageReference;
		  superclassReference: self superclassReference;
		  superTypeReferences: self superTypeReferences;
		  yourself
]

{ #category : #accessing }
MOModelClassBuilder >> superclass: aMOClass [

	self superclassReference: (self typeReferenceBuilder
			 type: aMOClass;
			 build)
]

{ #category : #accessing }
MOModelClassBuilder >> superclassReference [
	^ superclassReference
]

{ #category : #accessing }
MOModelClassBuilder >> superclassReference: aMOTypeReference [ 
	superclassReference := aMOTypeReference
]
