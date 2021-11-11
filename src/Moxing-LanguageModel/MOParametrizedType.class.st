Class {
	#name : #MOParametrizedType,
	#superclass : #MOType,
	#instVars : [
		'type',
		'parameters'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #accessing }
MOParametrizedType >> addParameter: aParameter [ 
	parameters add: aParameter 
]

{ #category : #accessing }
MOParametrizedType >> initialize [

	super initialize.
	parameters := OrderedCollection new
]

{ #category : #accessing }
MOParametrizedType >> type: aType [ 
	 type := aType 
]
