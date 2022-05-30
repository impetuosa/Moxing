Class {
	#name : #MONoOp,
	#superclass : #MOExpression,
	#instVars : [
		'#description => MOPropertySlot'
	],
	#category : #'Moxing-LanguageModel-Expressions'
}

{ #category : #accessing }
MONoOp >> acceptVisitor: aMOJavaCodeGenerator [

	^ aMOJavaCodeGenerator visitNoOp: self
]

{ #category : #accessing }
MONoOp >> description: aString [ 
	description := aString
]
