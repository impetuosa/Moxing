"
I am a model. A façade an entities holder. 
"
Class {
	#name : #MOModel,
	#superclass : #MOCatalog,
	#instVars : [
		'catalog',
		'unknownType',
		'objects'
	],
	#category : #'Moxing-Core'
}

{ #category : #'as yet unclassified' }
MOModel >> allInvocations [

	^ entities select: [ :e | e isKindOf: MOInvocation ]
]

{ #category : #'as yet unclassified' }
MOModel >> allReferences [

	^ entities select: [ :e | e isKindOf: MOReference ]
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

{ #category : #'as yet unclassified' }
MOModel >> derivative [

	^ MOModelDerivative new
		  model: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModel >> exclusivelyincludes: aMOPrimitiveType [

	^ self includes: aMOPrimitiveType
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
MOModel >> rootPackages [

	^ entities select: [ :a | 
		  (a isKindOf: MOPackage) and: [ a parent = self ] ]
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
