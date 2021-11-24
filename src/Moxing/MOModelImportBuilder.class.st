Class {
	#name : #MOModelImportBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'typeReference',
		'typeReferences'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #accessing }
MOModelImportBuilder >> addTypeReference: aTypeReference [

	self typeReferences add: aTypeReference
]

{ #category : #building }
MOModelImportBuilder >> build [

	^ (self instantiate: MOImport) typeReferences: typeReferences
]

{ #category : #accessing }
MOModelImportBuilder >> importType: aMOClass [

	self addTypeReference: (self typeReferenceBuilder
			 type: aMOClass;
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
