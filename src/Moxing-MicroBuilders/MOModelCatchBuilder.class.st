Class {
	#name : #MOModelCatchBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'parameters',
		'block'
	],
	#category : #'Moxing-MicroBuilders-statements'
}

{ #category : #accessing }
MOModelCatchBuilder >> addParameter: aMOParameter [

	self parameters add: aMOParameter
]

{ #category : #accessing }
MOModelCatchBuilder >> block [
	^ block ifNil: [ self error: ' Catch requires a block! ' ]
]

{ #category : #accessing }
MOModelCatchBuilder >> block: aMOBlock [ 
	block := aMOBlock
]

{ #category : #'as yet unclassified' }
MOModelCatchBuilder >> buildsType [

	^ MOCatch
]

{ #category : #accessing }
MOModelCatchBuilder >> loadBuilderWithEntity: anEntity [

	self parameters: anEntity parameters.
	self block: anEntity block
]

{ #category : #accessing }
MOModelCatchBuilder >> parameters [
	^ parameters ifNil: [ parameters := OrderedCollection new ]
]

{ #category : #accessing }
MOModelCatchBuilder >> privateBuild [

	^ (self instantiate: MOCatch)
		  parameters: self parameters;
		  block: self block;
		  yourself
]
