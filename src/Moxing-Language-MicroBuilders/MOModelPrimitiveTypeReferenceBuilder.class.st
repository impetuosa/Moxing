"
I build references to primitive types 
"
Class {
	#name : #MOModelPrimitiveTypeReferenceBuilder,
	#superclass : #MOModelTypeReferenceBuilder,
	#category : #'Moxing-Language-MicroBuilders-Type-reference'
}

{ #category : #'as yet unclassified' }
MOModelPrimitiveTypeReferenceBuilder >> buildsType [
<generated>
	^MOPrimitiveTypeReference
]

{ #category : #accessing }
MOModelPrimitiveTypeReferenceBuilder >> privateBuild [

	^ self
		  findInModel: [ :a | 
			  (a isKindOf: MOPrimitiveTypeReference) and: [ a name = self name ] ]
		  ifNone: [ 
			  (self instantiate: MOPrimitiveTypeReference)
				  refereeAnchor: self candidateAnchor;
				  referee: self referee;
				  name: self name;
				  parent: self parent;
				  yourself ]
]

{ #category : #accessing }
MOModelPrimitiveTypeReferenceBuilder >> referee [

	^ candidate ifNil: [ self error: 'Primitive type reference cannot be built without type' ]
]
