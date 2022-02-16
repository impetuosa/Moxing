Class {
	#name : #MOModule,
	#superclass : #MOLanguageObject,
	#instVars : [
		'#invocables => MOContainmentSlot many',
		'#attributes => MOContainmentSlot many',
		'#packageReference => MOReferenceSlot one',
		'#types => MOContainmentSlot many'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MOModule >> acceptVisitor: aMOModelWriteTypeBasedCopyResolver [

	^ aMOModelWriteTypeBasedCopyResolver visitModule: self
]

{ #category : #accessing }
MOModule >> attributes [
	^ attributes
]

{ #category : #accessing }
MOModule >> attributes: aCollection [ 
	attributes := aCollection
]

{ #category : #generated }
MOModule >> imports [
	^ {  }
]

{ #category : #adding }
MOModule >> initialize [

	super initialize.
	invocables := OrderedCollection new
]

{ #category : #accessing }
MOModule >> invocables [
	^ invocables
]

{ #category : #accessing }
MOModule >> invocables: aCollection [ 
	invocables := aCollection
]

{ #category : #adding }
MOModule >> packageReference [

	^ packageReference
]

{ #category : #accessing }
MOModule >> types [
	^ types
]

{ #category : #accessing }
MOModule >> types: aCollection [

	types := aCollection
]
