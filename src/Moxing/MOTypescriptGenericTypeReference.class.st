Class {
	#name : #MOTypescriptGenericTypeReference,
	#superclass : #MOTypescriptTypeReference,
	#instVars : [
		'parameters'
	],
	#category : #'Moxing-CodeWritingTypescript'
}

{ #category : #'as yet unclassified' }
MOTypescriptGenericTypeReference >> addTypeParameter: aMOTypescriptArrayTypeReference [
	parameters add: aMOTypescriptArrayTypeReference
]

{ #category : #initialization }
MOTypescriptGenericTypeReference >> initialize [
	super initialize.
	parameters := OrderedCollection new
]

{ #category : #'as yet unclassified' }
MOTypescriptGenericTypeReference >> printOn: aStream [
	aStream
		nextPutAll: name;
		nextPut: $<;
		nextPutAll: ('.' join: parameters);
		nextPut: $>
]
