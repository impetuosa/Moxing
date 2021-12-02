Class {
	#name : #MOTypescriptAbstractLoader,
	#superclass : #JSProgramNodeVisitor,
	#instVars : [
		'writer'
	],
	#classInstVars : [
		'parent'
	],
	#category : #'Moxing-Typescript-Loader'
}

{ #category : #actions }
MOTypescriptAbstractLoader class >> loadArtefact: anAst writer: aWriter [ 

	| loader |
	loader := self new.
	loader writer: aWriter.
	^ loader loadArtefact: anAst
]

{ #category : #accessing }
MOTypescriptAbstractLoader >> any [

	^ writer typeReferenceNamed: #any
]

{ #category : #generated }
MOTypescriptAbstractLoader >> use: aWriter during: aBlock [

	| prev |
	prev := writer.
	writer := aWriter.
	aBlock ensure: [ writer := prev ]
]

{ #category : #visiting }
MOTypescriptAbstractLoader >> visitCollection: aCollection [

	^ aCollection collect: [ :a | a acceptVisitor: self ]
]

{ #category : #accessing }
MOTypescriptAbstractLoader >> writer: aWriter [ 
	writer := aWriter
]
