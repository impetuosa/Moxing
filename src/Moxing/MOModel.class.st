Class {
	#name : #MOModel,
	#superclass : #MOCatalog,
	#instVars : [
		'catalog',
		'unknownType'
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

{ #category : #initialization }
MOModel >> initialize [ 
	super initialize.
	catalog := MOCatalog new. 
	catalog anchor: anchor.
]

{ #category : #initialization }
MOModel >> instantiate: aClass [
	| instance | 
	instance := aClass newInstanceFromModel .
	entities add: instance.
	^ instance
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
