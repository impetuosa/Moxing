Class {
	#name : #MOModelArtefactReferenceBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'name',
		'candidate'
	],
	#category : #'Moxing-Language-MicroBuilders-type-reference'
}

{ #category : #'as yet unclassified' }
MOModelArtefactReferenceBuilder >> buildsType [

	^ MOArtefactReference
]

{ #category : #'as yet unclassified' }
MOModelArtefactReferenceBuilder >> loadBuilderWithEntity: anEntity [

	self name: anEntity name.
	self referee: anEntity referee
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
		  referee: self referee;
		  yourself
]

{ #category : #accessing }
MOModelArtefactReferenceBuilder >> referee [

	^ candidate
]
