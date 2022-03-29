Class {
	#name : #MOLanguage,
	#superclass : #MONamedDeclaration,
	#instVars : [
		'errorPolicy',
		'returnPolicy'
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
MOLanguage class >> javaFor: aMOModel [

	^ (aMOModel instantiate: self)
		  name: #java;
		  returnPolicy: MOReturnExpressionPolicy;
		  errorPolicy: MOErrorTryCatchPolicy;
		  yourself
]

{ #category : #'as yet unclassified' }
MOLanguage class >> microsoftAccessFor: aMOModel [

	^ (aMOModel instantiate: self)
		  name: #MicrosoftAccess;
		  returnPolicy: MOReturnAssignmentPolicy;
		  errorPolicy: MOErrorGoToPolicy;
		  yourself
]

{ #category : #'as yet unclassified' }
MOLanguage class >> microsoftAccessForAlceModel: anAlcixModel [

	^ self newInstanceFromModel
		  name: #MicrosoftAccess;
		  returnPolicy: MOReturnAssignmentPolicy;
		  errorPolicy: MOErrorGoToPolicy;
		  yourself
]

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

{ #category : #accessing }
MOLanguage class >> typescriptFor: aMOModel [

	^ (aMOModel instantiate: self)
		  name: #typescript;
		  returnPolicy: MOReturnExpressionPolicy;
		  errorPolicy: MOErrorTryCatchPolicy;
		  yourself
]

{ #category : #printing }
MOLanguage >> errorPolicy [
	^ errorPolicy
]

{ #category : #printing }
MOLanguage >> errorPolicy: anErrorPolicy [

	errorPolicy := anErrorPolicy
]

{ #category : #printing }
MOLanguage >> grammarPolicies [

	^ { errorPolicy . returnPolicy }
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
MOLanguage >> isTypescript [
	^ name = #typescript
]

{ #category : #'instance creation' }
MOLanguage >> newCodeTextWriter [

	self isJava ifTrue: [ ^ MOJavaCodeGenerator new ].
	self isTypescript ifTrue: [ ^ MOTypescriptCodeGenerator new ].
	self isMicrosoftAccess ifTrue: [ ^ MOMicrosoftAccessCodeGenerator  new ].
	self error: ' non writer available '
]

{ #category : #printing }
MOLanguage >> printOn: aStream [

	aStream
		nextPutAll: 'lang: ';
		nextPutAll: name
]

{ #category : #printing }
MOLanguage >> returnPolicy [

	^ returnPolicy
]

{ #category : #printing }
MOLanguage >> returnPolicy: aReturnPolict [

	returnPolicy := aReturnPolict
]
