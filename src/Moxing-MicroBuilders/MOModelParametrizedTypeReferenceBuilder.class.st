"
I build references to parametrized types: List<Int>  
"
Class {
	#name : #MOModelParametrizedTypeReferenceBuilder,
	#superclass : #MOModelTypeReferenceBuilder,
	#instVars : [
		'argumentTypeReferences'
	],
	#category : #'Moxing-MicroBuilders-type-reference'
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
		              packageReference: self packageReference;
		              parent: self parent;
		              yourself.

	^ typeNames allButFirst
		  inject: parentType
		  into: [ :prev :eachName | 
			  (self instantiate: MOParametrizedTypeReference)
				  name: eachName;
				  parent: prev;
				  packageReference: self packageReference;
				  argumentTypeReferences: self argumentTypeReferences;
				  yourself ]
]

{ #category : #'as yet unclassified' }
MOModelParametrizedTypeReferenceBuilder >> buildTypeReference [

	^ (self instantiate: MOParametrizedTypeReference)
		  candidateAnchor: self candidateAnchor;
		  candidate: self candidate;
		  name: self name;
		  packageReference: self packageReference;
		  parent: self parent;
		  argumentTypeReferences: self argumentTypeReferences;
		  yourself
]
