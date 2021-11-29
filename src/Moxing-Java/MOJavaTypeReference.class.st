Class {
	#name : #MOJavaTypeReference,
	#superclass : #Object,
	#instVars : [
		'writer'
	],
	#category : #'Moxing-Java-Loader'
}

{ #category : #'as yet unclassified' }
MOJavaTypeReference >> typeReferenceFor: aJavaClassTypeNode [

	^ aJavaClassTypeNode acceptVisitor: self
]

{ #category : #visiting }
MOJavaTypeReference >> visitArrayType: aJavaArrayTypeNode [

	^ writer arrayTypeReferenceOf:
		  (aJavaArrayTypeNode baseType acceptVisitor: self)
]

{ #category : #visiting }
MOJavaTypeReference >> visitBooleanType: aJavaBooleanTypeNode [

	^ self visitPrimitiveType: aJavaBooleanTypeNode
]

{ #category : #visiting }
MOJavaTypeReference >> visitByteType: aJavaByteTypeNode [

	^ self visitPrimitiveType: aJavaByteTypeNode
]

{ #category : #visiting }
MOJavaTypeReference >> visitCharType: aJavaCharTypeNode [

	^ self visitPrimitiveType: aJavaCharTypeNode
]

{ #category : #visiting }
MOJavaTypeReference >> visitClassType: aJavaClassTypeNode [

	^ aJavaClassTypeNode name acceptVisitor: self
]

{ #category : #visiting }
MOJavaTypeReference >> visitCollection: aCollection [

	^ aCollection collect: [ :element | element acceptVisitor: self ]
]

{ #category : #visiting }
MOJavaTypeReference >> visitDoubleType: aJavaDoubleTypeNode [

	^ self visitPrimitiveType: aJavaDoubleTypeNode
]

{ #category : #visiting }
MOJavaTypeReference >> visitFloatType: aJavaFloatTypeNode [

	^ self visitPrimitiveType: aJavaFloatTypeNode
]

{ #category : #visiting }
MOJavaTypeReference >> visitIntType: aJavaIntTypeNode [

	^ self visitPrimitiveType: aJavaIntTypeNode
]

{ #category : #visiting }
MOJavaTypeReference >> visitLongType: aJavaLongTypeNode [

	^ self visitPrimitiveType: aJavaLongTypeNode
]

{ #category : #visiting }
MOJavaTypeReference >> visitName: aJavaNameNode [

	^ writer typeReferenceNamed: aJavaNameNode name value
]

{ #category : #visiting }
MOJavaTypeReference >> visitPrimitiveType: aJavaLongTypeNode [

	^ writer primitiveTypeReferenceNamed: aJavaLongTypeNode token value
]

{ #category : #visiting }
MOJavaTypeReference >> visitQualifiedTypeName: aJavaQualifiedTypeNameNode [

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
MOJavaTypeReference >> visitShortType: aJavaShortTypeNode [

	^ self visitPrimitiveType: aJavaShortTypeNode
]

{ #category : #visiting }
MOJavaTypeReference >> visitTypeArgument: aJavaTypeArgumentNode [

	^ aJavaTypeArgumentNode type
		  ifNil: [ 
			  self assert: aJavaTypeArgumentNode questionMark isNotNil.
			  writer questionMarkTypeReference ]
		  ifNotNil: [ aJavaTypeArgumentNode type acceptVisitor: self ]
]

{ #category : #visiting }
MOJavaTypeReference >> visitTypeName: aJavaTypeNameNode [ 
	^ writer typeReferenceNamed: aJavaTypeNameNode name value. 
]

{ #category : #visiting }
MOJavaTypeReference >> visitVoidType: aJavaVoidTypeNode [

	^ writer primitiveTypeReferenceNamed:
		  aJavaVoidTypeNode voidToken value
]

{ #category : #accessing }
MOJavaTypeReference >> writer: aMOClassWriter [ 
	writer := aMOClassWriter
]
