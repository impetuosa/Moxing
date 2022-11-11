Class {
	#name : #MOAssignment,
	#superclass : #MOExpression,
	#instVars : [
		'#read => MOExpressesSlot one',
		'#write => MOExpressesSlot one'
	],
	#category : #'Moxing-LanguageModel-Expressions'
}

{ #category : #accessing }
MOAssignment class >> isRenamable [
	^ false
]

{ #category : #visiting }
MOAssignment >> acceptVisitor: aMOTypescriptCodeGenerator [
	^ aMOTypescriptCodeGenerator visitAssignment: self
]

{ #category : #accessing }
MOAssignment >> isAssignment [

	^ true
]

{ #category : #accessing }
MOAssignment >> isReference [

	^ true
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
MOAssignment >> referee: aMOEnumEntry [ 
	"Warning signal: 'This should not be happening '"
]

{ #category : #accessing }
MOAssignment >> write [
	^ write
]

{ #category : #accessing }
MOAssignment >> write: aMOAlceModelReader [ 
	write := aMOAlceModelReader
]
