Class {
	#name : #MOFunction,
	#superclass : #MOProcedure,
	#instVars : [
		'#returnTypeReference => MOReferenceSlot one'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #visiting }
MOFunction >> acceptVisitor: aJinInspectorBuilder [

	^ aJinInspectorBuilder visitFunction: self
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
MOFunction >> printOn: aStream [

	aStream
		nextPutAll: 'Function: ';
		nextPutAll: selector;
		nextPutAll: '/';
		nextPutAll: parameters size asString.

	returnTypeReference
		ifNil: [ aStream nextPutAll: 'UNKNOWN' ]
		ifNotNil: [ :t | returnTypeReference printOn: aStream ]
]

{ #category : #generated }
MOFunction >> returnTypeReference [
	^ returnTypeReference
]

{ #category : #generated }
MOFunction >> returnTypeReference: aTypeReference [

	returnTypeReference := aTypeReference
]
