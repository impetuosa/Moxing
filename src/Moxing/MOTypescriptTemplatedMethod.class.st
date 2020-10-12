Class {
	#name : #MOTypescriptTemplatedMethod,
	#superclass : #MOTypescriptMethod,
	#instVars : [
		'body'
	],
	#category : #'Moxing-ModelTS'
}

{ #category : #'as yet unclassified' }
MOTypescriptTemplatedMethod >> acceptVisitor: aJinInspectorBuilder [ 
	aJinInspectorBuilder visitTypescriptTemplatedMethod: self 
]

{ #category : #'as yet unclassified' }
MOTypescriptTemplatedMethod >> body [
	^ body
]

{ #category : #'as yet unclassified' }
MOTypescriptTemplatedMethod >> body: aString [ 
	body := aString 
]
