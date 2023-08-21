"
I build classical for control flow 
"
Class {
	#name : #MOModelForBuilder,
	#superclass : #MOModelConditionalControlFlowBuilder,
	#instVars : [
		'loopingBlock',
		'initializeOperation',
		'updateOperation'
	],
	#category : #'Moxing-Language-MicroBuilders-Control flow'
}

{ #category : #'as yet unclassified' }
MOModelForBuilder >> buildsType [
<generated>
	^MOFor
]

{ #category : #accessing }
MOModelForBuilder >> initializeOperation [

	^ initializeOperation ifNil: [ 
		  initializeOperation := self instantiate: MONoOp ]
]

{ #category : #accessing }
MOModelForBuilder >> initializeOperation: aMOVariable [ 
	initializeOperation := aMOVariable
]

{ #category : #'as yet unclassified' }
MOModelForBuilder >> loadBuilderWithEntity: anEntity [ 
	self initializeOperation: anEntity initializeOperation. 
 self updateOperation: anEntity updateOperation. 
 self condition: anEntity condition. 
 self loopingBlock: anEntity loopingBlock. 
 
	
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
