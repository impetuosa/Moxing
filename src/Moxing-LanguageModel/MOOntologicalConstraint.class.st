Class {
	#name : #MOOntologicalConstraint,
	#superclass : #MOLanguageConstraint,
	#instVars : [
		'#ontology => MOPropertySlot'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #accessing }
MOOntologicalConstraint >> can: anObject beDescribedBy: anOtherObject with: aSlot [

	^ self can: anObject use: anOtherObject with: aSlot
]

{ #category : #accessing }
MOOntologicalConstraint >> can: anObject beParentedBy: anOtherObject with: aSlot [

	^ true " self can: anObject use: anOtherObject with: aSlot"
]

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
	aSlot name = #anchor ifTrue: [ 
		^ anOtherObject isNil or: [ anOtherObject class = MOAnchor ] ].
	aSlot name = #language ifTrue: [ 
		^ anOtherObject isNil or: [ anOtherObject isKindOf: MOLanguage ] ].
	aSlot name = #name ifTrue: [ 
		^ anOtherObject isNil or: [ anOtherObject isKindOf: String ] ].
	[ type := ontology typeFor: anObject ]
		on: Error
		do: [ :e | ^ false ].
	[ relation := type relationFor: aSlot ]
		on: Error
		do: [ :e | ^ aSlot isNoneValue: anOtherObject ].


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
