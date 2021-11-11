Class {
	#name : #MOMethod,
	#superclass : #MOInvocable,
	#instVars : [
		'selector',
		'type'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #visiting }
MOMethod >> acceptVisitor: aJinInspectorBuilder [ 
	aJinInspectorBuilder visitTypescriptMethod: self 
]

{ #category : #accessing }
MOMethod >> dependencies [

	^ super dependencies
	  , (type ifNotNil: [ :t | t dependencies ] ifNil: [ {  } ])
]

{ #category : #accessing }
MOMethod >> printOn: aStream [

	aStream
		nextPutAll: selector;
		nextPutAll: '/';
		nextPutAll: parameters size asString;
		nextPutAll: '=>';
		nextPutAll: (type ifNil: [ 'void' ] ifNotNil: [ :t | t name ])
]

{ #category : #accessing }
MOMethod >> selector [
	^ selector
	
]

{ #category : #accessing }
MOMethod >> selector: aString [

	selector := aString.
	name := aString 
]

{ #category : #generated }
MOMethod >> type [ 
	^ type
]

{ #category : #generated }
MOMethod >> type: aJinTypescriptTypeReference [ 
	type := aJinTypescriptTypeReference 
	
]
