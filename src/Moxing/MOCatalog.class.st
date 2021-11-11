Class {
	#name : #MOCatalog,
	#superclass : #Object,
	#instVars : [
		'entities',
		'anchor',
		'name'
	],
	#category : #'Moxing-Core'
}

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
MOCatalog >> name [
	^ name
]

{ #category : #accessing }
MOCatalog >> name: aString [

	name := aString
]
