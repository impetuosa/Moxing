Class {
	#name : #MOInvocable,
	#superclass : #MOLanguageObject,
	#instVars : [
		'parameters',
		'class',
		'visibility',
		'modifiers',
		'block'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #adding }
MOInvocable >> addModifier: aString [

	modifiers add: aString
]

{ #category : #adding }
MOInvocable >> addParameter: aJinVariable [ 
	parameters add: aJinVariable 
]

{ #category : #accessing }
MOInvocable >> block [
	^ block
]

{ #category : #accessing }
MOInvocable >> block: aBlock [

	block := aBlock
]

{ #category : #accessing }
MOInvocable >> dependencies [

	^ (parameters flatCollect: [ :p | p dependencies ])
	  , block dependencies
]

{ #category : #accessing }
MOInvocable >> initialize [

	super initialize.
	parameters := OrderedCollection new.
	modifiers := OrderedCollection new
]

{ #category : #accessing }
MOInvocable >> modifiers [
	^ modifiers
]

{ #category : #accessing }
MOInvocable >> modifiers: aSet [
	modifiers := aSet
]

{ #category : #accessing }
MOInvocable >> parameters [
	^ parameters
]

{ #category : #accessing }
MOInvocable >> parameters: aCollection [ 
	parameters := aCollection
]

{ #category : #accessing }
MOInvocable >> setOwnerClass: aClassObject [ 
	class := aClassObject 
	
]

{ #category : #accessing }
MOInvocable >> variables [
	^ block variables
]

{ #category : #accessing }
MOInvocable >> visibility [
	^ visibility ifNil: [ #public ]
]

{ #category : #'as yet unclassified' }
MOInvocable >> visibility: aString [ 
	visibility := aString
]
