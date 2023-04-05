Class {
	#name : #MOModelAngularJsSchemaBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'projects',
		'metadata',
		'directory'
	],
	#category : #'Moxing-AngularJS-MicroBuilders'
}

{ #category : #accessing }
MOModelAngularJsSchemaBuilder >> directory: aFileReference [ 
	directory := aFileReference
]

{ #category : #accessing }
MOModelAngularJsSchemaBuilder >> metadata: aCollection [ 
	metadata := aCollection
]
