Class {
	#name : #MOStPragma,
	#superclass : #MOExpression,
	#instVars : [
		'#selector => MOPropertySlot',
		'#arguments => MOExpressionSlot many'
	],
	#category : #'Moxing-Smalltalk-model'
}

{ #category : #accessing }
MOStPragma >> acceptVisitor: aVisitor [
	^ aVisitor visitPragma: self 
]

{ #category : #accessing }
MOStPragma >> arguments [
	^ arguments
]

{ #category : #accessing }
MOStPragma >> arguments: aCollection [ 
	arguments := aCollection
]

{ #category : #generated }
MOStPragma >> parameters [
  ^arguments
]

{ #category : #accessing }
MOStPragma >> printOn: aStream [

	aStream
		nextPutAll: 'Pragma(';
		nextPutAll: selector;
		nextPutAll: '|'.
	arguments do: [ :a | 
		aStream
			print: a;
			nextPutAll: ',' ].
	aStream nextPutAll: ')'
]

{ #category : #accessing }
MOStPragma >> selector [
	^ selector
]

{ #category : #accessing }
MOStPragma >> selector: aString [

	selector := aString
]
