Class {
	#name : #MOAliasTypeBuilder,
	#superclass : #MOPrimitiveTypeBuilder,
	#instVars : [
		'typeReference'
	],
	#category : #'Moxing-MicroBuilders-types'
}

{ #category : #accessing }
MOAliasTypeBuilder >> loadBuilderWithEntity: anEntity [

	self name: anEntity name.
	self parent: anEntity parent.
	self typeReference: anEntity typeReference
]

{ #category : #accessing }
MOAliasTypeBuilder >> privateBuild [

	^ (self instantiate: MOAlias) 
		  name: self name;
		  parent: self parent;
		  typeReference: self typeReference;
		  yourself
]
