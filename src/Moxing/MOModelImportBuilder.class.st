Class {
	#name : #MOModelImportBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'typeReference',
		'class',
		'file',
		'importsPackage'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #'as yet unclassified' }
MOModelImportBuilder >> buildImportFile [

	^ (self instantiate: MOFileImport)
		  from: file;
		  typeReference: typeReference;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelImportBuilder >> buildImportNamespace [

	^ self importsPackage
		  ifTrue: [ 
			  (self instantiate: MOImportPackage)
				  typeReference: typeReference;
				  yourself ]
		  ifFalse: [ 
			  (self instantiate: MOImport)
				  typeReference: typeReference;
				  yourself ]
]

{ #category : #accessing }
MOModelImportBuilder >> file: anAddress [ 
	file := anAddress 
]

{ #category : #'as yet unclassified' }
MOModelImportBuilder >> importAllTypesOnPackage: aString [

	importsPackage := true.
	self typeReference: (self packageReferenceBuilder
			 packageName: aString;
			 build)
]

{ #category : #accessing }
MOModelImportBuilder >> importType: aMOClass [

	self typeReference: (self typeReferenceBuilder
			 type: aMOClass;
			 build)
]

{ #category : #accessing }
MOModelImportBuilder >> importTypeName: aName [

	self typeReference: (self typeReferenceBuilder
			 fullName: aName;
			 build)
]

{ #category : #accessing }
MOModelImportBuilder >> importTypeReference: aReference [

	self typeReference: aReference
]

{ #category : #'as yet unclassified' }
MOModelImportBuilder >> importsFile [

	^ file isNotNil
]

{ #category : #'as yet unclassified' }
MOModelImportBuilder >> importsPackage [

	^ importsPackage ifNil: [ importsPackage := false ]
]

{ #category : #'as yet unclassified' }
MOModelImportBuilder >> privateBuild [

	^ self importsFile
		  ifTrue: [ self buildImportFile ]
		  ifFalse: [ self buildImportNamespace ]
]

{ #category : #accessing }
MOModelImportBuilder >> typeReference: aReference [

	typeReference := aReference
]
