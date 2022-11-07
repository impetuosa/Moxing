Class {
	#name : #MOLanguageObject,
	#superclass : #MOAnchoredDeclaration,
	#instVars : [
		'#language => MOPropertySlot'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #testing }
MOLanguageObject class >> isRenamable [

	^ true
]

{ #category : #'instance creation' }
MOLanguageObject class >> newForJavaIn: aModel [

	^ (aModel instantiate: self)
		  language: (MOLanguage javaFor: aModel);
		  yourself
]

{ #category : #'instance creation' }
MOLanguageObject class >> newForTypescriptIn: aModel [

	^ (aModel instantiate: self)
		  language: (MOLanguage typescriptFor: aModel);
		  yourself
]

{ #category : #'instance creation' }
MOLanguageObject class >> newMicrosoftAccessFor: aModel [

	^ (aModel instantiate: self)
		  language: (MOLanguage microsoftAccessFor: aModel);
		  yourself
]

{ #category : #accessing }
MOLanguageObject >> acceptLanguageVisitor: aVisitor [

	| selector |
	selector := ('visit{1}{2}:' format: { 
			             self language name capitalized.
			             (self className copyFrom: 3 to: self className size) })
		            asSymbol.
	^ aVisitor perform: selector withArguments: { self }
]

{ #category : #accessing }
MOLanguageObject >> acceptVisitor: ads [

	self subclassResponsibility
]

{ #category : #testing }
MOLanguageObject >> canBeReferredAsArrayAccess [

	^ false
]

{ #category : #testing }
MOLanguageObject >> canBeReferredAsAttribute [

	^ false
]

{ #category : #'as yet unclassified' }
MOLanguageObject >> canBeReferredAsConstant [
	 ^ false
]

{ #category : #testing }
MOLanguageObject >> canBeReferredAsFunction [

	^ false
]

{ #category : #testing }
MOLanguageObject >> canBeReferredAsMethod [

	^ false
]

{ #category : #testing }
MOLanguageObject >> canBeReferredAsPrimitiveType [

	^ false
]

{ #category : #testing }
MOLanguageObject >> canBeReferredAsVariable [

	^ false
]

{ #category : #testing }
MOLanguageObject >> canDeclare: anOtherObject with: aSlot [
	language ifNil: [ language := MOJava allInstances first  ].
	^ language can: self declare: anOtherObject with: aSlot
]

{ #category : #testing }
MOLanguageObject >> canExpress: anOtherObject with: aSlot [

	^ language can: self express: anOtherObject with: aSlot
]

{ #category : #testing }
MOLanguageObject >> canRefer: anOtherObject with: aSlot [

	^ language can: self refer: anOtherObject with: aSlot
]

{ #category : #testing }
MOLanguageObject >> canState: anOtherObject with: aSlot [

	^ language can: self state: anOtherObject with: aSlot
]

{ #category : #testing }
MOLanguageObject >> canUseAsReferee: anOtherObject with: aSlot [

	^ language can: self useAsReferee: anOtherObject with: aSlot
]

{ #category : #'as yet unclassified' }
MOLanguageObject >> dependencies [
	^ {}
]

{ #category : #testing }
MOLanguageObject >> dependenciesOrEmpty: aDeclaration [

	^ aDeclaration
		  ifNil: [ {  } ]
		  ifNotNil: [ aDeclaration dependencies ]
]

{ #category : #'as yet unclassified' }
MOLanguageObject >> enclosingArtefact [

	^ (parent isArtefact or: [ parent isPackage ])
		  ifTrue: [ parent ]
		  ifFalse: [ parent enclosingArtefact ]
]

{ #category : #'as yet unclassified' }
MOLanguageObject >> enclosingTypeOrModule [

	parent ifNil: [ ^ nil ].
	^ (parent isType or: [ parent isModule ])
		  ifTrue: [ parent ]
		  ifFalse: [ parent enclosingTypeOrModule ]
]

{ #category : #testing }
MOLanguageObject >> isDeclaration [

	^ false
]

{ #category : #testing }
MOLanguageObject >> isExpression [
	^ false 
]

{ #category : #testing }
MOLanguageObject >> isFylgjaMissingCandidateStub [
	 ^ false
]

{ #category : #testing }
MOLanguageObject >> isInvocable [
	^ false
]

{ #category : #testing }
MOLanguageObject >> isLabelledAs: aString [ 
	^ false
]

{ #category : #testing }
MOLanguageObject >> isMethodExtension [
	 ^ false
]

{ #category : #testing }
MOLanguageObject >> isSameEntity: anOtherDeclaration [

	^ self species = anOtherDeclaration species and: [ 
		  self anchor isNotNil and: [ 
			  anOtherDeclaration anchor isNotNil and: [ 
				  (self anchor isSameAnchorAs: anOtherDeclaration anchor) and: [ 
					  self language = anOtherDeclaration language ] ] ] ]
]

{ #category : #testing }
MOLanguageObject >> isStatement [

	^ false
]

{ #category : #testing }
MOLanguageObject >> isStatementExpression [

	^ false
]

{ #category : #testing }
MOLanguageObject >> isVariable [

	^ false
]

{ #category : #accessing }
MOLanguageObject >> language [
	^ language
]

{ #category : #accessing }
MOLanguageObject >> language: aMOLanguage [ 
	language := aMOLanguage
]

{ #category : #testing }
MOLanguageObject >> model [

	^ parent model
]

{ #category : #generated }
MOLanguageObject >> produceCode [

	^ self language newCodeTextWriter produceCodeFor: self
]

{ #category : #generated }
MOLanguageObject >> producesParseableCode [
	 ^ false
]

{ #category : #generated }
MOLanguageObject >> sourceCode [

	^ anchor ifNotNil: [ anchor sourceCode ] ifNil: [ self produceCode ]
]
