Class {
	#name : #MOLanguage,
	#superclass : #MONamedObject,
	#instVars : [
		'errorPolicy',
		'returnPolicy'
	],
	#classInstVars : [
		'typescript',
		'java',
		'visualBasicApplication'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #'as yet unclassified' }
MOLanguage class >> javaFor: aMOModel [

	^ java ifNil: [ 
		  java := (aMOModel instantiate: self)
			          name: #java;
			          returnPolicy: MOReturnExpressionPolicy;
			          errorPolicy: MOErrorTryCatchPolicy;
			          yourself ]
]

{ #category : #accessing }
MOLanguage class >> resetLangs [

	visualBasicApplication := nil.
	typescript := nil.
	java := nil
]

{ #category : #accessing }
MOLanguage class >> typescriptFor: aMOModel [

	^ typescript ifNil: [ 
		  typescript := (aMOModel instantiate: self)
			                name: #typescript;
			                returnPolicy: MOReturnExpressionPolicy;
			                errorPolicy: MOErrorTryCatchPolicy;
			                yourself ]
]

{ #category : #'as yet unclassified' }
MOLanguage class >> visualBasicApplicationFor: aMOModel [

	^ visualBasicApplication ifNil: [ 
		  visualBasicApplication := (aMOModel instantiate: self)
			                            name: #MicrosoftAccess;
			                            returnPolicy: MOReturnAssignmentPolicy;
			                            errorPolicy: MOErrorGoToPolicy;
			                            yourself ]
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
MOLanguage >> isTypescript [
	^ name = #typescript
]

{ #category : #'instance creation' }
MOLanguage >> newCodeTextWriter [

	self isJava ifTrue: [ ^ MOJavaCodeGenerator new ].
	self isTypescript ifTrue: [ ^ MOTypescriptCodeGenerator new ].
	self error:  ' non writer available '
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
