Class {
	#name : #MOModelBreakBuilder,
	#superclass : #MOModelBuilderDelegate,
	#category : #'Moxing-Language-MicroBuilders-Statements'
}

{ #category : #asserting }
MOModelBreakBuilder >> buildsType [

	^ MOBreak
]

{ #category : #asserting }
MOModelBreakBuilder >> privateBuild [

	^ self instantiate: self buildsType
]
