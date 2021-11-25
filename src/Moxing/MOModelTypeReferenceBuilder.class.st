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
		  candidateAnchor: self candidateAnchor;
		  candidate: self candidate;
		  name: self name;
		  yourself
]

{ #category : #accessing }
MOModelTypeReferenceBuilder >> candidate [

	^ candidate
]

{ #category : #accessing }
MOModelTypeReferenceBuilder >> candidate: aMOClass [ 
	candidate := aMOClass 
]

{ #category : #accessing }
MOModelTypeReferenceBuilder >> candidateAnchor [
	^ candidateAnchor
]

{ #category : #accessing }
MOModelTypeReferenceBuilder >> candidateAnchor: aMOAnchor [

	candidateAnchor := aMOAnchor
]

{ #category : #accessing }
MOModelTypeReferenceBuilder >> name [ 
	^ name ifNil: [  self error: ' Type name is Nil! ' ]
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
