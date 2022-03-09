"
I build attributes 
"
Class {
	#name : #MOModelAttributeBuilder,
	#superclass : #MOModelVariableBuilder,
	#instVars : [
		'visibility'
	],
	#category : #'Moxing-MicroBuilders-variables'
}

{ #category : #'as yet unclassified' }
MOModelAttributeBuilder >> buildsType [

	<generated>
	^ MOAttribute
]

{ #category : #'as yet unclassified' }
MOModelAttributeBuilder >> loadBuilderWithEntity: anEntity [

	super loadBuilderWithEntity: anEntity.
	self visibility: anEntity visibility
]

{ #category : #'as yet unclassified' }
MOModelAttributeBuilder >> privateBuild [

	^ super privateBuild
		  visibility: self visibility;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelAttributeBuilder >> setDefaultBinding [
	self setDynamicBinding.
]

{ #category : #'as yet unclassified' }
MOModelAttributeBuilder >> visibility [

	^ visibility
]

{ #category : #'as yet unclassified' }
MOModelAttributeBuilder >> visibility: anObject [

	visibility := anObject
]
