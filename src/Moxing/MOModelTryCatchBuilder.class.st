Class {
	#name : #MOModelTryCatchBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'tryBlock',
		'catches'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #adding }
MOModelTryCatchBuilder >> addCatch: aMOCatch [

	self catches add: aMOCatch
]

{ #category : #'as yet unclassified' }
MOModelTryCatchBuilder >> buildsType [

	^ MOTryCatch
]

{ #category : #generated }
MOModelTryCatchBuilder >> catches [

	^ catches ifNil: [ catches := OrderedCollection new ]
]

{ #category : #accessing }
MOModelTryCatchBuilder >> loadBuilderWithEntity: anEntity [

	self tryBlock: anEntity tryBlock.
	self catchStructures: anEntity catches
]

{ #category : #accessing }
MOModelTryCatchBuilder >> privateBuild [

	^ (self instantiate: MOTryCatch)
		  try: self tryBlock;
		  catches: self catches;
		  yourself
]

{ #category : #accessing }
MOModelTryCatchBuilder >> tryBlock [
	^ tryBlock
]

{ #category : #'as yet unclassified' }
MOModelTryCatchBuilder >> tryBlock: aMOBlock [

	tryBlock := aMOBlock
]
