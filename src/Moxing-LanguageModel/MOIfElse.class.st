Class {
	#name : #MOIfElse,
	#superclass : #MOLanguageObject,
	#instVars : [
		'condition',
		'ifTrue',
		'ifFalse'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #visiting }
MOIfElse >> acceptVisitor: aMOTypescriptCodeGenerator [

	aMOTypescriptCodeGenerator visitIfElse: self
]

{ #category : #accessing }
MOIfElse >> block [
	self shouldBeImplemented.
]

{ #category : #generated }
MOIfElse >> block: aMOBlock [ 
	" ??? should change the code reader to not send block in the case of if? not sure"
]

{ #category : #accessing }
MOIfElse >> condition [
	^ condition
]

{ #category : #accessing }
MOIfElse >> condition: aFylgjaMissingOperator [ 
	condition := aFylgjaMissingOperator
]

{ #category : #generated }
MOIfElse >> ifFalse [

	^ ifFalse
]

{ #category : #controlling }
MOIfElse >> ifFalse: aMOBlock [

	ifFalse := aMOBlock
]

{ #category : #accessing }
MOIfElse >> ifTrue [
	^ ifTrue
]

{ #category : #accessing }
MOIfElse >> ifTrue: aMOBlock [ 
	ifTrue := aMOBlock
]

{ #category : #accessing }
MOIfElse >> ifTrueBlock: aMOModelBlockBuilder [ 
	self shouldBeImplemented.
]
