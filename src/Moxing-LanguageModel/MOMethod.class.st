Class {
	#name : #MOMethod,
	#superclass : #MOFunction,
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #visiting }
MOMethod >> acceptVisitor: aJinInspectorBuilder [ 
		^ aJinInspectorBuilder visitMethod: self 
]

{ #category : #adding }
MOMethod >> addVariable: aMOVariable [

	block addVariable: aMOVariable
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
