Class {
	#name : #MOStBlockClosureBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'block',
		'parameters'
	],
	#category : #'Moxing-Smalltalk-Builer'
}

{ #category : #adding }
MOStBlockClosureBuilder >> addParameter: aMOParameter [
  self parameters add: aMOParameter
]

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
  self block: aClosure block.
  self parameters: aClosure parameters
]

{ #category : #asserting }
MOStBlockClosureBuilder >> parameters [
  ^parameters ifNil: [ parameters := OrderedCollection new ]
]

{ #category : #accessing }
MOStBlockClosureBuilder >> parameters: anObject [

	parameters := anObject
]

{ #category : #asserting }
MOStBlockClosureBuilder >> privateBuild [

	^ (self instantiate: self buildsType)
		  block: self block;
		  parameters: self parameters; 
		  yourself
]
