Class {
	#name : #MOModelThrowBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'argument'
	],
	#category : #'Moxing-Language-MicroBuilders-invocables'
}

{ #category : #accessing }
MOModelThrowBuilder >> argument [

	^ argument
]

{ #category : #accessing }
MOModelThrowBuilder >> argument: anObject [

	argument := anObject
]

{ #category : #asserting }
MOModelThrowBuilder >> buildsType [

	^ MOThrow
]

{ #category : #accessing }
MOModelThrowBuilder >> loadBuilderWithEntity: anEntity [

	self argument: anEntity argument
]

{ #category : #accessing }
MOModelThrowBuilder >> privateBuild [

	^ (self instantiate: self buildsType)
		  argument: self argument;
		  yourself
]
