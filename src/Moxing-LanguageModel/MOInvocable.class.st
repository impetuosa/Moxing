Class {
	#name : #MOInvocable,
	#superclass : #MOLanguageObject,
	#instVars : [
		'parameters',
		'class',
		'visibility',
		'modifiers',
		'block',
		'thrownTypeReferences',
		'typeParameters'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #adding }
MOInvocable >> addAnnotationInstance: aMOAnnotationInstance [

	self annotations add: aMOAnnotationInstance
]

{ #category : #adding }
MOInvocable >> addModifier: aString [

	modifiers add: aString
]

{ #category : #adding }
MOInvocable >> addParameter: aJinVariable [ 
	parameters add: aJinVariable 
]

{ #category : #adding }
MOInvocable >> addTypeParameter: aMOTypeParameter [

	self typeParameters add: aMOTypeParameter
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

{ #category : #generated }
MOInvocable >> hierarchicalChildren [

	^ self parameters , self annotations , self typeParameters
	  , { self block }
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
MOInvocable >> thrownTypeReferences [
	^ thrownTypeReferences
]

{ #category : #'as yet unclassified' }
MOInvocable >> thrownTypeReferences: aCollection [

	thrownTypeReferences := aCollection
]

{ #category : #generated }
MOInvocable >> typeParameters [

	^ typeParameters ifNil: [ typeParameters := OrderedCollection new ]
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
