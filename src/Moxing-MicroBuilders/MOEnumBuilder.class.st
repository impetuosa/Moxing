Class {
	#name : #MOEnumBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'name',
		'entries',
		'visibility',
		'modifiers'
	],
	#category : #'Moxing-MicroBuilders-types'
}

{ #category : #adding }
MOEnumBuilder >> addEnumEntry: aMOEnumEntry [

	self entries add: aMOEnumEntry
]

{ #category : #adding }
MOEnumBuilder >> addModifier: aString [

	(#( protected private public ) includes: aString) ifTrue: [ 
		^ self visibility: aString ].
	self halt
]

{ #category : #asserting }
MOEnumBuilder >> buildsType [

	^ MOEnum
]

{ #category : #accessing }
MOEnumBuilder >> entries [

	^ entries ifNil: [ entries := OrderedCollection new ]
]

{ #category : #accessing }
MOEnumBuilder >> entries: aCollection [ 
	entries := aCollection
]

{ #category : #accessing }
MOEnumBuilder >> loadBuilderWithEntity: aMOEnum [

	self name: aMOEnum name.
	self entries: aMOEnum entries.
	self visibility: aMOEnum visibility.
	self modifiers: aMOEnum modifiers. 
]

{ #category : #generated }
MOEnumBuilder >> modifiers [

	^ modifiers
]

{ #category : #generated }
MOEnumBuilder >> modifiers: aCollection [

	modifiers := aCollection
]

{ #category : #accessing }
MOEnumBuilder >> name [
	^ name
]

{ #category : #accessing }
MOEnumBuilder >> name: aString [ 
	name := aString
]

{ #category : #accessing }
MOEnumBuilder >> privateBuild [

	^ (self instantiate: self buildsType)
		  name: self name;
		  visibility: self visibility;
		  entries: self entries;
		  modifiers: self modifiers;
		  yourself
]

{ #category : #accessing }
MOEnumBuilder >> visibility [
	^ visibility
]

{ #category : #accessing }
MOEnumBuilder >> visibility: aString [

	visibility := aString
]
