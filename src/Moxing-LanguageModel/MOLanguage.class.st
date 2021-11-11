Class {
	#name : #MOLanguage,
	#superclass : #MONamedObject,
	#classInstVars : [
		'typescript',
		'java'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #'as yet unclassified' }
MOLanguage class >> javaFor: aMOModel [

	^ java ifNil: [ 
		  java := (aMOModel instantiate: self)
			          name: #java;
			          yourself ]
]

{ #category : #accessing }
MOLanguage class >> typescriptFor: aMOModel [

	^ typescript ifNil: [ 
		  typescript :=  (aMOModel instantiate: self)
			                name: #typescript;
			                yourself ]
]

{ #category : #printing }
MOLanguage >> printOn: aStream [

	aStream
		nextPutAll: 'lang: ';
		nextPutAll: name
]
