Class {
	#name : #MOCatalog,
	#superclass : #Object,
	#instVars : [
		'entities',
		'anchor',
		'name',
		'language'
	],
	#category : #'Moxing-Core'
}

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
MOCatalog class >> newTypescript [

	| instance |
	instance := self new.
	instance language: (MOLanguage typescriptFor: instance).
	^ instance
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
MOCatalog >> entities [
	^ entities
]

{ #category : #generated }
MOCatalog >> imports [
	^ entities select: [ : e  | e isKindOf: MOImport ]
]

{ #category : #'as yet unclassified' }
MOCatalog >> inPackage: aString [

	^ self types select: [ :t | 
		  t parent isNotNil and: [ 
			  (t parent isKindOf: MOPackageReference) and: [ 
				  t parent accessChainString = aString ] ] ]
]

{ #category : #initialization }
MOCatalog >> initialize [ 
	super initialize.
	entities := OrderedCollection new.
]

{ #category : #initialization }
MOCatalog >> instantiate: aClass [
	| instance | 
	instance := aClass newInstanceFromModel .
	entities add: instance.
	^ instance
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

{ #category : #'as yet unclassified' }
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

{ #category : #accessing }
MOCatalog >> rootPackages [

	^ entities select: [ :a | 
		  (a isKindOf: MOPackage) and: [ a parent isNil ] ]
]

{ #category : #'as yet unclassified' }
MOCatalog >> typeDefinedInPackage: aString [

	^ entities select: [ :e | 
		  (e isKindOf: MOType) and: [ 
			  (e parent isKindOf: MOPackageReference) and: [ 
				  e parent name = aString ] ] ]
]

{ #category : #accessing }
MOCatalog >> types [

	^ entities select: [ :e | e isKindOf: MOType ]
]

{ #category : #'as yet unclassified' }
MOCatalog >> typesNamed: aString [

	^ entities select: [ :e | 
		  (e isKindOf: MOType) and: [ e name = aString ] ]
]

{ #category : #accessing }
MOCatalog >> writer [

	^ MOModelWriter new
		  model: self;
		  yourself
]
