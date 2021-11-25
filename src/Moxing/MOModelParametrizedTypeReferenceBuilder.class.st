Class {
	#name : #MOModelParametrizedTypeReferenceBuilder,
	#superclass : #MOModelTypeReferenceBuilder,
	#instVars : [
		'argumentTypeReferences'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #accessing }
MOModelParametrizedTypeReferenceBuilder >> argumentTypeReferences [
	^ argumentTypeReferences
]

{ #category : #'as yet unclassified' }
MOModelParametrizedTypeReferenceBuilder >> argumentTypeReferences: aCollection [

	argumentTypeReferences := aCollection
]

{ #category : #building }
MOModelParametrizedTypeReferenceBuilder >> build [

	^ (self instantiate: MOParametrizedTypeReference)
		  candidateAnchor: self candidateAnchor;
		  candidate: self candidate;
		  name: self name;
		  argumentTypeReferences: self argumentTypeReferences;
		  yourself
]
