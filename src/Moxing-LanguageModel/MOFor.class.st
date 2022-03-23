Class {
	#name : #MOFor,
	#superclass : #MOLoop,
	#instVars : [
		'#initializeOperation => MOExpressionSlot one',
		'#updateOperation => MOExpressionSlot one'
	],
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #accessing }
MOFor >> initializeOperation [
	^ initializeOperation
]

{ #category : #accessing }
MOFor >> initializeOperation: aMOVariable [ 
	initializeOperation := aMOVariable
]

{ #category : #accessing }
MOFor >> updateOperation [
	^ updateOperation
]

{ #category : #accessing }
MOFor >> updateOperation: aMOUnaryArithmeticOperation [ 
	updateOperation := aMOUnaryArithmeticOperation
]
