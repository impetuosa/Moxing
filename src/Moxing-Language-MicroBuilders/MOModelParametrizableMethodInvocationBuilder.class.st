Class {
	#name : #MOModelParametrizableMethodInvocationBuilder,
	#superclass : #MOModelMethodInvocationBuilder,
	#instVars : [
		'argumentTypeReferences'
	],
	#category : #'Moxing-Language-MicroBuilders-Activation-reference'
}

{ #category : #asserting }
MOModelParametrizableMethodInvocationBuilder >> argumentTypeReferences [

	^ argumentTypeReferences
]

{ #category : #asserting }
MOModelParametrizableMethodInvocationBuilder >> argumentTypeReferences: refs [
	 argumentTypeReferences := refs 
]

{ #category : #asserting }
MOModelParametrizableMethodInvocationBuilder >> buildsType [

	<generated>
	^ MOParametrizableMethodInvocation
]

{ #category : #asserting }
MOModelParametrizableMethodInvocationBuilder >> loadBuilderWithEntity: anEntity [

	super loadBuilderWithEntity: anEntity.
	self argumentTypeReferences: anEntity argumentTypeReferences
]
