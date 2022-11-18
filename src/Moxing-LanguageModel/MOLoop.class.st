Class {
	#name : #MOLoop,
	#superclass : #MOStatement,
	#instVars : [
		'#condition => MOExpressesSlot one',
		'#loopingBlock => MOStatesSlot one'
	],
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #accessing }
MOLoop >> condition [
	^ condition
]

{ #category : #accessing }
MOLoop >> condition: aMOComparisonOperator [ 
	condition := aMOComparisonOperator
]

{ #category : #accessing }
MOLoop >> dependencies [

	^ condition dependencies , (self dependenciesOrEmpty: loopingBlock)
]

{ #category : #accessing }
MOLoop >> loopingBlock [
	^ loopingBlock
]

{ #category : #accessing }
MOLoop >> loopingBlock: aMOBlock [ 
	loopingBlock := aMOBlock
]
