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

{ #category : #query }
MOModelDerivative >> allDeclarations [
	<doc: 'Returns all the declarations, favoring the definition closer to this derivative model.'>
	| refs |
	refs := self declarations.
	^ model allDeclarations collect: [ :deriveeModelRef | 
		  refs
			  detect: [ :r | r isSameEntity: deriveeModelRef ]
			  ifFound: [ :thisModelRef | 
				  refs remove: thisModelRef.
				  thisModelRef ]
			  ifNone: [ deriveeModelRef ] ]
]

{ #category : #derivative }
MOModelDerivative >> allDerivariveEntities [

	<doc:
	'Returns all the entities of this derivative models and the following chained models (derivative or not).'>
	^ entities , model allDerivariveEntities
]

{ #category : #query }
MOModelDerivative >> allEntitiesDetect: aFullBlockClosure [

	^ self entities
		  detect: aFullBlockClosure
		  ifNone: [ model allEntitiesDetect: aFullBlockClosure ]
]

{ #category : #query }
MOModelDerivative >> allEntitiesSelect: aFullBlockClosure [

	^ (self entities select: aFullBlockClosure)
	  , (model allEntitiesSelect: aFullBlockClosure)
]

{ #category : #query }
MOModelDerivative >> allInvocations [
	<doc: 'Returns all the invocations, favoring the definition closer to this derivative model.'>
	| refs |
	refs := self invocations.
	^ (model allInvocations collect: [ :deriveeModelRef | 
		   refs
			   detect: [ :r | r isSameEntity: deriveeModelRef ]
			   ifFound: [ :thisModelRef | 
				   refs remove: thisModelRef.
				   thisModelRef ]
			   ifNone: [ deriveeModelRef ] ]) , refs
]

{ #category : #query }
MOModelDerivative >> allLiterals [
	<doc: 'Returns all the literals, favoring the definition closer to this derivative model.'>
	^ (entities select: #isMOLiteral) , model allLiterals
]

{ #category : #query }
MOModelDerivative >> allReferences [
	<doc: 'Returns all the references, favoring the definition closer to this derivative model.'>
	| refs |
	refs := self references copy.
	^ (model allReferences collect: [ :deriveeModelRef | 
		   refs
			   detect: [ :r | r isSameEntity: deriveeModelRef ]
			   ifFound: [ :thisModelRef | 
				   refs remove: thisModelRef.
				   thisModelRef ]
			   ifNone: [ deriveeModelRef ] ]) , refs
]

{ #category : #query }
MOModelDerivative >> allTypes [
	<doc: 'Returns all the types, favoring the definition closer to this derivative model.'>
	^ self types , model allTypes
]

{ #category : #query }
MOModelDerivative >> allVersionsOf: aMOFunction [

	<doc: 'Returns all the versions of a given element.'>
	^ (entities select: [ :a | a isSameEntity: aMOFunction ])
	  , (model allVersionsOf: aMOFunction)
]

{ #category : #accessing }
MOModelDerivative >> anchor [

	^ model anchor
]

{ #category : #query }
MOModelDerivative >> candidatelessEntities [

	^ entities select: [ :e | 
		  e isFylgjaStub not and: [ 
			  (e respondsTo: #referee) and: [ e referee isNil ] ] ]
]

{ #category : #query }
MOModelDerivative >> catalogEntitiesSelect: aFullBlockClosure [

	^ model catalogEntitiesSelect: aFullBlockClosure
]

{ #category : #query }
MOModelDerivative >> declarations [

	<doc: 'Returns all the declarations of this derivative.'>
	^ entities select: [ :e | e isDeclaration ]
]

{ #category : #derivative }
MOModelDerivative >> derivative [

	<doc: 'Returns a derivative model of a derivative model.'>
	^ MOModelDerivative new
		  model: self;
		  yourself
]

{ #category : #accessing }
MOModelDerivative >> entities [

	<doc: 'Returns all the entities of this derivative.'>
	^ entities
]

{ #category : #accessing }
MOModelDerivative >> entityFor: aMOEntity [

	^ self entities detect: [ :e | e = aMOEntity ] ifNone: [ 
		  self entities
			  detect: [ :e | e isSameEntity: aMOEntity ]
			  ifNone: [ model entityFor: aMOEntity ] ]
]

{ #category : #testing }
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

{ #category : #finalization }
MOModelDerivative >> finalizeMoxing [

	entities removeAll.
	[ model finalizeMoxing ]
		on: Error
		do: [  ].
	model := nil
]

{ #category : #testing }
MOModelDerivative >> hasBeenModified [

	^ hasBeenModified ifNil: [ false ]
]

{ #category : #query }
MOModelDerivative >> imports [

	<doc: 'Returns all the imports of this derivative.'>
	^ entities select: [ :e | e isKindOf: MOImport ]
]

{ #category : #testing }
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

{ #category : #query }
MOModelDerivative >> invocations [

	<doc: 'Returns all the invocations of this derivative.'>
	^ entities select: [ :e | e isKindOf: MOInvocation ]
]

{ #category : #testing }
MOModelDerivative >> isCorrect [

	| incorrect |
	incorrect := entities reject: [ :slot | slot isCorrect ].
	"
	incorrect first isCorrect: self 
	"
	^ incorrect size = 0 and: [ model isCorrect ]
]

{ #category : #testing }
MOModelDerivative >> isDerivativeModel [

	^ true
]

{ #category : #testing }
MOModelDerivative >> isDerivedFrom: aMOModel [

	^ model isNotNil and: [ model isDerivedFrom: aMOModel]
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
	self language link: self 
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

{ #category : #query }
MOModelDerivative >> objectsSelect: aFullBlockClosure [ 
	^ model objects select: aFullBlockClosure 
]

{ #category : #accessing }
MOModelDerivative >> packages [

	<doc: 'Returns all the packages of this derivative.'>
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

{ #category : #query }
MOModelDerivative >> primitiveTypeNamed: aString ifAbsent: aFullBlockClosure [

	^ self entities
		  detect: [ :e | 
		  (e isKindOf: MOPrimitiveType) and: [ e name = aString ] ]
		  ifNone: [ 
		  model primitiveTypeNamed: aString ifAbsent: aFullBlockClosure ]
]

{ #category : #'as yet unclassified' }
MOModelDerivative >> produceCode: aMODeclarationUnit [

	aMODeclarationUnit isQuery ifTrue: [ ^ aMODeclarationUnit sql ].
	^ (self language newVersionedCodeTextWriter: self) produceCodeFor:
		  aMODeclarationUnit
]

{ #category : #testing }
MOModelDerivative >> producesParseableCode [

	^ false
]

{ #category : #traverse }
MOModelDerivative >> realModel [ 
	 ^ model realModel


]

{ #category : #accessing }
MOModelDerivative >> references [

	<doc: 'Returns all the references of this derivative.'>
	^ entities select: [ :e | e isKindOf: MOReference ]
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

	"self assert: (self entities includes: aFylgjaCandidateStub).
	self assert: aFylgjaCandidateStub isFylgjaStub."
	self entities remove: aFylgjaCandidateStub ifAbsent: [  ]
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

	^ self entityFor: model root
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

{ #category : #swap }
MOModelDerivative >> swap: aFylgjaCandidateStub with: aMOVariableReference [

	aFylgjaCandidateStub = aMOVariableReference ifFalse: [ 
		aFylgjaCandidateStub becomeForward: aMOVariableReference ]
]

{ #category : #swap }
MOModelDerivative >> swap: aMOExit with: aMOReturnEmpty context: aMOBlock [

	self assert: (self entities includes: aMOExit).
	self assert: (model entities includes: aMOExit) not.
	self entities replaceAll: aMOExit with: aMOReturnEmpty.
	aMOBlock statements replaceAll: aMOExit with: aMOReturnEmpty
]

{ #category : #query }
MOModelDerivative >> typeNamed: aString [ 
	^ model typeNamed: aString 
]

{ #category : #initialization }
MOModelDerivative >> typeReferences [

	<doc: 'Returns all the type references of this derivative.'>
	^ entities select: [ :e | e isKindOf: MOTypeReference ]
]

{ #category : #query }
MOModelDerivative >> types [

	<doc: 'Returns all the types of this derivative.'>
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
	writing := self allDerivariveEntities reject: [ :e | 
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

{ #category : #query }
MOModelDerivative >> variableReferences [
		<doc: 'Returns all the variable references of this derivative.'>
	^ entities select: [ :a | a isKindOf: MOVariableReference ]
]

{ #category : #writer }
MOModelDerivative >> writer [

	<doc: 'Returns a writer over this derivative models.'>
	^ MOModelWriter new
		  model: self;
		  yourself
]
