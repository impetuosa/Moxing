Class {
	#name : #MOModelTypeReferenceBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'candidateAnchor',
		'candidate',
		'name'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #building }
MOModelTypeReferenceBuilder >> build [

	^ (self instantiate: MOTypeReference)
		  candidateAnchor: candidateAnchor;
		  candidate: candidate;
		  name: name;
		  yourself
]

{ #category : #accessing }
MOModelTypeReferenceBuilder >> candidate: aMOClass [ 
	candidate := aMOClass 
]

{ #category : #accessing }
MOModelTypeReferenceBuilder >> candidateAnchor: aMOAnchor [

	candidateAnchor := aMOAnchor
]

{ #category : #accessing }
MOModelTypeReferenceBuilder >> name: aString [ 
	name := aString
]

{ #category : #generated }
MOModelTypeReferenceBuilder >> type: aMOClass [
	self name: aMOClass name .
	self candidateAnchor: aMOClass anchor .
	self candidate: aMOClass
]

{ #category : #'as yet unclassified' }
MOModelTypeReferenceBuilder >> unknownType [
	name := #UNKNOWN 
]
