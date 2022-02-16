Class {
	#name : #MOModelArrayAccessBuilder,
	#superclass : #MOModelAttributeAccessBuilder,
	#instVars : [
		'arguments'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #accessing }
MOModelArrayAccessBuilder >> arguments [
	^ arguments
]

{ #category : #generated }
MOModelArrayAccessBuilder >> arguments: args [

	arguments := args
]

{ #category : #asserting }
MOModelArrayAccessBuilder >> buildsType [

	<generated>
	^ MOArrayAccess
]

{ #category : #asserting }
MOModelArrayAccessBuilder >> loadBuilderWithEntity: anEntity [

	self receiverReference: anEntity receiverReference.
	self arguments: anEntity arguments
]

{ #category : #asserting }
MOModelArrayAccessBuilder >> privateBuild [

	^ (self instantiate: MOArrayAccess)
		  receiverReference: self receiverReference;
		  arguments: self arguments;
		  name: #arrayAccess;
		  yourself
]
