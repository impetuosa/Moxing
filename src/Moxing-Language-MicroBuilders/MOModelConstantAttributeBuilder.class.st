Class {
	#name : #MOModelConstantAttributeBuilder,
	#superclass : #MOModelAttributeBuilder,
	#instVars : [
		'value'
	],
	#category : #'Moxing-Language-MicroBuilders-Variables'
}

{ #category : #asserting }
MOModelConstantAttributeBuilder >> buildsType [

	<generated>
	^ MOConstantAttribute
]
