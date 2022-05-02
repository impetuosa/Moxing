Class {
	#name : #MOModelConstantAttributeBuilder,
	#superclass : #MOModelAttributeBuilder,
	#instVars : [
		'value'
	],
	#category : #'Moxing-MicroBuilders-variables'
}

{ #category : #asserting }
MOModelConstantAttributeBuilder >> buildsType [

	<generated>
	^ MOConstantAttribute
]

{ #category : #asserting }
MOModelConstantAttributeBuilder >> loadBuilderWithEntity: anEntity [

	super loadBuilderWithEntity: anEntity.
	self value: anEntity value
]

{ #category : #asserting }
MOModelConstantAttributeBuilder >> privateBuild [

	^ super privateBuild
		  value: self value;
		  yourself
]

{ #category : #asserting }
MOModelConstantAttributeBuilder >> value [ 
	 ^ value
]

{ #category : #asserting }
MOModelConstantAttributeBuilder >> value: aValue [

	value := aValue
]
