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

{ #category : #'as yet unclassified' }
MOModelParametrizedTypeReferenceBuilder >> buildSubtypeReference [

	| parentType typeNames |
	self assert: self candidate isNil.
	self assert: self candidateAnchor isNil.
	typeNames := '$' split: self name.
	parentType := (self instantiate: MOTypeReference)
		              candidate: self candidate;
		              name: typeNames first;
		              parent: self parent;
		              yourself.
	^ typeNames allButFirst
		  inject: parentType
		  into: [ :prev :eachName | 
			  (self instantiate: MOParametrizedTypeReference)
				  name: eachName;
				  parent: prev;
				  argumentTypeReferences: self argumentTypeReferences;
				  yourself ]
]

{ #category : #'as yet unclassified' }
MOModelParametrizedTypeReferenceBuilder >> buildTypeReference [

	^ (self instantiate: MOParametrizedTypeReference)
		  candidateAnchor: self candidateAnchor;
		  candidate: self candidate;
		  name: self name;
		  parent: self parent;
		  argumentTypeReferences: self argumentTypeReferences;
		  yourself
]
