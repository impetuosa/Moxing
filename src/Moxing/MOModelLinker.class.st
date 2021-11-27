Class {
	#name : #MOModelLinker,
	#superclass : #Object,
	#instVars : [
		'model',
		'typeLinker'
	],
	#category : #'Moxing-Core'
}

{ #category : #'as yet unclassified' }
MOModelLinker >> accessChainTo: aMOTypeReference [

	| current chain |
	chain := OrderedCollection new.

	current := aMOTypeReference.

	[ current isNil ] whileFalse: [ 
		chain add: current name.
		current := current parent ].
	^ chain reversed
]

{ #category : #'as yet unclassified' }
MOModelLinker >> allValuesReferredBy: aMOLanguage [

	^ (aMOLanguage class allSlots reject: [ :a | a name = #parent ]) 
		  flatCollect: [ :s | 
			  | value |
			  value := s read: aMOLanguage.
			  (value isCollection and: [ value isString not ])
				  ifTrue: [ value ]
				  ifFalse: [ { value } ] ]
]

{ #category : #'as yet unclassified' }
MOModelLinker >> ensureAllImports: aMOModel [

	aMOModel imports do: [ :import | 
		import typeReference candidate ifNil: [ 
			import typeReference parent candidate types
				detect: [ :type | type name = import typeReference name ]
				ifFound: [ :type | import typeReference candidate: type ]
				ifNone: [ 
				self install: import typeReference fromCatalogInto: aMOModel ] ] ]
]

{ #category : #'as yet unclassified' }
MOModelLinker >> ensureAllPackages: aMOModel [
	(aMOModel entities select: [ :e | 
		 (e isKindOf: MOPackageReference) and: [ e parent isNil ] ]) do: [ 
		:ref | 
		aMOModel packages
			detect: [ :p | p name = ref name ]
			ifFound: [ :p | ref candidate: p ]
			ifNone: [ 
				ref candidate:
					(aMOModel writer writePackage: [ :package | 
						 package name: ref name ]) ] ].
	self ensureAllSubPackages: aMOModel
]

{ #category : #'as yet unclassified' }
MOModelLinker >> ensureAllSubPackages: aMOModel [

	| baseline |
	baseline := aMOModel entities select: [ :e | 
		            (e isKindOf: MOPackageReference) and: [ 
			            e candidate isNil and: [ 
				            (e parent isKindOf: MOPackageReference) and: [ 
					            e parent candidate isNotNil ] ] ] ].
	baseline do: [ :ref | 
		ref parent candidate subpackages
			detect: [ :p | p name = ref name ]
			ifFound: [ :p | ref candidate: p ]
			ifNone: [ 
				| pack |
				pack := aMOModel writer writePackage: [ :package | 
					        package name: ref name ].
				pack parent: ref parent candidate. 
				ref parent candidate addPackage: pack.
				ref candidate: pack ] ].
	baseline ifNotEmpty: [ ^ self ensureAllSubPackages: aMOModel ]
]

{ #category : #'as yet unclassified' }
MOModelLinker >> ensureAllTypeReferences: aMOModel [

	aMOModel typeReferences
		select: [ :t | t candidate isNil ]
		thenDo: [ :t | self processTypeReference: t ]
]

{ #category : #'as yet unclassified' }
MOModelLinker >> findTypeNamed: aString withIn: aMOPackage [

	^ aMOPackage types
		  detect: [ :t | t name = aString ]
		  ifNone: [ self unknownType ]
]

{ #category : #'as yet unclassified' }
MOModelLinker >> getCatalogType: aMOTypeReference from: aMOModel [

	| chain  typeName  catalogType |
	chain := self accessChainTo: aMOTypeReference.
	typeName := chain removeLast.
	catalogType := (aMOModel catalog typesNamed: typeName) select: [ :t | 
		               (self accessChainTo: t parent) = chain ].


	^ catalogType 
]

{ #category : #'as yet unclassified' }
MOModelLinker >> install: aMOTypeReference fromCatalogInto: aMOModel [

	| typeOrEmpty installedTYpe |
	typeOrEmpty := self getCatalogType: aMOTypeReference from: aMOModel.
	typeOrEmpty ifNotEmpty: [ 
		installedTYpe := MOCatalogTypeInstaller new
			                 install: typeOrEmpty first
			                 into: aMOModel.
		aMOTypeReference candidate: installedTYpe ]
]

{ #category : #testing }
MOModelLinker >> isReference: aMOModelBuilder [ 
	^ aMOModelBuilder isKindOf: MOLanguageObject  
]

{ #category : #accessing }
MOModelLinker >> link: aMOModel [
	model := aMOModel. 
	aMOModel entities do: [ :e | 
		self linkAllChildOrphanReferencesToParent: e ].

	self ensureAllPackages: aMOModel .
	self ensureAllImports: aMOModel. 
	self ensureAllTypeReferences: aMOModel. 
	self ensureAllVariableReferences: aMOModel. 
	self ensureAllInvocableBindings: aMOModel.
	
	self halt
]

{ #category : #'as yet unclassified' }
MOModelLinker >> linkAllChildOrphanReferencesToParent: aMOLanguage [

	(self allValuesReferredBy: aMOLanguage)
		select: [ :value | 
			(value isKindOf: MOObject) and: [ 
				value parent isNil or: [ value parent isKindOf: MOModel ] ] ]
		thenDo: [ :reference | 
			(self isReference: reference) ifTrue: [ 
				
				reference parent: aMOLanguage  ] ]
]

{ #category : #'as yet unclassified' }
MOModelLinker >> processTypeReference: aMOTypeReference [

	self typeLinker processTypeReference: aMOTypeReference
]

{ #category : #'as yet unclassified' }
MOModelLinker >> typeLinker [

	^ typeLinker ifNil: [ 
		  typeLinker := MOModelTypeLinker new
			                model: model;
			                yourself ]
]
