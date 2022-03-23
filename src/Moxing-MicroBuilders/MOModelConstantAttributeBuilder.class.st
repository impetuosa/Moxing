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
MOModelConstantAttributeBuilder >> value [ 
	 ^ value
]

{ #category : #asserting }
MOModelConstantAttributeBuilder >> value: aValue [

	value := aValue
]
