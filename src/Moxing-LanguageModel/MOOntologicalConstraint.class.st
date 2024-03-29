"
I represent a set of language semantic constraints establishing if each specific relation between two objects is or not correct. 
I base my behaviour by delegating to an ontology which works as an oracle.
"
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
	<doc: 'Responds if an object can be linked as property to an other object using a specific slot'>
	^ self can: anObject use: anOtherObject with: aSlot
]

{ #category : #accessing }
MOOntologicalConstraint >> can: anObject beParentedBy: anOtherObject with: aSlot [

	^ true " self can: anObject use: anOtherObject with: aSlot"
]

{ #category : #accessing }
MOOntologicalConstraint >> can: anObject declare: anOtherObject with: aSlot [
	<doc: 'Responds if an object can be linked as declaration to an other object using a specific slot'>
	^ self can: anObject use: anOtherObject with: aSlot
]

{ #category : #accessing }
MOOntologicalConstraint >> can: anObject express: anOtherObject with: aSlot [
	<doc: 'Responds if an object can be linked as expression to an other object using a specific slot'>
	^ self can: anObject use: anOtherObject with: aSlot
]

{ #category : #accessing }
MOOntologicalConstraint >> can: anObject refer: anOtherObject with: aSlot [
	<doc: 'Responds if an object can be linked as refer to an other object using a specific slot'>
	^ self can: anObject use: anOtherObject with: aSlot
]

{ #category : #accessing }
MOOntologicalConstraint >> can: anObject state: anOtherObject with: aSlot [
	<doc: 'Responds if an object can be linked as states to an other object using a specific slot'>
	^ self can: anObject use: anOtherObject with: aSlot
]

{ #category : #accessing }
MOOntologicalConstraint >> can: anObject use: anOtherObject with: aSlot [

	| type relation |
	({ #anchor. #refereeAnchor } includes: aSlot name) ifTrue: [ 
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
	<doc: 'Responds if an object can be linked as referee to an other object using a specific slot'>
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
