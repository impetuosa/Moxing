Class {
	#name : #MOIfElse,
	#superclass : #MOStatement,
	#instVars : [
		'#condition => MOExpressesSlot one',
		'#ifTrue => MODeclaresSlot one',
		'#ifFalse => MODeclaresSlot one'
	],
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #generated }
MOIfElse class >> isRenamable [
	^ false
]

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

{ #category : #accessing }
MOIfElse >> dependencies [

	^ condition dependencies , (self dependenciesOrEmpty: ifTrue)
	  , (self dependenciesOrEmpty: ifFalse)
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

{ #category : #generated }
MOIfElse >> name [ 
	 ^ 'If'
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
