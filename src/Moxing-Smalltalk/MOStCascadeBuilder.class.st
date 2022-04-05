Class {
	#name : #MOStCascadeBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'invocations'
	],
	#category : #'Moxing-Smalltalk-builer'
}

{ #category : #asserting }
MOStCascadeBuilder >> buildsType [

	^ MOStCascade
]

{ #category : #asserting }
MOStCascadeBuilder >> invocations [

	^ invocations ifNil: [ invocations := OrderedCollection new ]
]

{ #category : #asserting }
MOStCascadeBuilder >> invocations: aCol [

	invocations := aCol
]

{ #category : #asserting }
MOStCascadeBuilder >> loadBuilderWithEntity: anEntity [

	self invocations: anEntity invocations
]

{ #category : #asserting }
MOStCascadeBuilder >> privateBuild [

	^ (self instantiate: self buildsType)
		  invocations: self invocations;
		  yourself
]
