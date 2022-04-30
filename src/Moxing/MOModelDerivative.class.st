"
I am a derivative model. 
A model on changing transition. I do hold new entities and relations before been add to the real model 
"
Class {
	#name : #MOModelDerivative,
	#superclass : #Object,
	#instVars : [
		'entities',
		'model',
		'hasBeenModified'
	],
	#category : #'Moxing-Core'
}

{ #category : #enumerating }
MOModelDerivative >> allEntitiesSelect: aFullBlockClosure [

	^ (self entities select: aFullBlockClosure)
	  , (model allEntitiesSelect: aFullBlockClosure)
]

{ #category : #'as yet unclassified' }
MOModelDerivative >> allInvocations [

	^ entities select: [ :e | e isKindOf: MOInvocation ]
]

{ #category : #accessing }
MOModelDerivative >> anchor [

	^ model anchor
]

{ #category : #'as yet unclassified' }
MOModelDerivative >> candidatelessEntities [

	^ entities select: [ :e | 
		  (e respondsTo: #candidate) and: [ e candidate isNil ] ]
]

{ #category : #enumerating }
MOModelDerivative >> catalogEntitiesSelect: aFullBlockClosure [

	^ model catalogEntitiesSelect: aFullBlockClosure
]

{ #category : #initialization }
MOModelDerivative >> derivative [

	^ MOModelDerivative new
		  model: self;
		  yourself
]

{ #category : #accessing }
MOModelDerivative >> entities [
	^  entities
]

{ #category : #accessing }
MOModelDerivative >> entityFor: aMOEntity [
	^ self entities
		  detect: [ :e | e isSameEntity: aMOEntity  ]
		  ifNone: [ model entityFor: aMOEntity ]
]

{ #category : #'as yet unclassified' }
MOModelDerivative >> exclusivelyincludes: anEntity [

	^ self entities includes: anEntity
]

{ #category : #'as yet unclassified' }
MOModelDerivative >> exportAsDraftIntoDirectory: aFileReference [

	^ self language export: self asDraftIntoDirectory: aFileReference
]

{ #category : #accessing }
MOModelDerivative >> fileReference [
	^ model fileReference
]

{ #category : #testing }
MOModelDerivative >> hasBeenModified [

	^ hasBeenModified ifNil: [ false ]
]

{ #category : #generated }
MOModelDerivative >> imports [
	^ entities select: [ : e  | e isKindOf: MOImport ]
]

{ #category : #'as yet unclassified' }
MOModelDerivative >> includes: anEntity [

	^ (self entities includes: anEntity) or: [ model includes: anEntity ]
]

{ #category : #accessing }
MOModelDerivative >> initialize [

	super initialize.
	entities := OrderedCollection new
]

{ #category : #'instance creation' }
MOModelDerivative >> instantiate: aClass [ 
	| instance | 
	hasBeenModified := true.
	instance := aClass newInstanceFromModel .
	entities add: instance.
	^ instance
]

{ #category : #testing }
MOModelDerivative >> isDerivativeModel [

	^ true
]

{ #category : #testing }
MOModelDerivative >> isDerivedFrom: aMOModel [

	^ model isDerivedFrom: aMOModel
]

{ #category : #testing }
MOModelDerivative >> isModelOrDerivative [

	^ true
]

{ #category : #accessing }
MOModelDerivative >> language [

	^ model language
]

{ #category : #accessing }
MOModelDerivative >> link [
	MOModelLinker new link: self 
]

{ #category : #accessing }
MOModelDerivative >> mapSpaceAnchor [

	^ model mapSpaceAnchor
]

{ #category : #accessing }
MOModelDerivative >> model [
	^ model
]

{ #category : #accessing }
MOModelDerivative >> model: aMOModel [ 
	model := aMOModel
]

{ #category : #accessing }
MOModelDerivative >> name [
	^ model name
]

{ #category : #accessing }
MOModelDerivative >> objects [
	^ model objects 
]

{ #category : #enumerating }
MOModelDerivative >> objectsSelect: aFullBlockClosure [ 
	^ model objects select: aFullBlockClosure 
]

{ #category : #accessing }
MOModelDerivative >> packages [

	| packs submodulePacks newInThisModel |
	packs := entities select: #isPackage.
	submodulePacks := model packages.
	newInThisModel := packs select: [ :p | 
		                  submodulePacks noneSatisfy: [ :subEntity | 
			                  p isSameEntity: subEntity ] ].
	^ newInThisModel , (submodulePacks collect: [ :p | 
		   packs
			   detect: [ :overriden | overriden isSameEntity: p ]
			   ifNone: [ p ] ])
]

{ #category : #'as yet unclassified' }
MOModelDerivative >> primitiveTypeNamed: aString ifAbsent: aFullBlockClosure [

	^ self entities
		  detect: [ :e | 
		  (e isKindOf: MOPrimitiveType) and: [ e name = aString ] ]
		  ifNone: [ 
		  model primitiveTypeNamed: aString ifAbsent: aFullBlockClosure ]
]

{ #category : #'as yet unclassified' }
MOModelDerivative >> produceCode: aMODeclarationUnit [

	^ (self language newVersionedCodeTextWriter: self) produceCodeFor:
		  aMODeclarationUnit
]

{ #category : #registry }
MOModelDerivative >> register: aMOBlock [

	self entities add: aMOBlock
]

{ #category : #removing }
MOModelDerivative >> removeEntity: aFylgjaCandidateStub [

	self entities remove: aFylgjaCandidateStub
]

{ #category : #removing }
MOModelDerivative >> removeStub: aFylgjaCandidateStub [

	self assert: (self entities includes: aFylgjaCandidateStub).
	self assert: aFylgjaCandidateStub isFylgjaStub.
	self entities remove: aFylgjaCandidateStub
]

{ #category : #'as yet unclassified' }
MOModelDerivative >> resolveFileReferenceFor: aMODeclarationUnit [

	aMODeclarationUnit fileReference ifNil: [ 
		aMODeclarationUnit fileReference: (self language
				 createFileReferenceWithin: aMODeclarationUnit parent
				 for: aMODeclarationUnit
				 relativeTo: self fileReference) ].

	^ self fileReference resolve: aMODeclarationUnit fileReference
]

{ #category : #accessing }
MOModelDerivative >> root [

	^ model root
]

{ #category : #'as yet unclassified' }
MOModelDerivative >> shallowCopy: anEntity [

	| e |
	
	e := anEntity copy.
	self register: e.
	e class allSlots do: [ :slot | 
		(slot read: e) isCollection ifTrue: [ 
			slot write: (slot read: e) copy to: e ] ].
	^ e
	


]

{ #category : #'as yet unclassified' }
MOModelDerivative >> shallowRelationCopy: aMOObjectObjectRelation [

	| relation to |
	relation := aMOObjectObjectRelation copy.
	to := self shallowCopy: aMOObjectObjectRelation to.

	relation to: to.
	^ relation
]

{ #category : #'as yet unclassified' }
MOModelDerivative >> sourceCodeIsAvailable [

	^ model sourceCodeIsAvailable
]

{ #category : #accessing }
MOModelDerivative >> swap: aFylgjaCandidateStub with: aMOVariableReference [

	aFylgjaCandidateStub = aMOVariableReference ifFalse: [ 
		self entities remove: aFylgjaCandidateStub.
		self assert: (self entities includes: aMOVariableReference).
		aFylgjaCandidateStub becomeForward: aMOVariableReference ]
]

{ #category : #'as yet unclassified' }
MOModelDerivative >> swap: aMOExit with: aMOReturnEmpty context: aMOBlock [

	self assert: (self entities includes: aMOExit).
	self assert: (model entities includes: aMOExit) not.
	self entities replaceAll: aMOExit with: aMOReturnEmpty.
	aMOBlock statements replaceAll: aMOExit with: aMOReturnEmpty
]

{ #category : #initialization }
MOModelDerivative >> typeReferences [

	^ entities select: [ :e | e isKindOf: MOTypeReference ]
]

{ #category : #accessing }
MOModelDerivative >> types [

	^ entities select: [ :e | e isKindOf: MOType ]
]

{ #category : #'as yet unclassified' }
MOModelDerivative >> undoUpdateDestinationSourceProjects [

	| writing |
	writing := self entities reject: [ :e | 
		           (self exclusivelyincludes: e parent) or: [ 
			           e parent isNil or: [ e parent = self ] ] ].

	writing ifEmpty: [ ^ self "Non modifications to write " ].

	^ MOModelUpdateExporter new
		  model: self;
		  undoExport: writing
]

{ #category : #'as yet unclassified' }
MOModelDerivative >> updateDestinationSourceProjects [

	| writing |
	writing := self entities reject: [ :e | 
		           (self exclusivelyincludes: e parent) or: [ 
			           e parent isNil or: [ e parent = self ] ] ].

	writing ifEmpty: [ ^ self "Non modifications to write " ].
	writing := writing flatCollect: [ :a | 
		           a isPackage
			           ifTrue: [ 
				           a allContainments select: [ :cont | 
					           self exclusivelyincludes: cont ] ]
			           ifFalse: [ 
				           a isRootDeclaration
					           ifTrue: [ {  } ]
					           ifFalse: [ { a } ] ] ].



	^ MOModelUpdateExporter new
		  model: self;
		  export: writing
]

{ #category : #accessing }
MOModelDerivative >> variableReferences [

	^ entities select: [ :a | a isKindOf: MOVariableReference ]
]

{ #category : #'instance creation' }
MOModelDerivative >> writer [

	^ MOModelWriter new
		  model: self;
		  yourself
]
