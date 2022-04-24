Class {
	#name : #MOAssignment,
	#superclass : #MOExpression,
	#instVars : [
		'#read => MOExpressionSlot one',
		'#write => MOExpressionSlot one'
	],
	#category : #'Moxing-LanguageModel-Expressions'
}

{ #category : #visiting }
MOAssignment >> acceptVisitor: aMOTypescriptCodeGenerator [
	^ aMOTypescriptCodeGenerator visitAssignment: self
]

{ #category : #accessing }
MOAssignment >> isReference [

	^ true
]

{ #category : #accessing }
MOAssignment >> isRenamable [
	^ false
]

{ #category : #accessing }
MOAssignment >> printOn: aStream [

	aStream
		nextPutAll: '(';
		print: write;
		nextPutAll: ' <- ';
		print: read;
		nextPutAll: ')'
]

{ #category : #accessing }
MOAssignment >> read [
	^ read
]

{ #category : #accessing }
MOAssignment >> read: aFylgjaMissingOperator [ 
	read := aFylgjaMissingOperator
]

{ #category : #accessing }
MOAssignment >> write [
	^ write
]

{ #category : #accessing }
MOAssignment >> write: aMOAlceModelReader [ 
	write := aMOAlceModelReader
]
