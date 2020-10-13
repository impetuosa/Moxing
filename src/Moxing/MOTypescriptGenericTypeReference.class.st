Class {
	#name : #MOTypescriptGenericTypeReference,
	#superclass : #MOTypescriptTypeReference,
	#instVars : [
		'parameters'
	],
	#category : #'Moxing-CodeWritingTypescript'
}

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
