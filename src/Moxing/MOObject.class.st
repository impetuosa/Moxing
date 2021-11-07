Class {
	#name : #MOObject,
	#superclass : #Object,
	#instVars : [
		'name',
		'anchor'
	],
	#category : #'Moxing-Core'
}

{ #category : #accessing }
MOObject >> anchor: aFileReference [ 
	anchor := aFileReference asMOAnchor .
]

{ #category : #accessing }
MOObject >> mustBeSaved [
	^ false
]

{ #category : #accessing }
MOObject >> name [

	^ name  
]

{ #category : #accessing }
MOObject >> name: aString [ 
	name := aString
]
