Class {
	#name : #MOModelExternalFunctionBuilder,
	#superclass : #MOModelFunctionBuilder,
	#instVars : [
		'libraryName',
		'realSelector'
	],
	#category : #'Moxing-MicroBuilders-invocables'
}

{ #category : #asserting }
MOModelExternalFunctionBuilder >> buildsType [
	<generated>
	^ MOExternalFunction
]

{ #category : #accessing }
MOModelExternalFunctionBuilder >> libraryName [
	^ libraryName
]

{ #category : #accessing }
MOModelExternalFunctionBuilder >> libraryName: aString [ 
	libraryName := aString
]

{ #category : #accessing }
MOModelExternalFunctionBuilder >> librarySelector [
	^ librarySelector
]

{ #category : #accessing }
MOModelExternalFunctionBuilder >> librarySelector: aString [ 
 	libraryName := aString 
]

{ #category : #asserting }
MOModelExternalFunctionBuilder >> loadBuilderWithEntity: anEntity [

	super loadBuilderWithEntity: anEntity.
	self libraryName: anEntity libraryName.
	self librarySelector: anEntity librarySelector. 
]

{ #category : #asserting }
MOModelExternalFunctionBuilder >> privateBuild [

	"self assert: self returnTypeReference isNotNil."

	^ super privateBuild
		  libraryName: self libraryName;
		  librarySelector: self librarySelector ;
		  yourself
]
