Class {
	#name : #MOLanguage,
	#superclass : #MONamedDeclaration,
	#instVars : [
		'#methodLookupStrategy => MOPropertySlot',
		'#typeResolutionStrategy => MOPropertySlot',
		'#variableResolutionStrategy => MOPropertySlot',
		'#invocationResolutionStrategy => MOPropertySlot',
		'#importLinkingStrategy => MOPropertySlot',
		'#expressionTypeResolvingStrategy => MOPropertySlot'
	],
	#classInstVars : [
		'#html'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #'as yet unclassified' }
MOLanguage class >> newFor: aModel [ 	
	^ aModel instantiate: self 
]

{ #category : #testing }
MOLanguage >> astComposer [
 	
	self isMicrosoftAccess ifTrue: [ ^ MoxingMicrosoftAccessAstComposer ].
	self isTypescript ifTrue: [  ^ MoxingTypescriptAstComposer  ].
	self isJava ifTrue: [  ^ MoxingJavaAstComposer  ].
	self isHtml ifTrue: [  ^ MoxingHtmlAstComposer  ].
	self error: 'which composer?'
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

{ #category : #'as yet unclassified' }
MOLanguage >> expressionTypeResolvingStrategy [
  ^expressionTypeResolvingStrategy ifNil: [ MOModelExpressionTypeResolver ]
]

{ #category : #accessing }
MOLanguage >> expressionTypeResolvingStrategy: anObject [
	expressionTypeResolvingStrategy := anObject
]

{ #category : #accessing }
MOLanguage >> extension [

	self isJava ifTrue: [ ^ 'java' ].
	self isTypescript ifTrue: [ ^ 'ts' ].
	self error: ' Extension '
]

{ #category : #accessing }
MOLanguage >> importLinkingStrategy [
  ^importLinkingStrategy ifNil: [ MOModelImportLinker ]
]

{ #category : #accessing }
MOLanguage >> importLinkingStrategy: anObject [

	importLinkingStrategy := anObject
]

{ #category : #accessing }
MOLanguage >> invocationResolutionStrategy [
  ^invocationResolutionStrategy ifNil: [ MOModelInvocationResolver ]
]

{ #category : #accessing }
MOLanguage >> invocationResolutionStrategy: anObject [

	invocationResolutionStrategy := anObject
]

{ #category : #accessing }
MOLanguage >> isAbstract: aTypeOrMethod [

	^ self usesAbstractKeyword and: [ 
		  aTypeOrMethod modifiers anySatisfy: [ :a | 
			  a asLowercase = #abstract ] ]
]

{ #category : #accessing }
MOLanguage >> isAbstractInvocable: aType [

	^ self isAbstract: aType
]

{ #category : #accessing }
MOLanguage >> isAbstractType: aType [

	^ self isAbstract: aType
]

{ #category : #testing }
MOLanguage >> isHtml [
  ^ self name = #Html
]

{ #category : #testing }
MOLanguage >> isJava [
	^ self name = #java
]

{ #category : #testing }
MOLanguage >> isMicrosoftAccess [
	^self  name = #MicrosoftAccess
]

{ #category : #accessing }
MOLanguage >> isOnlySignature: aMethod [

	^ aMethod isDefinedInLibrary or: [ 
		  aMethod isAbstract or: [ 
			  self isJava and: [ aMethod parent isClassType ] ] ]
]

{ #category : #testing }
MOLanguage >> isPharo [

	^ self name = #pharo
]

{ #category : #testing }
MOLanguage >> isTypescript [
	^ self name = #typescript
]

{ #category : #accessing }
MOLanguage >> link: aMOModelDerivative [

	^ self isJava ifTrue: [ MOModelLinker new link: aMOModelDerivative ]
]

{ #category : #'instance creation' }
MOLanguage >> methodLookupStrategy [
  ^ methodLookupStrategy ifNil: [ MOModelMethodLookup ]
]

{ #category : #accessing }
MOLanguage >> methodLookupStrategy: anObject [

	methodLookupStrategy := anObject
]

{ #category : #'instance creation' }
MOLanguage >> newCodeTextWriter [

	self isJava ifTrue: [ ^ MOJavaCodeGenerator new ].
	self isTypescript ifTrue: [ ^ MOTypescriptCodeGenerator new ].
	self isMicrosoftAccess ifTrue: [ ^ MOMicrosoftAccessCodeGenerator  new ].
	self isPharo ifTrue: [ ^ MOPharoCodeGenerator  new ].
	self error: ' non writer available '
]

{ #category : #'instance creation' }
MOLanguage >> newVersionedCodeTextWriter: aMOModelDerivative [

	^ self newCodeTextWriter
		  useModel: aMOModelDerivative;
		  yourself
]

{ #category : #testing }
MOLanguage >> parser [

	self isMicrosoftAccess ifTrue: [ ^ VBParser ].
	self isTypescript ifTrue: [ ^ TypeScriptParser ].
	self isJava ifTrue: [ ^ JavaParser ].
	self isHtml ifTrue: [ ^ XMLHTMLParser ].
	self error: 'which parser?'
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

	self isMicrosoftAccess ifTrue: [ ^ MOVBAStyle new ].
	self isJava ifTrue: [ ^ MOJavaStyle new ].
	self isTypescript ifTrue: [ ^ MOTypescriptStyle new ].

	^ MOAstStyle new
]

{ #category : #accessing }
MOLanguage >> typeResolutionStrategy [
  ^typeResolutionStrategy ifNil: [ MOModelTypeResolver ]
]

{ #category : #accessing }
MOLanguage >> typeResolutionStrategy: anObject [

	typeResolutionStrategy := anObject
]

{ #category : #accessing }
MOLanguage >> usesAbstractKeyword [

	^ self isJava or: [ self isTypescript ]
]

{ #category : #accessing }
MOLanguage >> variableResolutionStrategy [
  ^variableResolutionStrategy ifNil: [ MOModelVariableResolver ]
]

{ #category : #accessing }
MOLanguage >> variableResolutionStrategy: anObject [

	variableResolutionStrategy := anObject
]
