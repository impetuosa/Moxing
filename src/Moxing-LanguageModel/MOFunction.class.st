Class {
	#name : #MOFunction,
	#superclass : #MOProcedure,
	#instVars : [
		'returnTypeReference'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #visiting }
MOFunction >> acceptVisitor: aJinInspectorBuilder [ 
	aJinInspectorBuilder visitFunction: self 
]

{ #category : #accessing }
MOFunction >> dependencies [

	^ super dependencies
	  , (returnTypeReference ifNotNil: [ :t | t dependencies ] ifNil: [ {  } ])
]

{ #category : #'as yet unclassified' }
MOFunction >> fullSelector [

	^ '{1}.{2}' format: { 
			  parent name.
			  selector }
]

{ #category : #generated }
MOFunction >> returnTypeReference [
	^ returnTypeReference
]

{ #category : #generated }
MOFunction >> returnTypeReference: aTypeReference [

	returnTypeReference := aTypeReference
]
