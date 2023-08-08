Class {
	#name : #MOModelLocalConstantBuilder,
	#superclass : #MOModelVariableBuilder,
	#instVars : [
		'value'
	],
	#category : #'Moxing-Language-MicroBuilders-variables'
}

{ #category : #asserting }
MOModelLocalConstantBuilder >> buildsType [

	<generated>
	^ MOLocalConstant
]

{ #category : #asserting }
MOModelLocalConstantBuilder >> loadBuilderWithEntity: anEntity [

	super loadBuilderWithEntity: anEntity.
	self value: anEntity value
]

{ #category : #asserting }
MOModelLocalConstantBuilder >> privateBuild [

	^ super privateBuild
		  value: self value;
		  yourself
]

{ #category : #asserting }
MOModelLocalConstantBuilder >> value [ 
	 ^ value
]

{ #category : #asserting }
MOModelLocalConstantBuilder >> value: aValue [

	value := aValue
]
