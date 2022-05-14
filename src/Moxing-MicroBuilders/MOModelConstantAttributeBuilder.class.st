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
