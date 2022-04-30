Class {
	#name : #MOModelVariableAccessorBuilder,
	#superclass : #MOModelFunctionBuilder,
	#instVars : [
		'kind'
	],
	#category : #'Moxing-MicroBuilders-invocables'
}

{ #category : #asserting }
MOModelVariableAccessorBuilder >> buildsType [

	<generated>
	^ MOVariableAccessor
]

{ #category : #asserting }
MOModelVariableAccessorBuilder >> kind [
	^ kind ifNil: [ self error: 'Accessor kind must be explicited' ]
]

{ #category : #asserting }
MOModelVariableAccessorBuilder >> kind: aString [ 
	kind := aString
]

{ #category : #asserting }
MOModelVariableAccessorBuilder >> loadBuilderWithEntity: anEntity [
	super loadBuilderWithEntity: anEntity.
	self kind: anEntity kind.
]

{ #category : #asserting }
MOModelVariableAccessorBuilder >> privateBuild [

	^ super privateBuild
		  kind: self kind;
		  yourself
]
