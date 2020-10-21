Class {
	#name : #MOTypescriptTemplatedConstructor,
	#superclass : #MOTypescriptObject,
	#instVars : [
		'body',
		'parameters',
		'type',
		'class'
	],
	#category : #'Moxing-ModelTS'
}

{ #category : #'as yet unclassified' }
MOTypescriptTemplatedConstructor >> acceptVisitor: aJinInspectorBuilder [ 
	aJinInspectorBuilder visitTypescriptTemplatedConstructor: self 
]

{ #category : #'as yet unclassified' }
MOTypescriptTemplatedConstructor >> body [
	^ body
]

{ #category : #'as yet unclassified' }
MOTypescriptTemplatedConstructor >> body: aString [ 
	body := aString
]

{ #category : #'as yet unclassified' }
MOTypescriptTemplatedConstructor >> dependencies [
	^ parameters flatCollect: [ :p | p dependencies ]
]

{ #category : #'as yet unclassified' }
MOTypescriptTemplatedConstructor >> parameters [
	^ parameters
]

{ #category : #'as yet unclassified' }
MOTypescriptTemplatedConstructor >> parameters: aCollection [ 
	parameters := aCollection
]

{ #category : #'as yet unclassified' }
MOTypescriptTemplatedConstructor >> setOwnerClass: aClassObject [ 
	class := aClassObject 
	
]

{ #category : #'as yet unclassified' }
MOTypescriptTemplatedConstructor >> type [
	^ class 
]
