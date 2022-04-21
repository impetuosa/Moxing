Class {
	#name : #MOType,
	#superclass : #MOLanguageObject,
	#instVars : [
		'#modifiers => MOPropertySlot',
		'#visibility => MOPropertySlot',
		'#packageReference => MOExpressionSlot one'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MOType >> addModifier: aModifier [

	modifiers add: aModifier
]

{ #category : #accessing }
MOType >> canBeReferredAsType [
	 ^ true
]

{ #category : #accessing }
MOType >> fullName [

	^ (packageReference ifNotNil: [ : p  |  p name , '.'  ] ifNil: [ '' ]), self name
]

{ #category : #accessing }
MOType >> initialize [

	super initialize.
	modifiers := OrderedCollection new
]

{ #category : #accessing }
MOType >> isDeclaration [

	^ true
]

{ #category : #accessing }
MOType >> isType [ 
	 ^ true 
]

{ #category : #accessing }
MOType >> isWidget [ 
 	 ^ false 
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

{ #category : #'as yet unclassified' }
MOType >> packageReference: aPackageReference [
	packageReference := aPackageReference
]

{ #category : #accessing }
MOType >> visibility [
	^ visibility
]

{ #category : #accessing }
MOType >> visibility: aVisibility [ 
	
	visibility :=  aVisibility 
]
