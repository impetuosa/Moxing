Class {
	#name : #MOAngularLoader,
	#superclass : #Object,
	#instVars : [
		'metadata',
		'model',
		'workingDirectory'
	],
	#classInstVars : [
		'northwind'
	],
	#category : #'Moxing-Angular-Loader'
}

{ #category : #'as yet unclassified' }
MOAngularLoader class >> northwind [

	^ northwind ifNil: [ 
		  northwind := self new
			               workingDirectory:
				               '/Users/sbragagn/git/northwind-angular'
					               asFileReference;
			               loadNamed: #angular ]
]

{ #category : #'as yet unclassified' }
MOAngularLoader class >> reset [

	<script>
	northwind := nil
]

{ #category : #convenience }
MOAngularLoader >> isWellKnownNotDirectory: aFileReference [

	^ { #environments. #assets } includes: aFileReference basename
]

{ #category : #load }
MOAngularLoader >> loadNamed: aName [

	| schema |
	model := MOModel newTypescript.
	model name: aName.
	model anchor: (MOAnchor on: #/) / aName.

	MOTypescriptBasicLanguageLoader new
		model: model;
		fileBase: workingDirectory;
		load.

	(workingDirectory / 'angular.json') exists ifFalse: [ 
		self error:
			' the path does not point to a valid angular project installation ' ].
	metadata := STONJSON fromStream:
		            (workingDirectory / 'angular.json') readStream.
	schema := model instantiate: MOAngularScheme.
	model root addPackage: schema.
	self populateAnchorOn: model root.  

	schema fileReference: workingDirectory.
	schema metadata: metadata.
	schema acceptVisitor: self.
	^ model
]

{ #category : #load }
MOAngularLoader >> populateAnchorOn: anEntity [

	| subentity |
	anEntity allContainmentRelations , anEntity allReferenceRelations
	, anEntity allExpressionRelations do: [ :relation | 
		subentity := relation to.
		subentity parent: anEntity.
		subentity anchor: anEntity anchor / (subentity name isEmptyOrNil
				 ifTrue: [ relation name ]
				 ifFalse: [ subentity name ])
			/ (subentity className copyReplaceAll: 'MO' with: '') asCamelCase.
		self populateAnchorOn: subentity ]
]

{ #category : #convenience }
MOAngularLoader >> processClassesFrom: aCollectionOfFiles into: aDestination anchoringInto: aModule [

	| processing name |
	processing := aCollectionOfFiles select: [ :s | 
		              s extensions size = 1 and: [ 
			              s extensions anyOne = 'ts' ] ].
	processing do: [ :ref | 
		name := ref basenameWithoutExtensions.
		aDestination add: ((model instantiate: MOAngularClass)
				 name: name;
				 fileReference: ref;
				 anchor: aModule anchor / #classes / name;
				 yourself) ]
]

{ #category : #convenience }
MOAngularLoader >> processComponentsFrom: aCollectionOfFiles into: aDestination anchoringInto: aModule [

	(self
		 selectFrom: aCollectionOfFiles
		 allFiles: #component
		 andNot: #spec) keysAndValuesDo: [ :name :files | 
		aDestination add: ((model instantiate: MOAngularComponent)
				 name: name;
				 fileReference: files anyOne parent;
				 anchor: aModule anchor / #components / name;
				 yourself) ]
]

{ #category : #convenience }
MOAngularLoader >> processServicesFrom: aCollectionOfFiles into: aDestination anchoringInto: aModule [

	(self selectFrom: aCollectionOfFiles allFiles: #service andNot: #spec) 
		keysAndValuesDo: [ :name :files | 
			aDestination add: ((model instantiate: MOAngularService)
					 name: name;
					 fileReference: files anyOne parent;
					 anchor: aModule anchor / #services / name;
					 yourself) ]
]

{ #category : #convenience }
MOAngularLoader >> selectAllFiles: aString [ 
	self shouldBeImplemented.
]

{ #category : #convenience }
MOAngularLoader >> selectFrom: aCollection allFiles: aString [ 
	self shouldBeImplemented.
]

{ #category : #convenience }
MOAngularLoader >> selectFrom: aCollection allFiles: aString andNot: aString3 [

	^ (aCollection select: [ :e | 
		   (e extensions includes: aString) and: [ 
			   (e extensions includes: aString3) not ] ]) groupedBy:
		  #basenameWithoutExtensions
]

{ #category : #visiting }
MOAngularLoader >> visitAngularClass: aComponentBehavior [

	aComponentBehavior classRepresentation: (MOTypescriptClassLoader
			 loadClassFromFile: aComponentBehavior fileReference
			 for: aComponentBehavior
			 into: model).
	aComponentBehavior classRepresentation parent: aComponentBehavior
]

{ #category : #visiting }
MOAngularLoader >> visitAngularComponent: aComponent [

	| templateDocument cssDocument |
	aComponent behavior: ((model instantiate: MOAngularClass)
			 anchor: aComponent anchor / #behavior / aComponent name;
			 fileReference:
				 aComponent fileReference / (aComponent name , '.component.ts');
			 name: aComponent name;
			 yourself).
	aComponent behavior parent: aComponent.
	aComponent behavior acceptVisitor: self.

	templateDocument := (aComponent fileReference
	                     / (aComponent name , '.component.html'))
		                    readStream upToEnd.

	aComponent template: ((model instantiate: MOAngularTemplateDocument)
			 anchor: aComponent anchor / #template / aComponent name;
			 fileReference:
				 aComponent fileReference / (aComponent name , '.component.html');
			 document: templateDocument;
			 name: aComponent name;
			 yourself).

	(aComponent fileReference / (aComponent name , '.component.css'))
		exists ifTrue: [ 
		cssDocument := templateDocument := (aComponent fileReference
		                                    /
		                                    (aComponent name
		                                     , '.component.css')) readStream
			                                   upToEnd.
		aComponent css: ((model instantiate: MOAngularCssDocument)
				 anchor: aComponent anchor / #css / aComponent name;
				 fileReference:
					 aComponent fileReference / (aComponent name , '.component.css');
				 document: cssDocument;
				 name: aComponent name;
				 yourself) ].
	aComponent template acceptVisitor: self.
	aComponent template parent: aComponent
]

{ #category : #visiting }
MOAngularLoader >> visitAngularComponentTemplate: aMOAngularComponentTemplate [ 
	
]

{ #category : #visiting }
MOAngularLoader >> visitAngularModule: aModule [

	| components directories |
	aModule isRootingModule ifTrue: [  ^ self  ].
	directories := aModule fileReference allEntries
		               select: #isDirectory
		               thenCollect: #asFileReference.
	components := OrderedCollection new.
	directories do: [ :d | 
		self
			processComponentsFrom: d files
			into: components
			anchoringInto: aModule.
		self
			processServicesFrom: d files
			into: components
			anchoringInto: aModule.
		self
			processClassesFrom: d files
			into: components
			anchoringInto: aModule ].

	components do: [ : c | c parent: aModule ].
	aModule artefacts: components.
	self visitCollection: components.
	^ aModule
]

{ #category : #visiting }
MOAngularLoader >> visitAngularProject: aProject [

	| modules |
	modules := OrderedCollection new.

	modules := aProject contentFileReference entries
		           select: [ :e | e basename endsWith: 'module.ts' ]
		           thenCollect: [ :f | 
			           | name |
			           name := f basename copyReplaceAll: '.module.ts' with: ''.

			           (model instantiate: MOAngularModule)
				           fileReference: f asFileReference parent;
				           anchor: aProject anchor / #modules / name;
				           name: name ].
	modules do: [ :m | m parent: aProject ].
	aProject modules: modules.
	self visitCollection: modules
]

{ #category : #visiting }
MOAngularLoader >> visitAngularScheme: aScheme [

	| projects |
	projects := (aScheme metadata at: #projects) associations collect: [ 
		            :a | 
		            | instance projectMetadata |
		            projectMetadata := a value.
		            instance := model instantiate: MOAngularProject.
						instance parent: aScheme.
		            instance name: a key.
		            instance projectType:
			            (projectMetadata at: #projectType) asSymbol.
		            "instance anchoredToUrlSegment:"
		            self assert:
			            (projectMetadata at: #root) asSymbol isEmpty.
		            instance fileReference:
			            aScheme fileReference
			            / (projectMetadata at: #sourceRoot).
						instance prefix:  (projectMetadata at: #prefix).
		            instance anchor:
			            aScheme anchor / #projects
			            / (projectMetadata at: #sourceRoot).
		            instance ].
	aScheme projects: projects.
	self visitCollection: projects
]

{ #category : #visiting }
MOAngularLoader >> visitAngularService: aMOAngularService [

	aMOAngularService behavior: ((model instantiate: MOAngularClass)
			 anchor:
				 aMOAngularService anchor / #behavior / aMOAngularService name;
			 fileReference: aMOAngularService fileReference
				 / (aMOAngularService name , '.service.ts');
			 name: aMOAngularService name;
			 yourself).
	aMOAngularService behavior parent: aMOAngularService.
	aMOAngularService behavior acceptVisitor: self
]

{ #category : #visiting }
MOAngularLoader >> visitAngularTemplateDocument: aMOAngularTemplateDocument [ 

]

{ #category : #visiting }
MOAngularLoader >> visitCollection: projects [

	projects do: [ :p | p acceptVisitor: self ]
]

{ #category : #configuration }
MOAngularLoader >> workingDirectory: aDir [

	workingDirectory := aDir
]
