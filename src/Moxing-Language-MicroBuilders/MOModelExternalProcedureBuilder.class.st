Class {
	#name : #MOModelExternalProcedureBuilder,
	#superclass : #MOModelProcedureBuilder,
	#instVars : [
		'libraryName',
		'librarySelector'
	],
	#category : #'Moxing-Language-MicroBuilders-invocables'
}

{ #category : #asserting }
MOModelExternalProcedureBuilder >> buildsType [
	<generated>
	^ MOExternalProcedure
]

{ #category : #accessing }
MOModelExternalProcedureBuilder >> libraryName [
	^ libraryName
]

{ #category : #accessing }
MOModelExternalProcedureBuilder >> libraryName: aString [ 
	libraryName := aString
]

{ #category : #accessing }
MOModelExternalProcedureBuilder >> librarySelector [
	^ librarySelector
]

{ #category : #accessing }
MOModelExternalProcedureBuilder >> librarySelector: aString [ 
 	libraryName := aString 
]

{ #category : #asserting }
MOModelExternalProcedureBuilder >> loadBuilderWithEntity: anEntity [

	super loadBuilderWithEntity: anEntity.
	self libraryName: anEntity libraryName.
	self librarySelector: anEntity librarySelector. 
]

{ #category : #asserting }
MOModelExternalProcedureBuilder >> privateBuild [

	"self assert: self returnTypeReference isNotNil."

	^ super privateBuild
		  libraryName: self libraryName;
		  librarySelector: self librarySelector ;
		  yourself
]
