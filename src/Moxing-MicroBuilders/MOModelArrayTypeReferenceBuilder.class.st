"
I build references to array types: Int[]
"
Class {
	#name : #MOModelArrayTypeReferenceBuilder,
	#superclass : #MOModelParametrizedTypeReferenceBuilder,
	#category : #'Moxing-MicroBuilders-type-reference'
}

{ #category : #'initialize-release' }
MOModelArrayTypeReferenceBuilder >> baseType: aMOTypeReference [
	self assert: aMOTypeReference isReference. 
	self argumentTypeReferences: { aMOTypeReference }
]

{ #category : #'as yet unclassified' }
MOModelArrayTypeReferenceBuilder >> buildsType [

	<generated>
	^ MOArrayTypeReference
]

{ #category : #accessing }
MOModelArrayTypeReferenceBuilder >> privateBuild [

	^ (self instantiate: MOArrayTypeReference)
		  candidateAnchor: self candidateAnchor;
		  candidate: self candidate;
		  argumentTypeReferences: self argumentTypeReferences;
		  yourself
]
