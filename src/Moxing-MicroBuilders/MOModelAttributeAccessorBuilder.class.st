Class {
	#name : #MOModelAttributeAccessorBuilder,
	#superclass : #MOModelMethodBuilder,
	#instVars : [
		'kind'
	],
	#category : #'Moxing-MicroBuilders-invocables'
}

{ #category : #asserting }
MOModelAttributeAccessorBuilder >> buildsType [

	<generated>
	^ MOAttributeAccessor
]

{ #category : #accessing }
MOModelAttributeAccessorBuilder >> kind [
	^ kind ifNil: [ self error: 'Accessor kind must be explicited' ]
]

{ #category : #accessing }
MOModelAttributeAccessorBuilder >> kind: aString [ 
	kind := aString
]

{ #category : #asserting }
MOModelAttributeAccessorBuilder >> loadBuilderWithEntity: anEntity [
	super loadBuilderWithEntity: anEntity.
	self kind: anEntity kind.
]

{ #category : #asserting }
MOModelAttributeAccessorBuilder >> privateBuild [

	^ super privateBuild
		  kind: self kind;
		  yourself
]
