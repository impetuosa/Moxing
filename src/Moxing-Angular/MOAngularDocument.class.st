Class {
	#name : #MOAngularDocument,
	#superclass : #MOLanguageObject,
	#instVars : [
		'#document => MOPropertySlot'
	],
	#category : #'Moxing-Angular-Model'
}

{ #category : #accessing }
MOAngularDocument >> document [ 
	 ^ document 
]

{ #category : #accessing }
MOAngularDocument >> document: aFileReference [ 
	document := aFileReference
]

{ #category : #accessing }
MOAngularDocument >> isRenamable [
	^ false
]

{ #category : #accessing }
MOAngularDocument >> produceCode [

	^ document printString
]

{ #category : #accessing }
MOAngularDocument >> producesParseableCode [

	^ true
]
