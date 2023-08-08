Class {
	#name : #MOModelFileImportBuilder,
	#superclass : #MOModelImportBuilder,
	#instVars : [
		'file'
	],
	#category : #'Moxing-Language-MicroBuilders-statements'
}

{ #category : #accessing }
MOModelFileImportBuilder >> addReference: aMOTypeReference [

	self typeReferences add: aMOTypeReference
]

{ #category : #accessing }
MOModelFileImportBuilder >> file [

	^ file
]

{ #category : #accessing }
MOModelFileImportBuilder >> file: anAddress [ 
	file := anAddress 
]

{ #category : #accessing }
MOModelFileImportBuilder >> privateBuild [

	^ (self instantiate: MOFileImport)
		  from: file;
		  typeReferences: self typeReferences;
		  yourself
]

{ #category : #accessing }
MOModelFileImportBuilder >> typeReferences [

	^ typeReference ifNil: [ typeReference := OrderedCollection new ]
]
