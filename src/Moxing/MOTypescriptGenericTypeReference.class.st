Class {
	#name : #MOTypescriptGenericTypeReference,
	#superclass : #MOTypescriptImportedTypeReference,
	#instVars : [
		'parameters'
	],
	#category : #'Moxing-ModelTS'
}

{ #category : #'as yet unclassified' }
MOTypescriptGenericTypeReference >> dependencies [
	^ super dependencies
		, (parameters flatCollect: [ :d | d dependencies ])
]

{ #category : #'as yet unclassified' }
MOTypescriptGenericTypeReference >> parameters: aCollection [
	parameters := aCollection
]

{ #category : #'as yet unclassified' }
MOTypescriptGenericTypeReference >> printOn: aStream [
	aStream
		nextPutAll: name;
		nextPut: $<;
		nextPutAll: ('.' join: parameters);
		nextPut: $>
]
