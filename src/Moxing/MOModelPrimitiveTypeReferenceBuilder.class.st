Class {
	#name : #MOModelPrimitiveTypeReferenceBuilder,
	#superclass : #MOModelTypeReferenceBuilder,
	#category : #'Moxing-MicroBuilders'
}

{ #category : #accessing }
MOModelPrimitiveTypeReferenceBuilder >> candidate [

	^ candidate ifNil: [ self error: 'Primitive type reference cannot be built without type' ]
]

{ #category : #accessing }
MOModelPrimitiveTypeReferenceBuilder >> privateBuild [

	^ self
		  findInModel: [ :a | 
			  (a isKindOf: MOPrimitiveTypeReference) and: [ a name = self name ] ]
		  ifNone: [ 
			  (self instantiate: MOPrimitiveTypeReference)
				  candidateAnchor: self candidateAnchor;
				  candidate: self candidate;
				  name: self name;
				  parent: self parent;
				  yourself ]
]
