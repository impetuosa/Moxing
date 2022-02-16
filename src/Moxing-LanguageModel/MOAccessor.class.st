Class {
	#name : #MOAccessor,
	#superclass : #MOMethod,
	#instVars : [
		'#kind => MOPropertySlot'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MOAccessor >> acceptVisitor: aJinInspectorBuilder [ 
		^ aJinInspectorBuilder visitAccessor: self 
]

{ #category : #accessing }
MOAccessor >> kind [
	^ kind
]

{ #category : #accessing }
MOAccessor >> kind: aString [ 
	kind := aString
]

{ #category : #accessing }
MOAccessor >> printOn: aStream [

	aStream
		nextPutAll: 'Accessor: ';
		nextPutAll: selector;
		nextPutAll: '/';
		nextPutAll: parameters size asString;
		nextPutAll: '=>'.

	returnTypeReference
		ifNil: [ aStream nextPutAll: 'UNKNOWN' ]
		ifNotNil: [ :t | returnTypeReference printOn: aStream ]
]
