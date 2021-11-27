Class {
	#name : #MOModelForBuilder,
	#superclass : #MOModelControlFlowBuilder,
	#instVars : [
		'loopingBlock',
		'initializeOperation',
		'updateOperation'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #accessing }
MOModelForBuilder >> initializeOperation [

	^ initializeOperation ifNil: [ 
		  initializeOperation := self instantiate: MONoOp ]
]

{ #category : #accessing }
MOModelForBuilder >> initializeOperation: aMOVariable [ 
	initializeOperation := aMOVariable
]

{ #category : #accessing }
MOModelForBuilder >> loopingBlock [
	^ loopingBlock ifNil: [  self error: 'Looping Block is Nil' ]
]

{ #category : #accessing }
MOModelForBuilder >> loopingBlock: aMOBlock [ 
	loopingBlock := aMOBlock
]

{ #category : #'as yet unclassified' }
MOModelForBuilder >> privateBuild [

	^ (self instantiate: MOFor)
		  initializeOperation: self initializeOperation;
		  updateOperation: self updateOperation;
		  condition: self condition;
		  loopingBlock: self loopingBlock;
		  yourself
]

{ #category : #accessing }
MOModelForBuilder >> updateOperation [

	^ updateOperation ifNil: [ 
		  updateOperation := self instantiate: MONoOp ]
]

{ #category : #'as yet unclassified' }
MOModelForBuilder >> updateOperation: aMOUnaryArithmeticOperation [

	updateOperation := aMOUnaryArithmeticOperation
]
