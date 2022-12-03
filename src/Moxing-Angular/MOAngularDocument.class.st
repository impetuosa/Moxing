Class {
	#name : #MOAngularDocument,
	#superclass : #MOLanguageConstruct,
	#instVars : [
		'#document => MOPropertySlot',
		'#name => MOPropertySlot'
	],
	#category : #'Moxing-Angular-DomainSpecific'
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
MOAngularDocument >> isDeclaration [

	^ true
]

{ #category : #accessing }
MOAngularDocument >> name [

	^ name
]

{ #category : #accessing }
MOAngularDocument >> name: aName [
 	name := aName
]

{ #category : #accessing }
MOAngularDocument >> produceCode [

	^ document printString
]

{ #category : #accessing }
MOAngularDocument >> producesParseableCode [

	^ true
]
