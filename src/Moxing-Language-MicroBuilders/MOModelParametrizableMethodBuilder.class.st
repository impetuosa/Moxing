Class {
	#name : #MOModelParametrizableMethodBuilder,
	#superclass : #MOModelMethodBuilder,
	#instVars : [
		'typeParameters'
	],
	#category : #'Moxing-Language-MicroBuilders-invocables'
}

{ #category : #adding }
MOModelParametrizableMethodBuilder >> addTypeParameter: aMOTypeParameter [

	self typeParameters add: aMOTypeParameter
]

{ #category : #asserting }
MOModelParametrizableMethodBuilder >> buildsType [

	<generated>
	^ MOParametrizableMethod
]

{ #category : #adding }
MOModelParametrizableMethodBuilder >> loadBuilderWithEntity: anEntity [
	super loadBuilderWithEntity: anEntity.
	self typeParameters: anEntity typeParameters.
]

{ #category : #adding }
MOModelParametrizableMethodBuilder >> privateBuild [

	^ super privateBuild
		  typeParameters: self typeParameters;
		  yourself
]

{ #category : #adding }
MOModelParametrizableMethodBuilder >> typeParameters [

	^ typeParameters ifNil: [ typeParameters := OrderedCollection new ]
]
