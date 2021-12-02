Class {
	#name : #MOModelArrayTypeReferenceBuilder,
	#superclass : #MOModelParametrizedTypeReferenceBuilder,
	#category : #'Moxing-MicroBuilders'
}

{ #category : #'initialize-release' }
MOModelArrayTypeReferenceBuilder >> baseType: aMOTypeReference [

	self argumentTypeReferences: { aMOTypeReference }
]

{ #category : #accessing }
MOModelArrayTypeReferenceBuilder >> privateBuild [

	^ (self instantiate: MOArrayTypeReference)
		  candidateAnchor: self candidateAnchor;
		  candidate: self candidate;
		  argumentTypeReferences: self argumentTypeReferences;
		  yourself
]
