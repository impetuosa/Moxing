"
I build procedures. No returning value, only parameters. 
"
Class {
	#name : #MOModelProcedureBuilder,
	#superclass : #MOModelConstructorBuilder,
	#traits : 'MOManageBindingPolicy',
	#classTraits : 'MOManageBindingPolicy classTrait',
	#instVars : [
		'selector'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #'as yet unclassified' }
MOModelProcedureBuilder >> bindingConfiguration [

	"On the left the attribute names for MOProcedure. On the right the attribute names for this builder. "

	<generated>
	^ { 
		  { #thrownTypeReferences. #thrownTypeReferences }.
		  { #visibility. #visibility }.
		  { #modifiers. #modifiers }.
		  { #selector. #selector }.
		  { #parameters. #parameters }.
		  { #block. #body } }
]

{ #category : #'as yet unclassified' }
MOModelProcedureBuilder >> buildsType [

	<generated>
	^ MOProcedure
]

{ #category : #'as yet unclassified' }
MOModelProcedureBuilder >> loadBuilderWithEntity: anEntity [

	self bindingKind: anEntity bindingKind.
	self annotationInstances: anEntity annotationInstances.
	self typeParameters: anEntity typeParameters.
	self thrownTypeReferences: anEntity thrownTypeReferences.
	self visibility: anEntity visibility.
	self modifiers: anEntity modifiers.
	self selector: anEntity selector.
	self parameters: anEntity parameters.
	self body: anEntity block
]

{ #category : #'as yet unclassified' }
MOModelProcedureBuilder >> privateBuild [

	^ (self instantiate: MOProcedure)
		  thrownTypeReferences: self thrownTypeReferences;
		  visibility: self visibility;
		  bindingKind: self bindingKind;
		  typeParameters: self typeParameters;
		  modifiers: self modifiers;
		  selector: self selector;
		  parameters: self parameters;
		  block: self body;
		  annotationInstances: self annotationInstances;
		  yourself
]

{ #category : #accessing }
MOModelProcedureBuilder >> selector [
	^ selector ifNil: [ self error: ' Selector is Nil ' ]
]

{ #category : #accessing }
MOModelProcedureBuilder >> selector: aString [ 
	selector := aString  
]

{ #category : #accessing }
MOModelProcedureBuilder >> setDefaultBinding [

	^ self setStaticBinding
]
