Class {
	#name : #MOForEach,
	#superclass : #MOStatement,
	#instVars : [
		'#each => MOExpressionSlot one',
		'#collection => MOExpressionSlot one',
		'#loopingBlock => MOContainmentSlot one'
	],
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #accessing }
MOForEach >> collection [
	^ collection
]

{ #category : #accessing }
MOForEach >> collection: aMOVariableReference [ 
	collection := aMOVariableReference
]

{ #category : #accessing }
MOForEach >> each [
	^ each
]

{ #category : #accessing }
MOForEach >> each: aMOVariableReference [ 
	each := aMOVariableReference
]

{ #category : #accessing }
MOForEach >> loopingBlock [
	^ loopingBlock
]

{ #category : #accessing }
MOForEach >> loopingBlock: aMOBlock [ 
	loopingBlock := aMOBlock
]
