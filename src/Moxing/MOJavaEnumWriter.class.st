Class {
	#name : #MOJavaEnumWriter,
	#superclass : #MOJavaClassWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #'as yet unclassified' }
MOJavaEnumWriter >> accessAttribute: aString receiver: anExpressionBuildingBlock [ 

	^ builder attributeAccessBuilder
		  name: aString;
		  receiverReference:
			  (self writeExpression: anExpressionBuildingBlock);
		  build
]

{ #category : #initialization }
MOJavaEnumWriter >> addEnumEntry: aMOEnumEntry [ 
	writeBuilder addEnumEntry: aMOEnumEntry 
]

{ #category : #generated }
MOJavaEnumWriter >> expression: aMOVariableReference [

	^ aMOVariableReference
]

{ #category : #initialization }
MOJavaEnumWriter >> initializeWriteBuilder [

	writeBuilder := builder primitiveJavaEnumBuilder
]

{ #category : #initialization }
MOJavaEnumWriter >> privateWriteToSurface: anEntity [

	surface addJavaEnum: anEntity
]

{ #category : #writing }
MOJavaEnumWriter >> writeEntry: aBlock [
	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOEnumEntryWriter.
	^ stmnt
]
