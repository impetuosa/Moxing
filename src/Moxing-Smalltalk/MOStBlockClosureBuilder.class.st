Class {
	#name : #MOStBlockClosureBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'operator',
		'left',
		'right',
		'block'
	],
	#category : #'Moxing-Smalltalk-builer'
}

{ #category : #asserting }
MOStBlockClosureBuilder >> block [

	^ block ifNil: [ self error: 'block is nil' ]
]

{ #category : #asserting }
MOStBlockClosureBuilder >> block: aBlock [

	block := aBlock
]

{ #category : #asserting }
MOStBlockClosureBuilder >> buildsType [

	^ MOStBlockClosure
]

{ #category : #asserting }
MOStBlockClosureBuilder >> loadBuilderWithEntity: aClosure [

	self block: aClosure block
]

{ #category : #asserting }
MOStBlockClosureBuilder >> privateBuild [

	^ (self instantiate: self buildsType)
		  block: self block;
		  yourself
]
