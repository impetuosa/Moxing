Class {
	#name : #MOPrimitiveType,
	#superclass : #MOType,
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #printing }
MOPrimitiveType >> printOn: aStream [

	aStream
		nextPutAll: 'primitive: ';
		nextPutAll: name
]