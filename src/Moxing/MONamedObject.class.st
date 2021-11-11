Class {
	#name : #MONamedObject,
	#superclass : #MOObject,
	#instVars : [
		'name'
	],
	#category : #'Moxing-Core'
}

{ #category : #accessing }
MONamedObject >> name [

	^ name  
]

{ #category : #accessing }
MONamedObject >> name: aString [ 
	aString ifNil: [ self halt ].
	name := aString
]
