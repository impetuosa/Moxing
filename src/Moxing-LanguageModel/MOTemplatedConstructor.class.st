Class {
	#name : #MOTemplatedConstructor,
	#superclass : #MOLanguageObject,
	#instVars : [
		'body',
		'parameters',
		'type',
		'class'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #'as yet unclassified' }
MOTemplatedConstructor >> acceptVisitor: aJinInspectorBuilder [ 
	aJinInspectorBuilder visitTemplatedConstructor: self 
]

{ #category : #'as yet unclassified' }
MOTemplatedConstructor >> body [
	^ body
]

{ #category : #'as yet unclassified' }
MOTemplatedConstructor >> body: aString [ 
	body := aString
]

{ #category : #'as yet unclassified' }
MOTemplatedConstructor >> dependencies [
	^ parameters flatCollect: [ :p | p dependencies ]
]

{ #category : #'as yet unclassified' }
MOTemplatedConstructor >> parameters [
	^ parameters
]

{ #category : #'as yet unclassified' }
MOTemplatedConstructor >> parameters: aCollection [ 
	parameters := aCollection
]

{ #category : #'as yet unclassified' }
MOTemplatedConstructor >> setOwnerClass: aClassObject [ 
	class := aClassObject 
	
]

{ #category : #'as yet unclassified' }
MOTemplatedConstructor >> type [
	^ class 
]
