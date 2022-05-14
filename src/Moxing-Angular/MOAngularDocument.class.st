Class {
	#name : #MOAngularDocument,
	#superclass : #MOLanguageObject,
	#instVars : [
		'#document => MOPropertySlot'
	],
	#category : #'Moxing-Angular-Model'
}

{ #category : #accessing }
MOAngularDocument class >> isRenamable [
	^ false
]

{ #category : #accessing }
MOAngularDocument >> document [ 
	 ^ document 
]

{ #category : #accessing }
MOAngularDocument >> document: aFileReference [ 
	document := aFileReference
]

{ #category : #accessing }
MOAngularDocument >> produceCode [

	^ document printString
]

{ #category : #accessing }
MOAngularDocument >> producesParseableCode [

	^ true
]
