Class {
	#name : #MOModelConstructorBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'body',
		'parameters'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #adding }
MOModelConstructorBuilder >> addParameter: aMOParameter [

	self parameters add: aMOParameter
]

{ #category : #accessing }
MOModelConstructorBuilder >> body [

	^ body ifNil: [ body := self instantiate: MOBlock ]
]

{ #category : #generated }
MOModelConstructorBuilder >> body: aMOBlock [  
	body := aMOBlock
]

{ #category : #building }
MOModelConstructorBuilder >> build [

	^ (self instantiate: MOConstructor)
		  parameters: self parameters;
		  block: self body;
		  yourself
]

{ #category : #generated }
MOModelConstructorBuilder >> parameters [

	^ parameters ifNil: [ parameters := OrderedCollection new ]
]
