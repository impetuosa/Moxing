Class {
	#name : #MOInvocable,
	#superclass : #MOLanguageObject,
	#instVars : [
		'#parameters => MOContainmentSlot many',
		'#visibility => MOPropertySlot',
		'#modifiers => MOPropertySlot',
		'#block => MOContainmentSlot one',
		'#thrownTypeReferences => MOReferenceSlot many',
		'#typeParameters => MOContainmentSlot many',
		'#annotationInstances => MOReferenceSlot many',
		'#bindingKind => MOPropertySlot'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #'as yet unclassified' }
MOInvocable >> annotationInstances [

	^ annotationInstances
]

{ #category : #accessing }
MOInvocable >> annotationInstances: aCollection [

	annotationInstances := aCollection
]

{ #category : #accessing }
MOInvocable >> bindingKind [

	^ bindingKind
]

{ #category : #accessing }
MOInvocable >> bindingKind: aString [ 
	bindingKind := aString
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
MOInvocable >> isDynamicBinding [
	^ self bindingKind = #dynamic.
]

{ #category : #accessing }
MOInvocable >> isInvocable [

	^ true
]

{ #category : #accessing }
MOInvocable >> isStaticBinding [
	^ self bindingKind = #static.
]

{ #category : #accessing }
MOInvocable >> localVariables [

	^ block statements select: [ :s | s isVariable ]
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
MOInvocable >> setStaticBinding [
	bindingKind := #static.
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
MOInvocable >> typeParameters: aCollection [ 
	typeParameters := aCollection
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
