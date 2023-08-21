Class {
	#name : #MOModelGlobalVariableBuilder,
	#superclass : #MOModelVariableBuilder,
	#instVars : [
		'visibility'
	],
	#category : #'Moxing-Language-MicroBuilders-Variables'
}

{ #category : #asserting }
MOModelGlobalVariableBuilder >> buildsType [

	<generated>
	^ MOGlobalVariable 
]

{ #category : #asserting }
MOModelGlobalVariableBuilder >> loadBuilderWithEntity: anEntity [

	super loadBuilderWithEntity: anEntity.
	self visibility: anEntity visibility
]

{ #category : #asserting }
MOModelGlobalVariableBuilder >> privateBuild [

	^ super privateBuild
		  visibility: self visibility;
		  yourself
]

{ #category : #accessing }
MOModelGlobalVariableBuilder >> visibility [
	^ visibility  
]

{ #category : #accessing }
MOModelGlobalVariableBuilder >> visibility: anObject [

	visibility := anObject
]
