Class {
	#name : #MOAssignment,
	#superclass : #MOLanguageObject,
	#instVars : [
		'read',
		'write'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #visiting }
MOAssignment >> acceptVisitor: aMOTypescriptCodeGenerator [

	aMOTypescriptCodeGenerator visitAssignment: self
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
