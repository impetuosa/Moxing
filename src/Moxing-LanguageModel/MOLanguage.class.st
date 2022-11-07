Class {
	#name : #MOLanguage,
	#superclass : #MONamedDeclaration,
	#instVars : [
		'#constraints => MOPropertySlot'
	],
	#classInstVars : [
		'#html'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #testing }
MOLanguage >> astComposer [

	self subclassResponsibility
]

{ #category : #'resolution strategies' }
MOLanguage >> can: anObject declare: anOtherObject with: aSlot [

	^ self constraints can: anObject declare: anOtherObject with: aSlot
]

{ #category : #'resolution strategies' }
MOLanguage >> can: anObject express: anOtherObject with: aSlot [

	^ self constraints can: anObject express: anOtherObject with: aSlot
]

{ #category : #'resolution strategies' }
MOLanguage >> can: anObject refer: anOtherObject with: aSlot [

	^ self constraints can: anObject refer: anOtherObject with: aSlot
]

{ #category : #'resolution strategies' }
MOLanguage >> can: anObject state: anOtherObject with: aSlot [

	^ self constraints can: anObject state: anOtherObject with: aSlot
]

{ #category : #testing }
MOLanguage >> can: anObject useAsReferee: anOtherObject with: aSlot [

	^ anObject refersToObjectsLikeOrStonRef: anOtherObject
]

{ #category : #testing }
MOLanguage >> constraints [

	^ constraints ifNil: [ constraints := MOLanguageConstraint new ]
]

{ #category : #'as yet unclassified' }
MOLanguage >> createFileReferenceWithin: aMOPackage for: aMODeclarationUnit relativeTo: aFileReference [

	| directory |
	self isJava ifTrue: [ 
		self assert: aMOPackage isPackage.
		self assert: aMOPackage fileReference isNil.

		directory := ('.' split: aMOPackage name)
			             inject: aFileReference / #src / #main / #java
			             into: [ :acc :dir | (acc / dir) ensureCreateDirectory ].
		^ directory / (self sourceCodeFileNameFor: aMODeclarationUnit) ].
	self isTypescript ifTrue: [ 
		aMOPackage fileReference ifNil: [ 
			self assert: aMOPackage parent fileReference isNotNil.
			aMOPackage fileReference: (('.' split: aMOPackage name)
					 inject: aMOPackage parent fileReference
					 into: [ :acc :dir | (acc / dir) ensureCreateDirectory ]) ] ].
	^ aMOPackage fileReference
	  / (self sourceCodeFileNameFor: aMODeclarationUnit)
]

{ #category : #'as yet unclassified' }
MOLanguage >> export: aModel asDraftIntoDirectory: aFileReference [

	self isJava ifTrue: [ 
		^ MOModelJavaExporter new
			  destinationDirectory: aFileReference;
			  export: aModel ].
	self isTypescript ifTrue: [ 
		^ MOModelAngularExporter new
			  destinationDirectory: aFileReference;
			  export: aModel ].
	self error: 'Not implemented exporter '
]

{ #category : #'resolution strategies' }
MOLanguage >> expressionTypeResolvingStrategy [

	^ MOModelExpressionTypeResolver
]

{ #category : #'resolution strategies' }
MOLanguage >> importLinkingStrategy [

	^ MOModelImportLinker
]

{ #category : #'resolution strategies' }
MOLanguage >> invocationResolutionStrategy [

	^ MOModelInvocationResolver
]

{ #category : #testing }
MOLanguage >> isHtml [
  ^ false
]

{ #category : #testing }
MOLanguage >> isJava [
	^ false
]

{ #category : #testing }
MOLanguage >> isMicrosoftAccess [
	^ false
]

{ #category : #accessing }
MOLanguage >> isOnlySignature: aMethod [

	^ aMethod isDefinedInLibrary or: [ 
		  aMethod isAbstract or: [ 
			  self isJava and: [ aMethod parent isClassType ] ] ]
]

{ #category : #testing }
MOLanguage >> isPharo [

	^ false
]

{ #category : #testing }
MOLanguage >> isTypescript [

	^ false
]

{ #category : #accessing }
MOLanguage >> link: aMOModelDerivative [

	^ self subclassResponsibility 
]

{ #category : #'instance creation' }
MOLanguage >> methodLookupStrategy [

	^ MOModelMethodLookup
]

{ #category : #'instance creation' }
MOLanguage >> newCodeTextWriter [

	self subclassResponsibility
]

{ #category : #'instance creation' }
MOLanguage >> newVersionedCodeTextWriter: aMOModelDerivative [

	^ self newCodeTextWriter
		  useModel: aMOModelDerivative;
		  yourself
]

{ #category : #testing }
MOLanguage >> parser [

	self subclassResponsibility 
]

{ #category : #printing }
MOLanguage >> printOn: aStream [

	aStream
		nextPutAll: 'lang: ';
		nextPutAll:self  name
]

{ #category : #'as yet unclassified' }
MOLanguage >> sourceCodeFileNameFor: aMODeclarationUnit [

	self isJava ifTrue: [ 
		^ aMODeclarationUnit name capitalized , '.java' ].
	self isTypescript ifTrue: [ 
		aMODeclarationUnit parent isAngularComponent ifTrue: [ 
			(aMODeclarationUnit isKindOf: MOAngularCssDocument) ifTrue: [ 
				^ aMODeclarationUnit name asLowercase , '.component.css' ].
			(aMODeclarationUnit isKindOf: MOAngularTemplateDocument) ifTrue: [ 
				^ aMODeclarationUnit name asLowercase , '.component.html' ].
			^ aMODeclarationUnit name asLowercase , '.component.ts' ].


		^ aMODeclarationUnit name asLowercase , '.ts' ].
	self error: 'not implemented '
]

{ #category : #accessing }
MOLanguage >> style [

	^ MOAstStyle new
]

{ #category : #'resolution strategies' }
MOLanguage >> typeResolutionStrategy [

	^ MOModelTypeResolver
]

{ #category : #'resolution strategies' }
MOLanguage >> variableResolutionStrategy [

	^ MOModelVariableResolver
]
