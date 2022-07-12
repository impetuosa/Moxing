Class {
	#name : #MOJavaTypeReferenceVisitor,
	#superclass : #MOTypeReferenceVisitor,
	#category : #'Moxing-Java-Loader'
}

{ #category : #visiting }
MOJavaTypeReferenceVisitor >> visitArrayType: aJavaArrayTypeNode [

	^ writer arrayTypeReferenceOf:
		  (aJavaArrayTypeNode baseType acceptVisitor: self)
]

{ #category : #visiting }
MOJavaTypeReferenceVisitor >> visitBooleanType: aJavaBooleanTypeNode [

	^ self visitPrimitiveType: aJavaBooleanTypeNode
]

{ #category : #visiting }
MOJavaTypeReferenceVisitor >> visitByteType: aJavaByteTypeNode [

	^ self visitPrimitiveType: aJavaByteTypeNode
]

{ #category : #visiting }
MOJavaTypeReferenceVisitor >> visitCharType: aJavaCharTypeNode [

	^ self visitPrimitiveType: aJavaCharTypeNode
]

{ #category : #visiting }
MOJavaTypeReferenceVisitor >> visitClassType: aJavaClassTypeNode [

	^ aJavaClassTypeNode name acceptVisitor: self
]

{ #category : #visiting }
MOJavaTypeReferenceVisitor >> visitCollection: aCollection [

	^ aCollection collect: [ :element | element acceptVisitor: self ]
]

{ #category : #visiting }
MOJavaTypeReferenceVisitor >> visitDoubleType: aJavaDoubleTypeNode [

	^ self visitPrimitiveType: aJavaDoubleTypeNode
]

{ #category : #visiting }
MOJavaTypeReferenceVisitor >> visitFloatType: aJavaFloatTypeNode [

	^ self visitPrimitiveType: aJavaFloatTypeNode
]

{ #category : #visiting }
MOJavaTypeReferenceVisitor >> visitIntType: aJavaIntTypeNode [

	^ self visitPrimitiveType: aJavaIntTypeNode
]

{ #category : #visiting }
MOJavaTypeReferenceVisitor >> visitLongType: aJavaLongTypeNode [

	^ self visitPrimitiveType: aJavaLongTypeNode
]

{ #category : #visiting }
MOJavaTypeReferenceVisitor >> visitPrimitiveType: aJavaLongTypeNode [

	^ writer primitiveTypeReferenceNamed: aJavaLongTypeNode token value
]

{ #category : #visiting }
MOJavaTypeReferenceVisitor >> visitQualifiedName: aJavaQualifiedNameNode [

	^ writer
		  qualifiedTypeReferenceNamed: aJavaQualifiedNameNode name value
		  receiver: (writer writeUnregisteredExpression: [ :expr | 
				   aJavaQualifiedNameNode nspace acceptVisitor: self ])
]

{ #category : #visiting }
MOJavaTypeReferenceVisitor >> visitQualifiedTypeName: aJavaQualifiedTypeNameNode [

	| fullName |
	fullName := aJavaQualifiedTypeNameNode nspace source , '.'
	            , aJavaQualifiedTypeNameNode name source.
	^ aJavaQualifiedTypeNameNode arguments
		  ifNotEmpty: [ 
			  writer
				  parametrizedTypeReferenceFullyNamed: fullName
				  arguments:
				  (self visitCollection: aJavaQualifiedTypeNameNode arguments) ]
		  ifEmpty: [ 
		  writer typeReferenceFullNamed: aJavaQualifiedTypeNameNode source ]
]

{ #category : #visiting }
MOJavaTypeReferenceVisitor >> visitShortType: aJavaShortTypeNode [

	^ self visitPrimitiveType: aJavaShortTypeNode
]

{ #category : #visiting }
MOJavaTypeReferenceVisitor >> visitTypeArgument: aJavaTypeArgumentNode [

	^ aJavaTypeArgumentNode type
		  ifNil: [ 
			  self assert: aJavaTypeArgumentNode questionMark isNotNil.
			  writer questionMarkTypeReference ]
		  ifNotNil: [ aJavaTypeArgumentNode type acceptVisitor: self ]
]

{ #category : #visiting }
MOJavaTypeReferenceVisitor >> visitTypeName: aJavaTypeNameNode [ 
	^ writer typeReferenceNamed: aJavaTypeNameNode name value. 
]

{ #category : #visiting }
MOJavaTypeReferenceVisitor >> visitVoidType: aJavaVoidTypeNode [

	^ writer primitiveTypeReferenceNamed:
		  aJavaVoidTypeNode voidToken value
]
