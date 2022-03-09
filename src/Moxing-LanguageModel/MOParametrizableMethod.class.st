Class {
	#name : #MOParametrizableMethod,
	#superclass : #MOMethod,
	#instVars : [
		'#typeParameters => MOContainmentSlot many'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #generated }
MOParametrizableMethod >> printOn: aStream [

	aStream
		nextPutAll: 'Parametrizable Method: ';
		nextPutAll: selector;
		nextPutAll: '<'.
	typeParameters do: [ :p | 
		aStream
			print: p;
			nextPutAll: ',' ].
	aStream
		nextPutAll: '>';
		nextPutAll: '/';
		nextPutAll: parameters size asString;
		nextPutAll: '=>'.

	returnTypeReference
		ifNil: [ aStream nextPutAll: 'UNKNOWN' ]
		ifNotNil: [ :t | returnTypeReference printOn: aStream ]
]

{ #category : #generated }
MOParametrizableMethod >> typeParameters [

	^ typeParameters ifNil: [ typeParameters := OrderedCollection new ]
]

{ #category : #accessing }
MOParametrizableMethod >> typeParameters: aCollection [ 
	typeParameters := aCollection
]
