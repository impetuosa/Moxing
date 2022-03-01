Class {
	#name : #MOModelReader,
	#superclass : #Object,
	#instVars : [
		'read',
		'writer'
	],
	#category : #'Moxing-Reader'
}

{ #category : #accessing }
MOModelReader >> model: aModel [

	writer := aModel writer
]

{ #category : #'as yet unclassified' }
MOModelReader >> read: anEntity [

	self subclassResponsibility
]

{ #category : #accessing }
MOModelReader >> use: aWriter during: aBlock [

	| prev |
	prev := writer.
	writer := aWriter.
	^ aBlock ensure: [ writer := prev ]
]
