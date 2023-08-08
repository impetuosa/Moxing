Class {
	#name : #MOModelTryCatchBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'tryBlock',
		'catches',
		'finallyBlock'
	],
	#category : #'Moxing-Language-MicroBuilders-statements'
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

{ #category : #generated }
MOModelTryCatchBuilder >> catches: aCollection [

	catches := aCollection
]

{ #category : #accessing }
MOModelTryCatchBuilder >> finallyBlock [

	^ finallyBlock
]

{ #category : #accessing }
MOModelTryCatchBuilder >> finallyBlock: aBlock [
	^ finallyBlock := aBlock 
]

{ #category : #accessing }
MOModelTryCatchBuilder >> loadBuilderWithEntity: anEntity [

	self tryBlock: anEntity try.
	self catches: anEntity catches.
	self finallyBlock: anEntity finally
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
