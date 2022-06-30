Class {
	#name : #MOModelMethodAccessBuilder,
	#superclass : #MOModelAttributeAccessBuilder,
	#instVars : [
		'arguments'
	],
	#category : #'Moxing-MicroBuilders-variable-reference'
}

{ #category : #asserting }
MOModelMethodAccessBuilder >> buildsType [

	<generated>
	^ MOMethodAccess
]
