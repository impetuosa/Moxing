Class {
	#name : #MOInvocable,
	#superclass : #MOLanguageObject,
	#instVars : [
		'parameters',
		'class',
		'visibility',
		'variables',
		'modifiers'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #adding }
MOInvocable >> addParameter: aJinVariable [ 
	parameters add: aJinVariable 
]

{ #category : #adding }
MOInvocable >> addVariable: aMOVariable [ 
	variables add: aMOVariable 
]

{ #category : #accessing }
MOInvocable >> dependencies [

	^ parameters flatCollect: [ :p | p dependencies ]
]

{ #category : #accessing }
MOInvocable >> initialize [

	super initialize.
	parameters := OrderedCollection new.
	variables := OrderedCollection new
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
MOInvocable >> setOwnerClass: aClassObject [ 
	class := aClassObject 
	
]

{ #category : #accessing }
MOInvocable >> visibility [
	^ visibility ifNil: [ #public ]
]

{ #category : #'as yet unclassified' }
MOInvocable >> visibility: aString [ 
	visibility := aString
]
