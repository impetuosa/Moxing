Class {
	#name : #MOModelSharedConstantBuilder,
	#superclass : #MOModelGlobalConstantBuilder,
	#instVars : [
		'isPreexisting'
	],
	#category : #'Moxing-StVisualWorks-Builder'
}

{ #category : #asserting }
MOModelSharedConstantBuilder >> buildsType [ 
	^ MOSharedConstant
]

{ #category : #asserting }
MOModelSharedConstantBuilder >> isPreexisting: aBoolean [

	isPreexisting := aBoolean
]

{ #category : #asserting }
MOModelSharedConstantBuilder >> loadBuilderWithEntity: anEntity [

	super loadBuilderWithEntity: anEntity.
	self isPreexisting: anEntity isPreexisting
]

{ #category : #asserting }
MOModelSharedConstantBuilder >> privateBuild [

	^ super privateBuild
		  isPreexisting: self isPreexisting;
		  yourself
]
