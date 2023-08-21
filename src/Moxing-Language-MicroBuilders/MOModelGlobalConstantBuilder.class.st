Class {
	#name : #MOModelGlobalConstantBuilder,
	#superclass : #MOModelLocalConstantBuilder,
	#instVars : [
		'visibility'
	],
	#category : #'Moxing-Language-MicroBuilders-Variables'
}

{ #category : #asserting }
MOModelGlobalConstantBuilder >> buildsType [

	<generated>
	^ MOGlobalConstant
]

{ #category : #asserting }
MOModelGlobalConstantBuilder >> loadBuilderWithEntity: anEntity [

	super loadBuilderWithEntity: anEntity.
	self visibility: anEntity visibility
]

{ #category : #asserting }
MOModelGlobalConstantBuilder >> privateBuild [

	^ super privateBuild
		  visibility: self visibility;
		  yourself
]

{ #category : #asserting }
MOModelGlobalConstantBuilder >> visibility [
	^ visibility  
]

{ #category : #asserting }
MOModelGlobalConstantBuilder >> visibility: anObject [

	visibility := anObject
]
