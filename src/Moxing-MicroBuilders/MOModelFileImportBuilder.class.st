Class {
	#name : #MOModelFileImportBuilder,
	#superclass : #MOModelImportBuilder,
	#instVars : [
		'file',
		'importsAll'
	],
	#category : #'Moxing-MicroBuilders-statements'
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
MOModelFileImportBuilder >> importsAll [

	^ importsAll ifNil: [ false ]
]

{ #category : #accessing }
MOModelFileImportBuilder >> importsAll: aBoolean [

	importsAll := aBoolean
]

{ #category : #accessing }
MOModelFileImportBuilder >> loadBuilderWithEntity: anEntity [

	self
		file: anEntity from;
		typeReferences: anEntity typeReferences;
		importsAll: anEntity importsAll
]

{ #category : #accessing }
MOModelFileImportBuilder >> privateBuild [

	^ (self instantiate: MOFileImport)
		  from: file;
		  typeReferences: self typeReferences;
		  importsAll: self importsAll;
		  yourself
]

{ #category : #accessing }
MOModelFileImportBuilder >> typeReferences [

	^ typeReference ifNil: [ typeReference := OrderedCollection new ]
]

{ #category : #accessing }
MOModelFileImportBuilder >> typeReferences: aCollection [

	typeReference := aCollection
]
