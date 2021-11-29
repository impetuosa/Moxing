Class {
	#name : #MOModelImportLinker,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #'Moxing-Core'
}

{ #category : #'as yet unclassified' }
MOModelImportLinker >> ensureAllDependentTypesExists: aMOClass [

	| references |
	references := aMOClass inheritanceTypeReferences.
	references do: [ :m | 
		(self getType: m)
			ifEmpty: [ self install: m ]
			ifNotEmpty: [ :a | m candidate: a anyOne ] ]
]

{ #category : #visiting }
MOModelImportLinker >> getCatalogType: aMOTypeReference [

	| packageReference typeName catalogType |
	packageReference := aMOTypeReference parent.

	catalogType := (model catalog typesNamed: aMOTypeReference name) 
		               select: [ :t | 
			               t parent isNotNil and: [ 
				               t parent name = packageReference name ] ].


	^ catalogType
]

{ #category : #visiting }
MOModelImportLinker >> getCatalogTypes: aMOPackageReference [

	| catalogTypes |
	catalogTypes := model catalog typeDefinedInPackage:
		                aMOPackageReference name.
	^ catalogTypes
]

{ #category : #visiting }
MOModelImportLinker >> getType: aMOTypeReference [

	| packageReference types |
	packageReference := aMOTypeReference parent.

	types := (model typesNamed: aMOTypeReference name) select: [ :t | 
		         t parent isNotNil and: [ 
			         t parent name = packageReference name ] ].


	^ types
]

{ #category : #visiting }
MOModelImportLinker >> install: aMOTypeReference [

	| typeOrEmpty installedType |
	typeOrEmpty := self getCatalogType: aMOTypeReference.

	typeOrEmpty ifNotEmpty: [ 
		self ensureAllDependentTypesExists: typeOrEmpty first.
		installedType := MOCatalogTypeInstaller new
			                 install: typeOrEmpty first
			                 into: model.
		aMOTypeReference candidate: installedType ]
]

{ #category : #visiting }
MOModelImportLinker >> installAll: aMOPackageReference [

	| types installedTypes |
	types := self getCatalogTypes: aMOPackageReference.

	installedTypes := types collect: [ :type | 
		                  self ensureAllDependentTypesExists: type.
		                  MOCatalogTypeInstaller new
			                  install: type
			                  into: model ].
	aMOPackageReference candidate types addAll: installedTypes
]

{ #category : #visiting }
MOModelImportLinker >> model: aModel [

	model := aModel
]

{ #category : #visiting }
MOModelImportLinker >> visitCollection: aCollection [

	^ aCollection collect: [ :a | a acceptVisitor: self ]
]

{ #category : #visiting }
MOModelImportLinker >> visitDependency: import [

	import typeReference candidate ifNil: [ 
		import typeReference parent candidate types
			detect: [ :type | type name = import typeReference name ]
			ifFound: [ :type | import typeReference candidate: type ]
			ifNone: [ self install: import typeReference ] ]
]

{ #category : #visiting }
MOModelImportLinker >> visitPackageDependency: aMOImportPackage [ 
	self assert: 
	aMOImportPackage typeReference candidate isNotNil. 
	aMOImportPackage typeReference candidate types ifEmpty: [ 
		 self installAll: aMOImportPackage typeReference 
  ].
	
	"
	
	ifNil: [ 
		import typeReference parent candidate types
			detect: [ :type | type name = import typeReference name ]
			ifFound: [ :type | import typeReference candidate: type ]
			ifNone: [ self install: import typeReference ] ]"
]
