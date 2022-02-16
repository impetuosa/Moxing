Class {
	#name : #MOBlockClosure,
	#superclass : #MOInvocableStatement,
	#instVars : [
		'#returnTypeReference => MOReferenceSlot one'
	],
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #printing }
MOBlockClosure >> printOn: aStream [

	aStream
		nextPutAll: 'Closure ';
		nextPutAll: parameters size asString;
		nextPutAll: '=>'.

	returnTypeReference
		ifNil: [ aStream nextPutAll: 'UNKNOWN' ]
		ifNotNil: [ :t | returnTypeReference printOn: aStream ]
]

{ #category : #printing }
MOBlockClosure >> returnTypeReference [

	^ returnTypeReference
]

{ #category : #printing }
MOBlockClosure >> returnTypeReference: aTypeReference [
	self assert: (aTypeReference isTypeReference  ).
	returnTypeReference := aTypeReference
]
