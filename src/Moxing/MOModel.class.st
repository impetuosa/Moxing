"
I am a model. A façade an entities holder. 
"
Class {
	#name : #MOModel,
	#superclass : #MOCatalog,
	#instVars : [
		'catalog',
		'unknownType',
		'objects',
		'root',
		'fileReference',
		'readOnly'
	],
	#category : #'Moxing-Core'
}

{ #category : #visiting }
MOModel >> acceptVisitor: aMoxingPackageTree [

	^ aMoxingPackageTree visitModel: self
]

{ #category : #query }
MOModel >> aliasNamed: aString [

	| t |
	t := (self typesNamed: aString) select: [ :a | a isKindOf: MOAlias ].
	self assert: t size = 1.
	^ t first
]

{ #category : #query }
MOModel >> allDeclarations [
	<doc: 'Query all the declarations defined within the model.'>

	^ entities select: [ :e | e isDeclaration ]
]

{ #category : #query }
MOModel >> allDerivariveEntities [

	^ {  }
]

{ #category : #query }
MOModel >> allEntitiesDetect: aFullBlockClosure [

	^ entities detect: aFullBlockClosure
]

{ #category : #query }
MOModel >> allEntitiesSelect: aFullBlockClosure [

	^ entities select: aFullBlockClosure
]

{ #category : #query }
MOModel >> allInvocations [
	<doc: 'Query all the invocations defined within the model.'>

	^ entities select: [ :e | e isKindOf: MOInvocation ]
]

{ #category : #query }
MOModel >> allLiterals [

	<doc: 'Query all the literals defined within the model.'>
	^ entities select: [ :e | e isMOLiteral ]
]

{ #category : #query }
MOModel >> allReferences [
	<doc: 'Query all the referential objects defined within the model.'>

	^ entities select: [ :e | e isKindOf: MOReference ]
]

{ #category : #query }
MOModel >> allRelations [

	^ { (MODeclarationStructuralRelation nullRelationTo: self root) }
]

{ #category : #query }
MOModel >> allVersionsOf: aMOFunction [

	<doc:
	'Query all the elements which are equivalent to a given element.'>
	^ entities select: [ :a | a isSameEntity: aMOFunction ]
]

{ #category : #accessing }
MOModel >> anchor: aMOAnchor [
	anchor := aMOAnchor.
	catalog anchor: anchor
]

{ #category : #accessing }
MOModel >> catalog [
	^ catalog
]

{ #category : #accessing }
MOModel >> catalog: aCatalog [ 
	catalog := aCatalog
]

{ #category : #query }
MOModel >> catalogEntitiesSelect: aFullBlockClosure [

	^ catalog entities select: aFullBlockClosure
]

{ #category : #query }
MOModel >> declarations [
	<doc: 'Query all the declarations defined within the model.'>

	^ entities select: [ :e | e isKindOf: MODeclaration ]
]

{ #category : #derivative }
MOModel >> derivative [
	<doc: 'Creates a derivative model. A derivative model is capable to scope modifications.'>
	^ MOModelDerivative new
		  model: self;
		  yourself
]

{ #category : #accessing }
MOModel >> entityFor: aMOEntity [

	^ aMOEntity
]

{ #category : #testing }
MOModel >> exclusivelyincludes: aMOPrimitiveType [

	^ self includes: aMOPrimitiveType
]

{ #category : #query }
MOModel >> expressions [
	<doc: 'Query all the expressions defined within the model.'>

	^ entities select: [ :a | a isExpression ]
]

{ #category : #accessing }
MOModel >> fileReference [
	^ fileReference
]

{ #category : #accessing }
MOModel >> fileReference: aFileReference [ 
	fileReference := aFileReference
]

{ #category : #finalization }
MOModel >> finalize [

	self root finalize.
	objects ifNotNil: [ 
		objects do: #finalize.
		objects removeAll ].
	objects := nil.
	catalog := nil.
	root := nil.
	self becomeForward: {  }
]

{ #category : #finalization }
MOModel >> finalizeMoxing [
	
]

{ #category : #query }
MOModel >> incorrectEntities [

	<doc:
	'Query all entities which are incorrect, according to the language semantics'>
	^ entities reject: [ :e | e isCorrect ]
]

{ #category : #initialization }
MOModel >> initialize [

	super initialize.
	catalog := MOCatalog new.
	catalog anchor: anchor.
	objects := OrderedCollection new
]

{ #category : #initialization }
MOModel >> instantiate: aClass [

	| instance |
	instance := aClass newInstanceFromModel.
	instance isStaticDefinition
		ifTrue: [ 
			(instance respondsTo: #language) ifTrue: [ 
				instance language: language ].
			entities add: instance ]
		ifFalse: [ objects add: instance ].

	^ instance
]

{ #category : #accessing }
MOModel >> invocables [
	^ entities select:#isInvocable
]

{ #category : #accessing }
MOModel >> invocations [
	^ entities select:[:a | a isInvocation ]
]

{ #category : #testing }
MOModel >> isCatalog [

	^ false
]

{ #category : #testing }
MOModel >> isCorrect [
	<doc: 'Tests if the model is correct or not. A model is correct if all the entities are correct (according to the language constraints). '>

	| incorrect |
	incorrect := entities reject: [ :slot | slot isCorrect ].
	"
	incorrect first isCorrect: self 
	"
	^ incorrect size = 0
]

{ #category : #testing }
MOModel >> isDerivedFrom: aMOModel [

	^ self = aMOModel
]

{ #category : #testing }
MOModel >> isInvocable [

	^ false
]

{ #category : #testing }
MOModel >> isMOModel [

	^ true
]

{ #category : #derivative }
MOModel >> isModelOrDerivative [

	^ true
]

{ #category : #query }
MOModel >> libraries [
	<doc: 'Query all the libraries defined within the model.'>

	^ entities select: [ :a | a isKindOf: MOLibrary ]
]

{ #category : #query }
MOModel >> literals [

	<doc: 'Query all the literals defined within the model.'>
	^ entities select: #isMOLiteral
]

{ #category : #accessing }
MOModel >> mapSpaceAnchor [
	^ anchor 
]

{ #category : #accessing }
MOModel >> methodInvocations [

	^ entities select: [ :a | a isMethodInvocation ]
]

{ #category : #accessing }
MOModel >> model [

	^ self
]

{ #category : #accessing }
MOModel >> objects [
	^ objects
]

{ #category : #query }
MOModel >> objectsSelect: aFullBlockClosure [

	^ objects select: aFullBlockClosure
]

{ #category : #accessing }
MOModel >> parent [

	^ nil
]

{ #category : #printing }
MOModel >> printOn: aStream [

	aStream
		nextPutAll: 'Model: ';
		nextPutAll: name;
		nextPutAll: ' Language:';
		nextPutAll: language name
]

{ #category : #testing }
MOModel >> producesParseableCode [

	^ false
]

{ #category : #traverse }
MOModel >> readOnly [

	^ readOnly ifNil: [ false ]
]

{ #category : #traverse }
MOModel >> readOnly: bool [

	readOnly := bool
]

{ #category : #initialization }
MOModel >> realModel [

	^ self
]

{ #category : #initialization }
MOModel >> root [

	^ root ifNil: [ 
		  root := self instantiate: MORootDeclaration.
		  root name: 'root'.
		  root anchor: self anchor / 'root' / #RootDeclaration.
		  root parent: self .
		  root ]
]

{ #category : #query }
MOModel >> rootPackages [

	^ entities select: [ :a | 
		  (a isKindOf: MOPackage) and: [ a parent = self ] ]
]

{ #category : #save }
MOModel >> saveAs: aString [
	<doc: 'Save this model as STON file.'>

	| stream |
	aString asFileReference ensureDelete.
	stream := aString asFileReference writeStream.

	STON put: self onStream: stream.
	stream
		flush;
		close
]

{ #category : #'problem solving' }
MOModel >> solveApplicationReferenceProblem [

	entities
		select: [ :a | 
			(a isKindOf: MOMethodInvocation) and: [ 
				a receiverReference name = #self and: [ 
					a referee isNotNil and: [ 
						a referee parent name = #_Application ] ] ] ]
		thenDo: [ :each | 
			each receiverReference becomeForward:
				(MOTypeReference newInstanceFromModel
					 name: #Application;
					 parent: each;
					 referee:
						 (each referee parent parent parent types detect: [ :a | 
								  a name = #Application ]);
					 language: each language) ]
]

{ #category : #testing }
MOModel >> sourceCodeIsAvailable [
	<doc: 'Tests if the model source directory exists.'>
	^ fileReference exists
]

{ #category : #query }
MOModel >> tablesAndQueries [
	<doc: 'Query all the queries or tables defined within the model.'>

	^ entities select: [ :a | a isQuery or: [ a isTable ] ]
]

{ #category : #query }
MOModel >> typeNamed: aString [
	<doc: 'A single type named as given. The size must be 1.'>
	| t |
	t := self typesNamed: aString.

	self assert: t size > 0.

	^ t first
]

{ #category : #query }
MOModel >> typeNamed: aString library: aLibraryName [

	| t |
	t := (self typesNamed: aString)
		     collect: [ :a | 
			     (a isKindOf: MOAlias)
				     ifFalse: [ a ]
				     ifTrue: [ a typeReference referee ] ]
		     thenSelect: [ :a | a parent parent name = aLibraryName ].
	self assert: t size = 1.
	^ t first
]

{ #category : #query }
MOModel >> typeOrAliasNamed: aString library: aLibraryName [

	| t |
	t := (self typesNamed: aString) select: [ :a | 
		     a parent isMOModel or: [ a parent parent name = aLibraryName ] ].
	self assert: t size = 1.
	^ t first
]

{ #category : #query }
MOModel >> typeReferences [
	<doc: 'Query all the references to types defined within the model.'>

	^ entities select: [ :e | e isKindOf: MOTypeReference ]
]

{ #category : #query }
MOModel >> typesNamed: aString [
	<doc: 'Query all the types named as given defined within the model.'>

	^ entities select: [ :e | 
		  ((e isKindOf: MOType) or: [ e isKindOf: MOModule ]) and: [ 
			  e name = aString and: [ 
				  e anchor isNotNil or: [ e isPrimitiveType ] ] ] ]
]

{ #category : #accessing }
MOModel >> unknownType [

	^ unknownType ifNil: [ 
		  unknownType := (self instantiate: MOType) name: #UNKNOWN ]
]

{ #category : #query }
MOModel >> variableReferences [
	<doc: 'Query all the references to variables defined within the model.'>

	^ entities select: [ :a | a isKindOf: MOVariableReference ]
]

{ #category : #writer }
MOModel >> writer [

	<doc:
	'Creates a new model writer if the model is not read only. A model writer allows the user to update existing entities or create new entities.'>
	self readOnly ifTrue: [ ^ self error: 'read only model' ].
	^ MOModelWriter new
		  model: self;
		  yourself
]
