"
I am in charge of linking a model. I take care of delegating different phases to different linking objects.
"
Class {
	#name : #MOModelLinker,
	#superclass : #Object,
	#instVars : [
		'model',
		'typeLinker',
		'variableLinker',
		'invocationLinker'
	],
	#category : #'Moxing-Linking'
}

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
  aMOModel language importLinkingStrategy new
     model: aMOModel;
     visitCollection: aMOModel imports
]

{ #category : #'as yet unclassified' }
MOModelLinker >> ensureAllInvocableBindings: aMOModel [

	aMOModel allInvocations
		select: [ :i | i referee isNil ]
		thenDo: [ :i | self processInvocation: i ]
]

{ #category : #'as yet unclassified' }
MOModelLinker >> ensureAllPackages: aMOModel [

	(aMOModel entities select: [ :e | 
		 (e isKindOf: MOPackageReference) and: [ e referee isNil ] ]) do: [ 
		:ref | 
		aMOModel packages
			detect: [ :p | p fullName = ref name ]
			ifFound: [ :p | ref referee: p ]
			ifNone: [ 
				ref referee:
					(aMOModel writer writePackage: [ :package | 
						 package name: ref name ]) ] ].


	(aMOModel types select: [ :a | 
		 a packageReference isNotNil and: [ 
			 a packageReference referee isNil ] ]) do: [ :a | 
		self halt.
		a packageReference ifNotNil: [ 
			(a packageReference referee allTypes includes: a) ifFalse: [ 
				(a parent isKindOf: MODeclarationUnit)
					ifTrue: [ 
						self assert: a parent parent isNil.
						a parent parent: a packageReference referee.
						a packageReference referee addDeclarationUnit: a parent ]
					ifFalse: [ a packageReference referee addType: a ] ] ] ]
]

{ #category : #'as yet unclassified' }
MOModelLinker >> ensureAllTypeReferences: aMOModel [

	aMOModel typeReferences
		select: [ :t | t referee isNil ]
		thenDo: [ :t | self processTypeReference: t ]
]

{ #category : #'as yet unclassified' }
MOModelLinker >> ensureAllTypesInTheirPackages: aMOModel [

	aMOModel types
		select: [ :a | a packageReference isNotNil ]
		thenDo: [ :type | 
			(type packageReference referee allTypes includes: type) ifFalse: [ 
				(type parent isKindOf: MODeclarationUnit)
					ifTrue: [ 
					type packageReference referee declarationUnits add: type parent ]
					ifFalse: [ 
						type packageReference referee types add: type.
						type parent: type packageReference referee ] ] ]
]

{ #category : #'as yet unclassified' }
MOModelLinker >> ensureAllVariableReferences: aMOModel [
	
	aMOModel variableReferences
		select: [ :a | a referee isNil ]
		thenDo: [ :a | 
		

			self processVariableReference: a ]
]

{ #category : #'as yet unclassified' }
MOModelLinker >> findTypeNamed: aString withIn: aMOPackage [

	^ aMOPackage types
		  detect: [ :t | t name = aString ]
		  ifNone: [ self unknownType ]
]

{ #category : #accessing }
MOModelLinker >> installLanguagePackages [

	model language importLinkingStrategy new
		model: model;
		installLanguagePackages
]

{ #category : #'as yet unclassified' }
MOModelLinker >> invocationLinker [
  ^invocationLinker ifNil: [ invocationLinker := model language invocationResolutionStrategy new
           model: model;
           yourself ]
]

{ #category : #testing }
MOModelLinker >> isReference: aMOModelBuilder [

	^ (aMOModelBuilder isKindOf: MOLanguageConstruct) and: [ 
		  (aMOModelBuilder species = MOPackage) not ]
]

{ #category : #accessing }
MOModelLinker >> link: aMOModel [

	model := aMOModel.
	"self installLanguagePackages."
	aMOModel entities do: [ :e | 
		self linkAllChildOrphanReferencesToParent: e ].
	"Ensures that all the existing package references points to an existing package. It creates the package if Needed "
	self ensureAllPackages: aMOModel.
	"Processes all the imports, installing the required types  "
	self ensureAllImports: aMOModel.
	"Ensures that all the existing package references points to an existing package. It creates the package if Needed 2. The installation of new types producess new package references "
	self ensureAllPackages: aMOModel.
	"Ensures that all the installed types are in their expected package properly installed "
	self ensureAllTypesInTheirPackages: aMOModel.
	"Ensures that all the type references are solved "	
	self ensureAllTypeReferences: aMOModel.
	"Ensures that all the existing package references points to an existing package. It creates the package if Needed 2. The installation of new types producess new package references "
	self ensureAllPackages: aMOModel.
	"Ensures that all the variabels and invocables are properly bound.  "
	self ensureAllVariableReferences: aMOModel.
	self ensureAllInvocableBindings: aMOModel.
]

{ #category : #'as yet unclassified' }
MOModelLinker >> linkAllChildOrphanReferencesToParent: aMOLanguage [

	aMOLanguage isFylgjaStub ifTrue: [ ^ self ].
	(self allValuesReferredBy: aMOLanguage)
		select: [ :value | 
			(value isKindOf: MOObject) and: [ 
				value parent isNil or: [ value parent isKindOf: MOModel ] ] ]
		thenDo: [ :reference | 
			(self isReference: reference) ifTrue: [ 
				reference parent: aMOLanguage ] ]
]

{ #category : #'as yet unclassified' }
MOModelLinker >> processInvocation: aMOAnnotationInstance [

	^ self invocationLinker processInvocation: aMOAnnotationInstance
]

{ #category : #'as yet unclassified' }
MOModelLinker >> processTypeReference: aMOTypeReference [
	self typeLinker processTypeReference: aMOTypeReference
]

{ #category : #'as yet unclassified' }
MOModelLinker >> processVariableReference: aMOVariableReference [

	self variableLinker processVariableReference: aMOVariableReference
]

{ #category : #'as yet unclassified' }
MOModelLinker >> typeLinker [
  ^typeLinker ifNil: [ typeLinker := model language typeResolutionStrategy new
           model: model;
           yourself ]
]

{ #category : #'as yet unclassified' }
MOModelLinker >> variableLinker [
  ^variableLinker ifNil: [ variableLinker := model language variableResolutionStrategy new
           model: model;
           yourself ]
]
