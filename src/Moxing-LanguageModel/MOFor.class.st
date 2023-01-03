Class {
	#name : #MOFor,
	#superclass : #MOLoop,
	#instVars : [
		'#initializeOperation => MOExpressesSlot many',
		'#updateOperation => MOExpressesSlot many'
	],
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #visiting }
MOFor >> acceptVisitor: aMOModelTypeResolver [

	^ aMOModelTypeResolver visitFor: self
]

{ #category : #accessing }
MOFor >> dependencies [

	^ super dependencies
	  , (self dependenciesOrEmpty: initializeOperation)
	  , (self dependenciesOrEmpty: updateOperation)
]

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
