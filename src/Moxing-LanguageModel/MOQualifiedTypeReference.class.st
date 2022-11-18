Class {
	#name : #MOQualifiedTypeReference,
	#superclass : #MOTypeReference,
	#instVars : [
		'#receiver => MORefersSlot one'
	],
	#category : #'Moxing-LanguageModel-References'
}

{ #category : #accessing }
MOQualifiedTypeReference >> printOn: aStream [

	aStream
		print: receiver;
		nextPutAll: '.';
		nextPutAll: self name
]

{ #category : #accessing }
MOQualifiedTypeReference >> receiver: aMOTypeReference [ 
	receiver := aMOTypeReference
]
