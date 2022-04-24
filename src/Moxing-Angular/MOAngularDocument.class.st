Class {
	#name : #MOAngularDocument,
	#superclass : #MOLanguageObject,
	#instVars : [
		'#document => MOPropertySlot'
	],
	#category : #'Moxing-Angular-Model'
}

{ #category : #visiting }
MOAngularDocument >> acceptVisitor: aJinInspectorBuilder [ 
	^ aJinInspectorBuilder visitAngularComponentTemplate: self 
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
MOAngularDocument >> isRenamable [
	^ false
]

{ #category : #accessing }
MOAngularDocument >> produceCode [
	^ document
]

{ #category : #accessing }
MOAngularDocument >> producesParseableCode [

	^ true
]
