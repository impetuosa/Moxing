Class {
	#name : #MOLanguage,
	#superclass : #MOObject,
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

{ #category : #testing }
MOLanguage >> can: aMOObject beDescribedBy: aPropertyObject with: aMOPropertySlot [

	^ constraints
		  can: aMOObject
		  beDescribedBy: aPropertyObject
		  with: aMOPropertySlot
]

{ #category : #testing }
MOLanguage >> can: anMOObject beParentedBy: otherObject with: aMOParentSlot [

	^ constraints
		  can: anMOObject
		  beParentedBy: otherObject
		  with: aMOParentSlot
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
MOLanguage >> canBeDescribedBy: aMOOntologicalConstraint with: aMOPropertySlot [

	^ true
]

{ #category : #testing }
MOLanguage >> constraints [

	^ constraints ifNil: [ constraints := MOStructuralRoleConstraint new ]
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

{ #category : #'as yet unclassified' }
MOLanguage >> useOntologicalConstraintWith: aSPOntology [

	constraints := MOOntologicalConstraint new
		               ontology: aSPOntology;
		               yourself
]

{ #category : #'resolution strategies' }
MOLanguage >> variableResolutionStrategy [

	^ MOModelVariableResolver
]
