Class {
	#name : #MOModelBlockBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'name',
		'typeReference',
		'statements'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #adding }
MOModelBlockBuilder >> addStatement: aMOModelVariableBuilder [

	self statements add: aMOModelVariableBuilder
]

{ #category : #'as yet unclassified' }
MOModelBlockBuilder >> privateBuild [

	^ (self instantiate: MOBlock)
		  statements: self statements;
		  yourself
]

{ #category : #generated }
MOModelBlockBuilder >> statements [

	^ statements ifNil: [ statements := OrderedCollection new ]
]
