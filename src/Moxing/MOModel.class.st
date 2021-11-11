Class {
	#name : #MOModel,
	#superclass : #MOCatalog,
	#instVars : [
		'catalog'
	],
	#category : #'Moxing-Core'
}

{ #category : #accessing }
MOModel >> anchor: aMOAnchor [
	anchor := aMOAnchor.
	catalog anchor: anchor
]

{ #category : #accessing }
MOModel >> catalog [
	^ catalog
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
