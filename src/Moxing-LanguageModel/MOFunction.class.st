Class {
	#name : #MOFunction,
	#superclass : #MOProcedure,
	#instVars : [
		'type'
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
	  , (type ifNotNil: [ :t | t dependencies ] ifNil: [ {  } ])
]

{ #category : #'as yet unclassified' }
MOFunction >> fullSelector [

	^ '{1}.{2}' format: { 
			  parent name.
			  selector }
]

{ #category : #generated }
MOFunction >> type [ 
	^ type
]

{ #category : #generated }
MOFunction >> type: aJinTypescriptTypeReference [ 
	type := aJinTypescriptTypeReference 
	
]
