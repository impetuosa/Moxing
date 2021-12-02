Class {
	#name : #MOFor,
	#superclass : #MOLoop,
	#instVars : [
		'initializeOperation',
		'updateOperation'
	],
	#category : #'Moxing-LanguageModel-Model'
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
