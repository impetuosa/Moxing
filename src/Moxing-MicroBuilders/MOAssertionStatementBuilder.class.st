Class {
	#name : #MOAssertionStatementBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'argument',
		'message'
	],
	#category : #'Moxing-MicroBuilders-statements'
}

{ #category : #accessing }
MOAssertionStatementBuilder >> argument [
	^ argument
]

{ #category : #accessing }
MOAssertionStatementBuilder >> argument: aMOVariableReference [ 
	argument := aMOVariableReference
]

{ #category : #'as yet unclassified' }
MOAssertionStatementBuilder >> buildsType [

	^ MOAssertionStatement
]

{ #category : #accessing }
MOAssertionStatementBuilder >> loadBuilderWithEntity: anEntity [

	argument := anEntity argument.
	message := anEntity message
]

{ #category : #accessing }
MOAssertionStatementBuilder >> message [
	^ message
]

{ #category : #accessing }
MOAssertionStatementBuilder >> message: aMOBinaryArithmeticOperation [ 
	message := aMOBinaryArithmeticOperation
]

{ #category : #accessing }
MOAssertionStatementBuilder >> privateBuild [

	^ (self instantiate: self buildsType)
		  argument: self argument;
		  message: self message;
		  yourself
]
