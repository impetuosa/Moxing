Class {
	#name : #MOFunction,
	#superclass : #MOInvocable,
	#instVars : [
		'#selector => MOPropertySlot',
		'#returnTypeReference => MOReferenceSlot one'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #visiting }
MOFunction >> acceptVisitor: aJinInspectorBuilder [

	^ aJinInspectorBuilder visitFunction: self
]

{ #category : #generated }
MOFunction >> canBeReferredAsFunction [

	^ true
]

{ #category : #accessing }
MOFunction >> dependencies [

	^ super dependencies
	  , (returnTypeReference ifNotNil: [ :t | t dependencies ] ifNil: [ {  } ])
]

{ #category : #generated }
MOFunction >> name [

	^ selector
]

{ #category : #generated }
MOFunction >> name: aSelector [

 selector := aSelector 
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

{ #category : #generated }
MOFunction >> selector [
	^ selector
	
]

{ #category : #generated }
MOFunction >> selector: aString [

	selector := aString.
	name := aString 
]
