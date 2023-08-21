Class {
	#name : #MOAliasTypeBuilder,
	#superclass : #MOPrimitiveTypeBuilder,
	#instVars : [
		'typeReference'
	],
	#category : #'Moxing-Language-MicroBuilders-Types'
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

{ #category : #accessing }
MOAliasTypeBuilder >> typeReference [
	^ typeReference ifNil: [  self error: ' Type refernece is nil! ' ]
]

{ #category : #accessing }
MOAliasTypeBuilder >> typeReference: aMOPrimitiveTypeReference [ 
	typeReference := aMOPrimitiveTypeReference
]
