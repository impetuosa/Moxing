Class {
	#name : #MOLanguageConstruct,
	#superclass : #MOAnchoredDeclaration,
	#instVars : [
		'#language => MOPropertySlot'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #'instance creation' }
MOLanguageConstruct class >> newForJavaIn: aModel [

	^ (aModel instantiate: self)
		  language: (MOLanguage javaFor: aModel);
		  yourself
]

{ #category : #'instance creation' }
MOLanguageConstruct class >> newForTypescriptIn: aModel [

	^ (aModel instantiate: self)
		  language: (MOLanguage typescriptFor: aModel);
		  yourself
]

{ #category : #'instance creation' }
MOLanguageConstruct class >> newMicrosoftAccessFor: aModel [

	^ (aModel instantiate: self)
		  language: (MOLanguage microsoftAccessFor: aModel);
		  yourself
]

{ #category : #accessing }
MOLanguageConstruct >> acceptLanguageVisitor: aVisitor [

	| selector |
	selector := ('visit{1}{2}:' format: { 
			             self language name capitalized.
			             (self className copyFrom: 3 to: self className size) })
		            asSymbol.
	^ aVisitor perform: selector withArguments: { self }
]

{ #category : #accessing }
MOLanguageConstruct >> acceptVisitor: ads [

	self subclassResponsibility
]

{ #category : #testing }
MOLanguageConstruct >> canBeDescribedBy: anOtherObject with: aSlot [

	language isStonReference ifTrue: [ ^ true ].
	^ language can: self beDescribedBy: anOtherObject with: aSlot
]

{ #category : #testing }
MOLanguageConstruct >> canBeParentedBy: anOtherObject with: aSlot [

	language isStonReference ifTrue: [ ^ true ].
	^ language can: self beParentedBy: anOtherObject with: aSlot
]

{ #category : #testing }
MOLanguageConstruct >> canBeReferredAsArrayAccess [

	^ false
]

{ #category : #testing }
MOLanguageConstruct >> canBeReferredAsAttribute [

	^ false
]

{ #category : #'as yet unclassified' }
MOLanguageConstruct >> canBeReferredAsConstant [
	 ^ false
]

{ #category : #testing }
MOLanguageConstruct >> canBeReferredAsFunction [

	^ false
]

{ #category : #testing }
MOLanguageConstruct >> canBeReferredAsMethod [

	^ false
]

{ #category : #testing }
MOLanguageConstruct >> canBeReferredAsPrimitiveType [

	^ false
]

{ #category : #testing }
MOLanguageConstruct >> canBeReferredAsVariable [

	^ false
]

{ #category : #testing }
MOLanguageConstruct >> canDeclare: anOtherObject with: aSlot [

	language isStonReference ifTrue: [ ^ true ].
	^ language can: self declare: anOtherObject with: aSlot
]

{ #category : #testing }
MOLanguageConstruct >> canExpress: anOtherObject with: aSlot [

	language isStonReference ifTrue: [ ^ true ].
	^ language can: self express: anOtherObject with: aSlot
]

{ #category : #testing }
MOLanguageConstruct >> canRefer: anOtherObject with: aSlot [
	language isStonReference ifTrue: [ ^ true. ].
	^ language can: self refer: anOtherObject with: aSlot
]

{ #category : #testing }
MOLanguageConstruct >> canState: anOtherObject with: aSlot [

	language isStonReference ifTrue: [ ^ true ].
	^ language can: self state: anOtherObject with: aSlot
]

{ #category : #testing }
MOLanguageConstruct >> canUseAsReferee: anOtherObject with: aSlot [

	language isStonReference ifTrue: [ ^ true ].
	^ language can: self useAsReferee: anOtherObject with: aSlot
]

{ #category : #'as yet unclassified' }
MOLanguageConstruct >> dependencies [
	^ {}
]

{ #category : #testing }
MOLanguageConstruct >> dependenciesOrEmpty: aDeclaration [

	^ aDeclaration
		  ifNil: [ {  } ]
		  ifNotNil: [ aDeclaration dependencies ]
]

{ #category : #'as yet unclassified' }
MOLanguageConstruct >> enclosingArtefact [

	^ (parent isArtefact or: [ parent isPackage ])
		  ifTrue: [ parent ]
		  ifFalse: [ parent enclosingArtefact ]
]

{ #category : #'as yet unclassified' }
MOLanguageConstruct >> enclosingTypeOrModule [

	parent ifNil: [ ^ nil ].
	^ (parent isType or: [ parent isModule ])
		  ifTrue: [ parent ]
		  ifFalse: [ parent enclosingTypeOrModule ]
]

{ #category : #testing }
MOLanguageConstruct >> isDeclaration [

	^ false
]

{ #category : #testing }
MOLanguageConstruct >> isExpression [
	^ false 
]

{ #category : #testing }
MOLanguageConstruct >> isFylgjaMissingCandidateStub [
	 ^ false
]

{ #category : #testing }
MOLanguageConstruct >> isInvocable [
	^ false
]

{ #category : #testing }
MOLanguageConstruct >> isLabelledAs: aString [ 
	^ false
]

{ #category : #testing }
MOLanguageConstruct >> isMethodExtension [
	 ^ false
]

{ #category : #testing }
MOLanguageConstruct >> isSameEntity: anOtherDeclaration [

	^ self species = anOtherDeclaration species and: [ 
		  self anchor isNotNil and: [ 
			  anOtherDeclaration anchor isNotNil and: [ 
				  (self anchor isSameAnchorAs: anOtherDeclaration anchor) and: [ 
					  self language = anOtherDeclaration language ] ] ] ]
]

{ #category : #testing }
MOLanguageConstruct >> isStatement [

	^ false
]

{ #category : #testing }
MOLanguageConstruct >> isStatementExpression [

	^ false
]

{ #category : #testing }
MOLanguageConstruct >> isVariable [

	^ false
]

{ #category : #accessing }
MOLanguageConstruct >> language [
	^ language
]

{ #category : #accessing }
MOLanguageConstruct >> language: aMOLanguage [ 
	language := aMOLanguage
]

{ #category : #testing }
MOLanguageConstruct >> model [

	^ parent model
]

{ #category : #generated }
MOLanguageConstruct >> produceCode [

	^ self language newCodeTextWriter produceCodeFor: self
]

{ #category : #generated }
MOLanguageConstruct >> producesParseableCode [
	 ^ false
]

{ #category : #generated }
MOLanguageConstruct >> sourceCode [

	^ anchor ifNotNil: [ anchor sourceCode ] ifNil: [ self produceCode ]
]
