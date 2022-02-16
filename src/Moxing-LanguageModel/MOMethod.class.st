Class {
	#name : #MOMethod,
	#superclass : #MOFunction,
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #visiting }
MOMethod >> acceptVisitor: aJinInspectorBuilder [ 
		^ aJinInspectorBuilder visitMethod: self 
]

{ #category : #accessing }
MOMethod >> printOn: aStream [

	aStream
		nextPutAll: 'Method: ';
		nextPutAll: selector;
		nextPutAll: '/';
		nextPutAll: parameters size asString;
		nextPutAll: '=>'.

	returnTypeReference
		ifNil: [ aStream nextPutAll: 'UNKNOWN' ]
		ifNotNil: [ :t | returnTypeReference printOn: aStream ]
]
