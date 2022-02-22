Class {
	#name : #MOIfElse,
	#superclass : #MOStatement,
	#instVars : [
		'#condition => MOExpressionSlot one',
		'#ifTrue => MOContainmentSlot one',
		'#ifFalse => MOContainmentSlot one'
	],
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #visiting }
MOIfElse >> acceptVisitor: aMOTypescriptCodeGenerator [

	^ aMOTypescriptCodeGenerator visitIfElse: self
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
MOIfElse >> printOn: aStream [

	aStream
		nextPutAll: 'IF ';
		print: condition;
		nextPutAll: ': ';
		print: ifTrue.
	ifFalse isEmptyOrNil ifFalse: [ 
		aStream
			nextPutAll: ' ELSE ';
			print: ifFalse ]
]
