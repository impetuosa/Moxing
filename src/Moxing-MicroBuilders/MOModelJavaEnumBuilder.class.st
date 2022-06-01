Class {
	#name : #MOModelJavaEnumBuilder,
	#superclass : #MOModelClassBuilder,
	#instVars : [
		'entries'
	],
	#category : #'Moxing-MicroBuilders-types'
}

{ #category : #adding }
MOModelJavaEnumBuilder >> addEnumEntry: aMOEnumEntry [

	self entries add: aMOEnumEntry
]

{ #category : #adding }
MOModelJavaEnumBuilder >> buildsType [

	^ MOJavaEnum
]

{ #category : #adding }
MOModelJavaEnumBuilder >> entries [

	^ entries ifNil: [ entries := OrderedCollection new ]
]

{ #category : #adding }
MOModelJavaEnumBuilder >> entries: aCollection [ 
	entries := aCollection
]

{ #category : #adding }
MOModelJavaEnumBuilder >> loadBuilderWithEntity: aMOEnum [

	super loadBuilderWithEntity: aMOEnum.
	self entries: aMOEnum entries
]

{ #category : #adding }
MOModelJavaEnumBuilder >> privateBuild [

	^ super privateBuild
		  entries: self entries;
		  yourself
]
