"
I am in charge of installing and linking imported types. 
"
Class {
	#name : #MOModelImportLinker,
	#superclass : #MOModelDeclarationResolver,
	#instVars : [
		'model'
	],
	#category : #'Moxing-Linking'
}

{ #category : #'as yet unclassified' }
MOModelImportLinker >> ensureAllDependentTypesExists: aMOClass [

	| references |
	references := aMOClass inheritanceTypeReferences.
	references do: [ :m | 
		(self getType: m)
			ifEmpty: [ self install: m ]
			ifNotEmpty: [ :a | m referee: a anyOne ] ]
]

{ #category : #visiting }
MOModelImportLinker >> getCatalogType: aMOTypeReference from: packageReference [

	| catalogType |
	catalogType := (model catalog typesNamed: aMOTypeReference name) 
		               select: [ :t | 
			               t packageReference isNotNil and: [ 
				               t packageReference name = packageReference name ] ].


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
MOModelImportLinker >> getJavaTypes [

	| catalogTypes |
	catalogTypes := model catalog typeDefinedInPackageNameLike: [ :pack | 
		                pack name beginsWith: 'java.' ].
	^ catalogTypes
]

{ #category : #visiting }
MOModelImportLinker >> getType: aMOTypeReference [

	| packageReference types |
	packageReference := aMOTypeReference packageReference.

	types := (model typesNamed: aMOTypeReference name) select: [ :t | 
		         t packageReference isNotNil and: [ 
			         t packageReference name = packageReference name ] ].


	^ types
]

{ #category : #initialization }
MOModelImportLinker >> install: aMOTypeReference [

	self assert: aMOTypeReference packageReference isNotNil.
	self
		install: aMOTypeReference
		from: aMOTypeReference packageReference
]

{ #category : #visiting }
MOModelImportLinker >> install: aMOTypeReference from: aPackageReference [

	| typeOrEmpty installedType |
	typeOrEmpty := self
		               getCatalogType: aMOTypeReference
		               from: aPackageReference.


	typeOrEmpty ifNotEmpty: [ 

		self ensureAllDependentTypesExists: typeOrEmpty first.
		installedType := MOCatalogTypeInstaller new
			                 install: typeOrEmpty first
			                 into: model.
		aMOTypeReference referee: installedType ]
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

	aMOPackageReference referee types addAll:
		(installedTypes select: [ :a | a isType ]).
	aMOPackageReference referee declarationUnits addAll:
		(installedTypes reject: [ :a | a isType ])
]

{ #category : #accessing }
MOModelImportLinker >> installLanguagePackages [

	self getJavaTypes collect: [ :type | "		self ensureAllDependentTypesExists: type."
		[ MOCatalogTypeInstaller new install: type into: model ]
			on: Error
			do: [ :e | e messageText ] ]
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
MOModelImportLinker >> visitImport: import [

	import importsAllPackage
		ifTrue: [ 
			import packageReference referee allTypes ifEmpty: [ 
				self installAll: import packageReference ] ]
		ifFalse: [ 
			import typeReference referee ifNil: [ 
				import packageReference referee allTypes
					detect: [ :type | type name = import typeReference name ]
					ifFound: [ :type | import typeReference referee: type ]
					ifNone: [ 
					self install: import typeReference from: import packageReference ] ] ]
]
