Class {
	#name : #MOModelForNextBuilder,
	#superclass : #MOModelControlFlowBuilder,
	#instVars : [
		'counter',
		'initialValue',
		'limitValue',
		'step',
		'loopingBlock'
	],
	#category : #'Moxing-Language-MicroBuilders-Control flow'
}

{ #category : #asserting }
MOModelForNextBuilder >> buildsType [

	^ MOForNext
]

{ #category : #accessing }
MOModelForNextBuilder >> counter [
	^ counter
]

{ #category : #accessing }
MOModelForNextBuilder >> counter: aMOVariableReference [ 
	counter := aMOVariableReference
]

{ #category : #accessing }
MOModelForNextBuilder >> initialValue [
	^ initialValue
]

{ #category : #accessing }
MOModelForNextBuilder >> initialValue: aMOIntegerLiteral [ 
	initialValue := aMOIntegerLiteral
]

{ #category : #accessing }
MOModelForNextBuilder >> limitValue [
	^ limitValue
]

{ #category : #accessing }
MOModelForNextBuilder >> limitValue: aMOVariableReference [ 
	limitValue := aMOVariableReference
]

{ #category : #accessing }
MOModelForNextBuilder >> loadBuilderWithEntity: anEntity [

	self counter: anEntity counter.
	self initialValue: anEntity initialValue.
	self limitValue: anEntity limitValue.
	self step: anEntity step.
	self loopingBlock: anEntity loopingBlock
]

{ #category : #accessing }
MOModelForNextBuilder >> loopingBlock [
	^ loopingBlock
]

{ #category : #accessing }
MOModelForNextBuilder >> loopingBlock: aMOBlock [ 
	loopingBlock := aMOBlock
]

{ #category : #accessing }
MOModelForNextBuilder >> privateBuild [

	^ (self instantiate: self buildsType)
		  counter: self counter;
		  initialValue: self initialValue;
		  limitValue: self limitValue;
		  step: self step;
		  loopingBlock: self loopingBlock;
		  yourself
]

{ #category : #accessing }
MOModelForNextBuilder >> step [
	^ step
]

{ #category : #accessing }
MOModelForNextBuilder >> step: aMOIntegerLiteral [ 
	step := aMOIntegerLiteral
]
