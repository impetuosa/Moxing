Class {
	#name : #MOModelConstantAttributeBuilder,
	#superclass : #MOModelAttributeBuilder,
	#instVars : [
		'value'
	],
	#category : #'Moxing-Language-MicroBuilders-variables'
}

{ #category : #asserting }
MOModelConstantAttributeBuilder >> buildsType [

	<generated>
	^ MOConstantAttribute
]
