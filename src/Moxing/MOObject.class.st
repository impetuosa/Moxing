Class {
	#name : #MOObject,
	#superclass : #Object,
	#instVars : [
		'type',
		'state'
	],
	#category : #'Moxing-Core'
}

{ #category : #accessing }
MOObject >> at: name put: aValue [ 
	state at: name put: aValue 
]

{ #category : #accessing }
MOObject >> state [

	^ state ifNil: [ state := Dictionary new ].
	
]

{ #category : #accessing }
MOObject >> type: aType [ 
	 type := aType 
]
