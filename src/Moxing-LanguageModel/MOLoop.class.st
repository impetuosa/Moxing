Class {
	#name : #MOLoop,
	#superclass : #MOLanguageObject,
	#instVars : [
		'condition',
		'loopingBlock'
	],
	#category : #'Moxing-LanguageModel-Model'
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
MOLoop >> loopingBlock [
	^ loopingBlock
]

{ #category : #accessing }
MOLoop >> loopingBlock: aMOBlock [ 
	loopingBlock := aMOBlock
]
