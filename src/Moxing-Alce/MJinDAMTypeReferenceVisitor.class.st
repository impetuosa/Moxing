Class {
	#name : #MJinDAMTypeReferenceVisitor,
	#superclass : #MOTypeReferenceVisitor,
	#category : #'Moxing-Alce'
}

{ #category : #visiting }
MJinDAMTypeReferenceVisitor >> visitMemberReference: aJinDAMMemberReference [ 
	writer mapsToVariableArguments.
	^ writer primitiveTypeReferenceNamed: #Variant. 
]

{ #category : #visiting }
MJinDAMTypeReferenceVisitor >> visitPrimitiveType: aJinDAMPrimitiveType [ 
	^ writer primitiveTypeReferenceNamed: aJinDAMPrimitiveType name
]

{ #category : #visiting }
MJinDAMTypeReferenceVisitor >> visitTypeReference: aJinDAMTypeReference [

	^ aJinDAMTypeReference candidate
		  ifNil: [ 
			  self halt.
			  writer typeReferenceNamed: aJinDAMTypeReference typeName ]
		  ifNotNil: [ :candidate | candidate acceptVisitor: self ]
]
