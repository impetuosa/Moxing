Class {
	#name : #MOModelArtefactTypeReferenceBuilder,
	#superclass : #MOModelTypeReferenceBuilder,
	#instVars : [
		'artefactReference'
	],
	#category : #'Moxing-Language-MicroBuilders-Type-reference'
}

{ #category : #asserting }
MOModelArtefactTypeReferenceBuilder >> artefactReference [

	^ artefactReference ifNil: [ 
		  self error:
			  ' nonsense to make this kind of typeref without an artefact ref ' ]
]

{ #category : #accessing }
MOModelArtefactTypeReferenceBuilder >> artefactReference: aMOArtefactReference [ 
	artefactReference := aMOArtefactReference
]

{ #category : #asserting }
MOModelArtefactTypeReferenceBuilder >> buildSubtypeReference [

	self error: 'whut? '
]

{ #category : #asserting }
MOModelArtefactTypeReferenceBuilder >> buildTypeReference [

	^ (self instantiate: self buildsType)
		  refereeAnchor: self candidateAnchor;
		  referee: self referee;
		  name: self name;
		  packageReference: self packageReference;
		  parent: self parent;
		  artefactReference: self artefactReference;
		  yourself
]

{ #category : #asserting }
MOModelArtefactTypeReferenceBuilder >> buildsType [

	<generated>
	^ MOArtefactTypeReference
]
