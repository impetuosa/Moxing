Class {
	#name : #MOReturn,
	#superclass : #MOStatement,
	#instVars : [
		'#expression => MOExpressesSlot one'
	],
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #visiting }
MOReturn >> acceptVisitor: aVisitor [

	^ aVisitor visitReturn: self
]

{ #category : #accessing }
MOReturn >> dependencies [

	^ expression dependencies
]

{ #category : #accessing }
MOReturn >> expression [
	^ expression
]

{ #category : #accessing }
MOReturn >> expression: aMOVariableRererence [ 
	expression := aMOVariableRererence
]

{ #category : #testing }
MOReturn >> isReturn [
  ^true
]

{ #category : #accessing }
MOReturn >> printOn: aStream [

	aStream
		nextPutAll: 'Return ';
		print: expression
]
