Class {
	#name : #MOModelAccessorBuilder,
	#superclass : #MOModelMethodBuilder,
	#instVars : [
		'kind'
	],
	#category : #'Moxing-MicroBuilders-invocables'
}

{ #category : #asserting }
MOModelAccessorBuilder >> buildsType [

	<generated>
	^ MOAccessor
]

{ #category : #accessing }
MOModelAccessorBuilder >> kind [
	^ kind ifNil: [ self error: 'Accessor kind must be explicited' ]
]

{ #category : #accessing }
MOModelAccessorBuilder >> kind: aString [ 
	kind := aString
]

{ #category : #asserting }
MOModelAccessorBuilder >> loadBuilderWithEntity: anEntity [
	super loadBuilderWithEntity: anEntity.
	self kind: anEntity kind.
]

{ #category : #asserting }
MOModelAccessorBuilder >> privateBuild [

	^ super privateBuild
		  kind: self kind;
		  yourself
]
