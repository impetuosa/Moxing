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
		'fileReference'
	],
	#category : #'Moxing-Core'
}

{ #category : #private }
MOModel class >> loadFrom: aString [

	| instance |
	instance := STON fromStream: aString asFileReference readStream.
	self assert: (instance isKindOf: self).

	^ instance
]

{ #category : #visiting }
MOModel >> acceptVisitor: aMoxingPackageTree [

	^ aMoxingPackageTree visitModel: self
]

{ #category : #enumerating }
MOModel >> allEntitiesSelect: aFullBlockClosure [

	^ entities select: aFullBlockClosure
]

{ #category : #'as yet unclassified' }
MOModel >> allInvocations [

	^ entities select: [ :e | e isKindOf: MOInvocation ]
]

{ #category : #'as yet unclassified' }
MOModel >> allReferences [

	^ entities select: [ :e | e isKindOf: MOReference ]
]

{ #category : #traverse }
MOModel >> allRelations [

	^ { (MODeclarationStructuralRelation nullRelationTo: self root) }
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

{ #category : #enumerating }
MOModel >> catalogEntitiesSelect: aFullBlockClosure [

	^ catalog entities select: aFullBlockClosure
]

{ #category : #'as yet unclassified' }
MOModel >> derivative [

	^ MOModelDerivative new
		  model: self;
		  yourself
]

{ #category : #accessing }
MOModel >> entityFor: aMOEntity [

	^ aMOEntity
]

{ #category : #'as yet unclassified' }
MOModel >> exclusivelyincludes: aMOPrimitiveType [

	^ self includes: aMOPrimitiveType
]

{ #category : #accessing }
MOModel >> fileReference [
	^ fileReference
]

{ #category : #accessing }
MOModel >> fileReference: aFileReference [ 
	fileReference := aFileReference
]

{ #category : #'as yet unclassified' }
MOModel >> finalize [

	self root finalize.
	objects do: #finalize.
	objects removeAll.
	objects := nil.
	catalog := nil.
	root := nil
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

{ #category : #traverse }
MOModel >> isCatalog [

	^ false
]

{ #category : #testing }
MOModel >> isDerivedFrom: aMOModel [

	^ self = aMOModel
]

{ #category : #'as yet unclassified' }
MOModel >> isModelOrDerivative [

	^ true
]

{ #category : #accessing }
MOModel >> mapSpaceAnchor [
	^ anchor 
]

{ #category : #accessing }
MOModel >> objects [
	^ objects
]

{ #category : #enumerating }
MOModel >> objectsSelect: aFullBlockClosure [

	^ objects select: aFullBlockClosure
]

{ #category : #'as yet unclassified' }
MOModel >> printOn: aStream [

	aStream
		nextPutAll: 'Model: ';
		nextPutAll: name;
		nextPutAll: ' Language:';
		nextPutAll: language name
]

{ #category : #accessing }
MOModel >> producesParseableCode [

	^ false
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

{ #category : #'as yet unclassified' }
MOModel >> rootPackages [

	^ entities select: [ :a | 
		  (a isKindOf: MOPackage) and: [ a parent = self ] ]
]

{ #category : #'as yet unclassified' }
MOModel >> saveAs: aString [

	| stream |
	aString asFileReference ensureDelete.
	stream := aString asFileReference writeStream.

	STON put: self onStream: stream.
	stream
		flush;
		close
]

{ #category : #'as yet unclassified' }
MOModel >> sourceCodeIsAvailable [

	^ fileReference exists
]

{ #category : #']as yet unclassified' }
MOModel >> typeReferences [

	^ entities select: [ :e | e isKindOf: MOTypeReference ]
]

{ #category : #'as yet unclassified' }
MOModel >> unknownType [

	^ unknownType ifNil: [ 
		  unknownType := (self instantiate: MOType) name: #UNKNOWN ]
]

{ #category : #accessing }
MOModel >> variableReferences [

	^ entities select: [ :a | a isKindOf: MOVariableReference ]
]

{ #category : #'as yet unclassified' }
MOModel >> writer [

	^ MOModelWriter new
		  model: self;
		  yourself
]
