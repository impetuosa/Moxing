Class {
	#name : #MOModelArtefactReferenceBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'name',
		'candidate'
	],
	#category : #'Moxing-MicroBuilders-type-reference'
}

{ #category : #'as yet unclassified' }
MOModelArtefactReferenceBuilder >> buildsType [

	^ MOArtefactReference
]

{ #category : #accessing }
MOModelArtefactReferenceBuilder >> candidate [

	^ candidate
]

{ #category : #'as yet unclassified' }
MOModelArtefactReferenceBuilder >> loadBuilderWithEntity: anEntity [

	self name: anEntity name.
	self candidate: anEntity candidate
]

{ #category : #'as yet unclassified' }
MOModelArtefactReferenceBuilder >> name [

	^ name isEmptyOrNil
		  ifTrue: [ self error: 'no name ' ]
		  ifFalse: [ name ]
]

{ #category : #'as yet unclassified' }
MOModelArtefactReferenceBuilder >> name: aName [

	name := aName
]

{ #category : #'as yet unclassified' }
MOModelArtefactReferenceBuilder >> privateBuild [

	^ (self instantiate: MOArtefactReference)
		  name: self name;
		  candidate: self candidate;
		  yourself
]
