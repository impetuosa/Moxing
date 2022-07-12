Class {
	#name : #MOInvocable,
	#superclass : #MOLanguageObject,
	#instVars : [
		'#parameters => MOContainmentSlot many',
		'#visibility => MOPropertySlot',
		'#modifiers => MOPropertySlot',
		'#block => MOContainmentSlot one',
		'#bindingKind => MOPropertySlot'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

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
MOInvocable >> hasBody [

	^ self language hasBody: self
]

{ #category : #accessing }
MOInvocable >> initialize [

	super initialize.
	parameters := OrderedCollection new.
	modifiers := OrderedCollection new
]

{ #category : #accessing }
MOInvocable >> isAbstract [

	^ self language isAbstractInvocable: self 
]

{ #category : #accessing }
MOInvocable >> isDeclaration [

	^ true
]

{ #category : #accessing }
MOInvocable >> isDefinedInLibrary [

	^ self modifiers includes: #DefinedInLibrary
]

{ #category : #accessing }
MOInvocable >> isDynamicBinding [
	^ self bindingKind = #dynamic.
]

{ #category : #accessing }
MOInvocable >> isFunction [

	^ false
]

{ #category : #accessing }
MOInvocable >> isInvocable [

	^ true
]

{ #category : #accessing }
MOInvocable >> isOnlySignature [ 

	^ self language isOnlySignature:self 
]

{ #category : #accessing }
MOInvocable >> isProcedure [

	^ false
]

{ #category : #accessing }
MOInvocable >> isSameEntity: anOther [

	^ (super isSameEntity: anOther) and: [ 
		  self parameters size = anOther parameters size and: [ 
			  (self parameters
				   with: anOther parameters
				   collect: [ :p1 :p2 | 
				   p1 typeReference name = p2 typeReference name ]) allSatisfy:
				  #yourself ] ]
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

	^ modifiers reject: [ :a | a = #DefinedInLibrary ]
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

{ #category : #private }
MOInvocable >> senders [

	^ self model references
		  select: [ :r | r candidate = self ]
		  thenCollect: [ :e | e callingInvocable ]
]

{ #category : #accessing }
MOInvocable >> setStaticBinding [
	bindingKind := #static.
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
