Class {
	#name : #MOOnErrorGoToToTryCatchTransform,
	#superclass : #MOModelToModelTransform,
	#instVars : [
		'block',
		'entries'
	],
	#category : #'Moxing-LanguageModel-Transform'
}

{ #category : #'as yet unclassified' }
MOOnErrorGoToToTryCatchTransform class >> appliesToStatement: aMOOnErrorGoToLabel [

	^ MOErrorGoToPolicy appliesToStatement: aMOOnErrorGoToLabel
]

{ #category : #'as yet unclassified' }
MOOnErrorGoToToTryCatchTransform >> apply: aMOOnErrorGoToLabel model: aMOModel [ 
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
MOOnErrorGoToToTryCatchTransform >> calculateNewNodeFor: aMOOnErrorGoToLabel onTheContext: aMOBlock with: aMOTransformationApplier [ 
	self ensureStillAnalysingSameBlock: aMOBlock.
	self registerInterestingEntry: aMOOnErrorGoToLabel from: aMOBlock 
]

{ #category : #'as yet unclassified' }
MOOnErrorGoToToTryCatchTransform >> endTransformation: aMOTransformationApplier [

	entries size = 1
		ifTrue: [ self replaceByNoop: aMOTransformationApplier ]
		ifFalse: [ self halt ]
]

{ #category : #'as yet unclassified' }
MOOnErrorGoToToTryCatchTransform >> ensureStillAnalysingSameBlock: aMOBlock [

	block
		ifNil: [ block := aMOBlock ]
		ifNotNil: [ self assert: block = aMOBlock ]
]

{ #category : #accessing }
MOOnErrorGoToToTryCatchTransform >> entries [
	^ entries ifNil: [ entries := Dictionary new ]
]

{ #category : #'as yet unclassified' }
MOOnErrorGoToToTryCatchTransform >> registerInterestingEntry: aMOOnErrorGoToLabel from: aMOBlock [

	self entries
		at: aMOOnErrorGoToLabel class
		put: (aMOBlock statements indexOf: aMOOnErrorGoToLabel)
]

{ #category : #'as yet unclassified' }
MOOnErrorGoToToTryCatchTransform >> replaceByNoop: aMOTransformationApplier [

	self assert: entries keys size = 1.
	aMOTransformationApplier
		instantiate: MONoOp
		for: (block statements at: entries values first)
]
