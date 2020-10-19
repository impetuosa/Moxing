Class {
	#name : #MOAngularObject,
	#superclass : #Object,
	#instVars : [
		'path',
		'metadata'
	],
	#category : #'Moxing-Model'
}

{ #category : #accessing }
MOAngularObject >> mustBeSaved [
	^ false
]

{ #category : #accessing }
MOAngularObject >> path: aFileReference [ 
	path := aFileReference
]
