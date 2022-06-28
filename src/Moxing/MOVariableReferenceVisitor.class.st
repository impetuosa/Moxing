Class {
	#name : #MOVariableReferenceVisitor,
	#superclass : #Object,
	#instVars : [
		'writer'
	],
	#category : #'Moxing-Reader'
}

{ #category : #accessing }
MOVariableReferenceVisitor >> use: aWriter during: aBlock [

	| prev |
	prev := writer.
	writer := aWriter.
	^ aBlock ensure: [ writer := prev ]
]

{ #category : #accessing }
MOVariableReferenceVisitor >> writer: aMOClassWriter [ 
	writer := aMOClassWriter
]
