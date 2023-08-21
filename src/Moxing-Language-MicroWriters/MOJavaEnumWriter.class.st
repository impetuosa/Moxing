Class {
	#name : #MOJavaEnumWriter,
	#superclass : #MOJavaClassWriter,
	#category : #'Moxing-Language-MicroWriters-Declarations'
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

{ #category : #'as yet unclassified' }
MOJavaEnumWriter >> cast: anExpressionBuildingBlock to: aTypeBuildingBlock [

	^ builder castExpressionBuilder
		  expression: (self writeUnregisteredExpression: anExpressionBuildingBlock);
		  typeReference: (self writeUnregisteredExpression: aTypeBuildingBlock);
		  build
]

{ #category : #generated }
MOJavaEnumWriter >> expression: aMOVariableReference [

	^ aMOVariableReference
]

{ #category : #initialization }
MOJavaEnumWriter >> initializeWriteBuilder [

	writeBuilder := builder primitiveJavaEnumBuilder
]

{ #category : #expressions }
MOJavaEnumWriter >> invokeMethodNamed: aString receiver: anExpressionBuildingBlock arguments: anOtherExpressionBuildingBlock [

	^ builder methodInvocationBuilder
		  selector: aString;
		  receiverReference:
			  (self writeUnregisteredExpression:  anExpressionBuildingBlock);
		  arguments: (self writeUnregisteredExpression: anOtherExpressionBuildingBlock);
		  build
]

{ #category : #'instance creation' }
MOJavaEnumWriter >> new: aMOTypeReference arguments: anArgumentsBlock [

	^ builder newExpressionBuilder
		  typeReference: aMOTypeReference;
		  arguments: (self writeExpression: anArgumentsBlock);
		  build
]

{ #category : #expressions }
MOJavaEnumWriter >> operate: anExpressionBuildingBlock operator: anOperatorString with: anOtherExpressionBuildingBlock [

	^ builder arithmeticOperatorBuilder
		  operator: anOperatorString asSymbol;
		  left: (self writeExpression: anExpressionBuildingBlock);
		  right: (self writeExpression: anOtherExpressionBuildingBlock);
		  build
]

{ #category : #'as yet unclassified' }
MOJavaEnumWriter >> prefixOperate: aFullBlockClosure operator: anOperator [ 

	^ builder arithmeticUnaryOperationBuilder
		  operand: (self writeExpression: aFullBlockClosure);
		  operator: anOperator;
		  setAsPrefixOperator;
		  build
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

{ #category : #writing }
MOJavaEnumWriter >> writeLambda: aFullBlockClosure [

	^ self write: aFullBlockClosure inSubWriter: MOLambdaWriter
]
