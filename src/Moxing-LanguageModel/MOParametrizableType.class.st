Class {
	#name : #MOParametrizableType,
	#superclass : #MOType,
	#instVars : [
		'#parameters => MOContainmentSlot many'
	],
	#category : #'Moxing-LanguageModel-Declaration'
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
