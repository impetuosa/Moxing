Class {
	#name : #MOParametrizableType,
	#superclass : #MOType,
	#instVars : [
		'parameters'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #accessing }
MOParametrizableType >> addParameter: aParameter [ 
	parameters add: aParameter 
]

{ #category : #accessing }
MOParametrizableType >> initialize [

	super initialize.
	parameters := OrderedCollection new
]
