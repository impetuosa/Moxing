Class {
	#name : #MOBlockClosure,
	#superclass : #MOInvocableStatement,
	#instVars : [
		'#returnTypeReference => MOReferesSlot one'
	],
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #printing }
MOBlockClosure >> dependencies [

	^ block dependencies
	  , (self dependenciesOrEmpty: returnTypeReference)
	  , (self dependenciesOrEmpty: parameters)
]

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
