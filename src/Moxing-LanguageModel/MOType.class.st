Class {
	#name : #MOType,
	#superclass : #MOLanguageObject,
	#instVars : [
		'package',
		'modifiers',
		'visibility'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #accessing }
MOType >> addModifier: aModifier [

	modifiers add: aModifier
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
MOType >> visibility [
	^ visibility
]

{ #category : #accessing }
MOType >> visibility: aVisibility [ 
	
	visibility :=  aVisibility 
]