Class {
	#name : #MOModelMethodAccessBuilder,
	#superclass : #MOModelAttributeAccessBuilder,
	#instVars : [
		'arguments'
	],
	#category : #'Moxing-Language-MicroBuilders-variable-reference'
}

{ #category : #asserting }
MOModelMethodAccessBuilder >> buildsType [

	<generated>
	^ MOMethodAccess
]
