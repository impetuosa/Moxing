Class {
	#name : #MOModelQueryAttributeBuilder,
	#superclass : #MOModelAttributeBuilder,
	#instVars : [
		'reference'
	],
	#category : #'Moxing-Language-MicroBuilders-variables'
}

{ #category : #asserting }
MOModelQueryAttributeBuilder >> buildsType [

	<generated>
	^ MOQueryAttribute
]

{ #category : #asserting }
MOModelQueryAttributeBuilder >> loadBuilderWithEntity: anEntity [

	super loadBuilderWithEntity: anEntity.
	self reference: anEntity reference
]

{ #category : #asserting }
MOModelQueryAttributeBuilder >> privateBuild [

	^ super privateBuild
		  reference: self reference;
		  yourself
]

{ #category : #accessing }
MOModelQueryAttributeBuilder >> reference [
	^ reference
]
