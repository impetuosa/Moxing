Class {
	#name : #MOGenericTypeReference,
	#superclass : #MOImportedTypeReference,
	#instVars : [
		'arguments'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #'as yet unclassified' }
MOGenericTypeReference >> arguments: aCollection [
	arguments := aCollection
]

{ #category : #'as yet unclassified' }
MOGenericTypeReference >> dependencies [
	^ super dependencies
		, (arguments flatCollect: [ :d | d dependencies ])
]

{ #category : #'as yet unclassified' }
MOGenericTypeReference >> printOn: aStream [
	aStream
		nextPutAll: name;
		nextPut: $<;
		nextPutAll: ('.' join: arguments);
		nextPut: $>
]
