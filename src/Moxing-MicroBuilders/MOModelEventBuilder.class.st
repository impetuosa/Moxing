Class {
	#name : #MOModelEventBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'selector',
		'parameters'
	],
	#category : #'Moxing-MicroBuilders-invocables'
}

{ #category : #adding }
MOModelEventBuilder >> addParameter: aMOParameter [ 
	self parameters add: aMOParameter 
]

{ #category : #asserting }
MOModelEventBuilder >> buildsType [

	<generated>
	^ MOEvent
]

{ #category : #asserting }
MOModelEventBuilder >> loadBuilderWithEntity: anEntity [

	self parameters: anEntity parameters.
	self selector: anEntity selector
]

{ #category : #asserting }
MOModelEventBuilder >> parameters [

	^ parameters ifNil: [ parameters := OrderedCollection new ]
]

{ #category : #asserting }
MOModelEventBuilder >> parameters: anObject [

	parameters := anObject
]

{ #category : #asserting }
MOModelEventBuilder >> privateBuild [

	^ (self instantiate: self buildsType)
		  parameters: self parameters;
		  selector: self selector;
		  yourself
]

{ #category : #asserting }
MOModelEventBuilder >> selector [
	^ selector ifNil: [ self error: ' Selector is Nil ' ]
]

{ #category : #asserting }
MOModelEventBuilder >> selector: aString [ 
	selector := aString  
]
