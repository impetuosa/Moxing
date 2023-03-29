Class {
	#name : #MOAngularJSLoader,
	#superclass : #Object,
	#instVars : [
		'metadata',
		'model',
		'workingDirectory',
		'modelNamed'
	],
	#category : #'Moxing-AngularJS'
}

{ #category : #'as yet unclassified' }
MOAngularJSLoader >> load: aWorkingDirectory name: aName [
	workingDirectory := aWorkingDirectory asFileReference.
	modelNamed := aName.
	self loadMetadata.
	self loadModel.
]

{ #category : #'as yet unclassified' }
MOAngularJSLoader >> loadMetadata [

	| dependencies modules |
	metadata := STON fromStream: self packageFile readStream.
	dependencies := metadata at: #dependencies.
	dependencies keys do: [ :key |
		| dep folder |
		folder := self nodeModulesFolder / key.
		dep := (folder / 'package.json') exists
			       ifTrue: [
				       (STON fromStream: (folder / 'package.json') readStream)
					       at: #loaded put: true;
					       yourself ]
			       ifFalse: [
				       Dictionary new
					       at: #name put: key;
					       at: #loaded put: false;
					       yourself ].
		dep at: #folder put: self nodeModulesFolder / key.
		dependencies at: key put: dep ].
	modules := (workingDirectory / #src) allEntries
		           select: [ :e | e basename endsWith: 'module.ts' ]
		           thenCollect: #asFileReference.

	metadata at: #modules put: (modules collect: [ :m |
			 Dictionary new
				 at: #name put: m basenameWithoutExtensions;
				 at: #folder put: m parent;
				 at: #module put: m;
				 at: #requires put: (self resolveRequiresFrom: m);
				 yourself ]).

	
]

{ #category : #'as yet unclassified' }
MOAngularJSLoader >> loadModel [

	| schema |
	model := MOModel newAngularJs
		         name: modelNamed;
		         yourself.
	schema := model instantiate: MOAngularScheme.
	model root addPackage: schema.
	self populateAnchorOn: model root.

	schema fileReference: workingDirectory.
	schema metadata: metadata.

	(metadata at: #modules) do: [ :m | self loadModule: m into: schema ].

	^ model
]

{ #category : #'as yet unclassified' }
MOAngularJSLoader >> loadModule: aDictionary into: aMOAngularScheme [ 
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
MOAngularJSLoader >> nodeModulesFolder [

	^ workingDirectory / 'node_modules'
]

{ #category : #'as yet unclassified' }
MOAngularJSLoader >> packageFile [

	^ workingDirectory / 'package.json'
]

{ #category : #'as yet unclassified' }
MOAngularJSLoader >> populateAnchorOn: anEntity [

	| subentity |
	anEntity shouldPopulateRelations ifTrue: [ 
		anEntity allDeclaresRelations , anEntity allStatesRelations
		, anEntity allRefersRelations , anEntity allExpressesRelations do: [ 
			:relation | 
			subentity := relation to.
			subentity parent ifNil: [ subentity parent: anEntity ].
			subentity anchor: anEntity anchor / relation name
				/ (subentity className copyReplaceAll: 'MO' with: '') asCamelCase.
			self populateAnchorOn: subentity ] ]
]

{ #category : #'as yet unclassified' }
MOAngularJSLoader >> resolveRequiresFrom: aFileReference [

	| ast coll |
	ast := TypeScriptParser parse: aFileReference readStream upToEnd.
	coll := OrderedCollection new.
	ast allNodesDo: [ :a |
		((a isKindOf: JSCallExpressionNode) and: [
			 (a expression respondsTo: #name) and: [
				 a expression name value = #require and: [
					 a arguments size = 1 and: [
						 a arguments first isKindOf: JSStringLiteralNode ] ] ] ])
			ifTrue: [ coll add: a arguments first value value ] ].
	^ coll
]
