"
I am a catalog model.  A secondary model that do not link and that gets all the possible elements regarding the project that may be used and do not have yet any relation with the analyzed call .
"
Class {
	#name : #MOCatalog,
	#superclass : #Object,
	#instVars : [
		'entities',
		'anchor',
		'name',
		'language',
		'broot'
	],
	#category : #'Moxing-Core'
}

{ #category : #private }
MOCatalog class >> loadFrom: aString [

	| instance |
	instance := STON fromStream: aString asFileReference readStream.
	self assert: (instance isKindOf: self).

	^ instance
]

{ #category : #'instance creation' }
MOCatalog class >> newJava [

	| instance |
	instance := self new.
	instance language: (MOLanguage javaFor: instance).
	^ instance
]

{ #category : #'instance creation' }
MOCatalog class >> newMicrosoftAccess [

	| instance |
	instance := self new.
	instance language: (MOLanguage microsoftAccessFor: instance).
	^ instance
]

{ #category : #'instance creation' }
MOCatalog class >> newPharo [

	| instance |
	instance := self new.
	instance language: (MOLanguage pharoFor: instance).
	^ instance
]

{ #category : #'instance creation' }
MOCatalog class >> newTypescript [

	| instance |
	instance := self new.
	instance language: (MOLanguage typescriptFor: instance).
	^ instance
]

{ #category : #'instance creation' }
MOCatalog class >> newVisualWorks [

	| instance |
	instance := self new.
	instance language: (MOLanguage visualWorksFor: instance).
	^ instance
]

{ #category : #traverse }
MOCatalog >> allInvocations [

	^ entities select: [ :e | e isKindOf: MOInvocation ]
]

{ #category : #accessing }
MOCatalog >> allTypes [

	^ self types
]

{ #category : #accessing }
MOCatalog >> anchor [
	^ anchor
]

{ #category : #accessing }
MOCatalog >> anchor: aMOAnchor [

	anchor := aMOAnchor.

]

{ #category : #accessing }
MOCatalog >> catalog [

	^ self
]

{ #category : #accessing }
MOCatalog >> entities [
	^ entities
]

{ #category : #traverse }
MOCatalog >> exclusivelyincludes: aMOPackageReference [

	^ entities includes: aMOPackageReference
]

{ #category : #generated }
MOCatalog >> imports [
	^ entities select: [ : e  | e isKindOf: MOImport ]
]

{ #category : #traverse }
MOCatalog >> inPackage: aString [

	^ self types select: [ :t | 
		  t parent isNotNil and: [ 
			  (t parent isKindOf: MOPackageReference) and: [ 
				  t parent accessChainString = aString ] ] ]
]

{ #category : #accessing }
MOCatalog >> includes: anEntity [

	^ entities includes: anEntity
]

{ #category : #initialization }
MOCatalog >> initialize [

	super initialize.
	entities := OrderedCollection new.
	anchor := MOAnchor on: #/
]

{ #category : #initialization }
MOCatalog >> instantiate: aClass [
	| instance | 
	instance := aClass newInstanceFromModel .
	entities add: instance.
	^ instance
]

{ #category : #testing }
MOCatalog >> isCatalog [

	^ true
]

{ #category : #accessing }
MOCatalog >> language [
	^ language
]

{ #category : #accessing }
MOCatalog >> language: aMOLanguage [ 
	language := aMOLanguage
]

{ #category : #accessing }
MOCatalog >> name [
	^ name
]

{ #category : #accessing }
MOCatalog >> name: aString [

	name := aString
]

{ #category : #accessing }
MOCatalog >> packages [

	^ entities select: [ :a | a isKindOf: MOPackage ]
]

{ #category : #traverse }
MOCatalog >> primitiveTypeNamed: aString ifAbsent: aFullBlockClosure [

	^ entities
		  detect: [ :e | 
		  (e isKindOf: MOPrimitiveType) and: [ e name = aString ] ]
		  ifNone: [ aFullBlockClosure value ]
]

{ #category : #accessing }
MOCatalog >> references [
	^ entities select: [ : e | e isKindOf: MOReference ]
]

{ #category : #generated }
MOCatalog >> root [

	^ broot ifNil: [ 
		  broot := self instantiate: MORootDeclaration.
		  broot name: 'root'.
		  broot anchor: self anchor / 'root' / #RootDeclaration.
		  broot parent: self.
		  broot ]
]

{ #category : #accessing }
MOCatalog >> rootPackages [

	^ entities select: [ :a | 
		  (a isKindOf: MOPackage) and: [ a parent isNil ] ]
]

{ #category : #saving }
MOCatalog >> saveAs: aString [

	| stream |
	aString asFileReference ensureDelete.
	stream := aString asFileReference writeStream.

	STON put: self onStream: stream.
	stream
		flush;
		close
]

{ #category : #traverse }
MOCatalog >> typeDefinedInPackage: aString [

	^ entities select: [ :e | 
		  (e isKindOf: MOType) and: [ 
			  e packageReference isNotNil and: [ 
				  e packageReference name = aString ] ] ]
]

{ #category : #traverse }
MOCatalog >> typeDefinedInPackageNameLike: aBlock [

	^ entities select: [ :e | 
		  e isType and: [ 
			  e packageReference isNotNil and: [ 
				  aBlock value: e packageReference ] ] ]
]

{ #category : #initialization }
MOCatalog >> typeReferences [

	^ entities select: [ :e | e isKindOf: MOTypeReference ]
]

{ #category : #accessing }
MOCatalog >> types [

	^ entities select: [ :e | e isKindOf: MOType ]
]

{ #category : #traverse }
MOCatalog >> typesNamed: aString [

	^ entities select: [ :e | 
		  (e isKindOf: MOType) and: [ e name = aString ] ]
]

{ #category : #accessing }
MOCatalog >> variableReferences [

	^ entities select: [ :a | a isKindOf: MOVariableReference ]
]

{ #category : #accessing }
MOCatalog >> writer [

	^ MOModelWriter new
		  model: self;
		  yourself
]
