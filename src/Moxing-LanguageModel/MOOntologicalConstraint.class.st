Class {
	#name : #MOOntologicalConstraint,
	#superclass : #MOLanguageConstraint,
	#instVars : [
		'#ontology => MOPropertySlot'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #accessing }
MOOntologicalConstraint >> can: anObject declare: anOtherObject with: aSlot [

	^ self can: anObject use: anOtherObject with: aSlot
]

{ #category : #accessing }
MOOntologicalConstraint >> can: anObject express: anOtherObject with: aSlot [

	^ self can: anObject use: anOtherObject with: aSlot
]

{ #category : #accessing }
MOOntologicalConstraint >> can: anObject refer: anOtherObject with: aSlot [

	^ self can: anObject use: anOtherObject with: aSlot
]

{ #category : #accessing }
MOOntologicalConstraint >> can: anObject state: anOtherObject with: aSlot [

	^ self can: anObject use: anOtherObject with: aSlot
]

{ #category : #accessing }
MOOntologicalConstraint >> can: anObject use: anOtherObject with: aSlot [

	| type relation |
	type := ontology typeFor: anObject.
	relation := type relationFor: aSlot.

	^ relation acceptInstance: anOtherObject ontology: ontology
]

{ #category : #accessing }
MOOntologicalConstraint >> can: anObject useAsReferee: anOtherObject with: aSlot [

	^ self can: anObject use: anOtherObject with: aSlot
]

{ #category : #accessing }
MOOntologicalConstraint >> ontology [

	^ ontology
]

{ #category : #accessing }
MOOntologicalConstraint >> ontology: anOntology [

	ontology := anOntology
]
