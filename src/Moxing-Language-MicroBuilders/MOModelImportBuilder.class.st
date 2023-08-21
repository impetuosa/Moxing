"
I build imports
"
Class {
	#name : #MOModelImportBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'typeReference',
		'packageReference'
	],
	#category : #'Moxing-Language-MicroBuilders-Statements'
}

{ #category : #'as yet unclassified' }
MOModelImportBuilder >> importAllTypesOnPackage: aString [

	self assert: self typeReference isNil.
	self packageReference: (self packageReferenceBuilder
			 packageName: aString;
			 build)
]

{ #category : #accessing }
MOModelImportBuilder >> importType: aMOClass [

	self typeReference: (self typeReferenceBuilder
			 type: aMOClass;
			 build).
	self packageReference: aMOClass packageReference copy
]

{ #category : #accessing }
MOModelImportBuilder >> importTypeReference: aReference [
	self typeReference: aReference.
	aReference packageReference ifNotNil: [ :pr | 
		self packageReference: pr ]
]

{ #category : #'as yet unclassified' }
MOModelImportBuilder >> importsPackage [

	^ typeReference isNil
]

{ #category : #'as yet unclassified' }
MOModelImportBuilder >> packageReference [
	^ packageReference ifNil: [ self error: 'Package reference is compulsory for an import ' ]
]

{ #category : #accessing }
MOModelImportBuilder >> packageReference: aMOPackageReference [

	packageReference := aMOPackageReference
]

{ #category : #'as yet unclassified' }
MOModelImportBuilder >> privateBuild [

	^ (self instantiate: MOImport)
		  packageReference: self packageReference;
		  typeReference: self typeReference;
		  yourself
]

{ #category : #accessing }
MOModelImportBuilder >> typeReference [

	^ typeReference
]

{ #category : #accessing }
MOModelImportBuilder >> typeReference: aReference [

	typeReference := aReference
]
