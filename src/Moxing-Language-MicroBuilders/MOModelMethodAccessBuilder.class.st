Class {
	#name : #MOModelMethodAccessBuilder,
	#superclass : #MOModelAttributeAccessBuilder,
	#instVars : [
		'arguments'
	],
	#category : #'Moxing-Language-MicroBuilders-Variable-reference'
}

{ #category : #asserting }
MOModelMethodAccessBuilder >> buildsType [

	<generated>
	^ MOMethodAccess
]
