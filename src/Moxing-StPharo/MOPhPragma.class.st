Class {
	#name : #MOPhPragma,
	#superclass : #MOExpression,
	#instVars : [
		'#selector => MOPropertySlot',
		'#arguments => MOExpressionSlot many'
	],
	#category : #'Moxing-StPharo'
}

{ #category : #accessing }
MOPhPragma >> acceptVisitor: aVisitor [
	^ aVisitor visitPragma: self 
]

{ #category : #accessing }
MOPhPragma >> arguments [
	^ arguments
]

{ #category : #accessing }
MOPhPragma >> arguments: aCollection [ 
	arguments := aCollection
]

{ #category : #accessing }
MOPhPragma >> printOn: aStream [

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
MOPhPragma >> selector [
	^ selector
]

{ #category : #accessing }
MOPhPragma >> selector: aString [

	selector := aString
]
