Class {
	#name : #MOModelImportBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'typeReference',
		'typeReferences',
		'class',
		'file'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #accessing }
MOModelImportBuilder >> addTypeReference: aTypeReference [

	self typeReferences add: aTypeReference
]

{ #category : #building }
MOModelImportBuilder >> build [

	^ file
		  ifNil: [ 
			  (self instantiate: MOImport)
				  typeReferences: typeReferences;
				  yourself ]
		  ifNotNil: [ 
			  (self instantiate: MOFileImport)
				  from: file;
				  typeReferences: typeReferences;
				  yourself ]
]

{ #category : #accessing }
MOModelImportBuilder >> file: anAddress [ 
	file := anAddress 
]

{ #category : #accessing }
MOModelImportBuilder >> importType: aMOClass [

	self addTypeReference: (self typeReferenceBuilder
			 type: aMOClass;
			 build)
]

{ #category : #accessing }
MOModelImportBuilder >> importTypeName: aName [

	self addTypeReference: (self typeReferenceBuilder
			 name: aName;
			 build)
]

{ #category : #accessing }
MOModelImportBuilder >> importTypeReference: aReference [ 
	self addTypeReference: aReference.
]

{ #category : #accessing }
MOModelImportBuilder >> typeReferences [

	^ typeReferences ifNil: [ typeReferences := OrderedCollection new ]
]
