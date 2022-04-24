Class {
	#name : #MOLanguage,
	#superclass : #MONamedDeclaration,
	#instVars : [
		'methodLookupStrategy',
		'typeResolutionStrategy',
		'variableResolutionStrategy',
		'invocationResolutionStrategy',
		'importLinkingStrategy',
		'expressionTypeResolvingStrategy'
	],
	#classInstVars : [
		'typescript',
		'java',
		'visualBasicApplication',
		'microsoftAccess'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #'as yet unclassified' }
MOLanguage class >> newFor: aModel [ 	
	^ aModel instantiate: self 
]

{ #category : #accessing }
MOLanguage class >> resetLangs [

	visualBasicApplication := nil.
	typescript := nil.
	java := nil
]

{ #category : #testing }
MOLanguage >> astComposer [
 	
	self isMicrosoftAccess ifTrue: [ ^ MoxingMicrosoftAccessAstComposer ].
	self isTypescript ifTrue: [  ^ MoxingTypescriptAstComposer  ].
	self isJava ifTrue: [  ^ MoxingJavaAstComposer  ].
	self error: 'which composer?'
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

{ #category : #testing }
MOLanguage >> isJava [
	^ self name = #java
]

{ #category : #testing }
MOLanguage >> isMicrosoftAccess [
	^ name = #MicrosoftAccess
]

{ #category : #testing }
MOLanguage >> isPharo [
  ^name = #pharo
]

{ #category : #testing }
MOLanguage >> isTypescript [
	^ name = #typescript
]

{ #category : #'instance creation' }
MOLanguage >> methodLookupStrategy [
  ^methodLookupStrategy ifNil: [ MOModelMethodLookup ]
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

{ #category : #testing }
MOLanguage >> parser [

	self isMicrosoftAccess ifTrue: [ ^ VBParser ].
	self isTypescript ifTrue: [ ^ TypeScriptParser ].
	self isJava ifTrue: [ ^ JavaParser ].
	self error: 'which parser?'
]

{ #category : #printing }
MOLanguage >> printOn: aStream [

	aStream
		nextPutAll: 'lang: ';
		nextPutAll: name
]

{ #category : #accessing }
MOLanguage >> style [

	self isMicrosoftAccess ifTrue: [ ^ MOVBAStyle new ].
	self error: ' check'
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
MOLanguage >> variableResolutionStrategy [
  ^variableResolutionStrategy ifNil: [ MOModelVariableResolver ]
]

{ #category : #accessing }
MOLanguage >> variableResolutionStrategy: anObject [

	variableResolutionStrategy := anObject
]
