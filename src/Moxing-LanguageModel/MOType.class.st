Class {
	#name : #MOType,
	#superclass : #MOLanguageObject,
	#instVars : [
		'modifiers',
		'visibility',
		'packageReference'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #accessing }
MOType >> addModifier: aModifier [

	modifiers add: aModifier
]

{ #category : #accessing }
MOType >> fullName [
	self shouldBeImplemented.
]

{ #category : #accessing }
MOType >> initialize [

	super initialize.
	modifiers := OrderedCollection new
]

{ #category : #accessing }
MOType >> modifiers [
	^ modifiers
]

{ #category : #accessing }
MOType >> modifiers: aSet [
	modifiers := aSet
]

{ #category : #accessing }
MOType >> packageReference [

	^ packageReference
]

{ #category : #accessing }
MOType >> visibility [
	^ visibility
]

{ #category : #accessing }
MOType >> visibility: aVisibility [ 
	
	visibility :=  aVisibility 
]
