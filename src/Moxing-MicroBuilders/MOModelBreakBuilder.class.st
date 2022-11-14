Class {
	#name : #MOModelBreakBuilder,
	#superclass : #MOModelBuilderDelegate,
	#category : #'Moxing-MicroBuilders-statements'
}

{ #category : #asserting }
MOModelBreakBuilder >> buildsType [

	^ MOBreak
]

{ #category : #asserting }
MOModelBreakBuilder >> privateBuild [

	^ self instantiate: self buildsType
]
