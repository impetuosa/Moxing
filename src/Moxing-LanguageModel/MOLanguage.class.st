Class {
	#name : #MOLanguage,
	#superclass : #MONamedObject,
	#classInstVars : [
		'typescript',
		'java'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #accessing }
MOLanguage class >> java [

	^ java ifNil: [ 
		  java := self new
			                name: #java;
			                yourself ]
]

{ #category : #accessing }
MOLanguage class >> typescript [

	^ typescript ifNil: [ 
		  typescript := self new
			                name: #typescript;
			                yourself ]
]

{ #category : #printing }
MOLanguage >> printOn: aStream [

	aStream
		nextPutAll: 'lang: ';
		nextPutAll: name
]
