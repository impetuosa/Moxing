Class {
	#name : #MOExpressionWriter,
	#superclass : #MOModelProceduralWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #'as yet unclassified' }
MOExpressionWriter >> accessAttribute: aString receiver: anExpressionBuildingBlock [ 

	^ builder attributeAccessBuilder
		  name: aString;
		  receiverReference:
			  (self writeExpression: anExpressionBuildingBlock);
		  build
]

{ #category : #'as yet unclassified' }
MOExpressionWriter >> arrayAccess: anExpressionBuildingBlock arguments: anArgumentsBlock [

	^ builder arrayAccessBuilder
		  arguments: (self writeExpression: anArgumentsBlock);
		  receiverReference:
			  (self writeExpression: anExpressionBuildingBlock);
		  build
]

{ #category : #'as yet unclassified' }
MOExpressionWriter >> build [ 

	| entity |

	entity := writeResult .
	self installFromTo: entity.
	^ entity
]

{ #category : #'as yet unclassified' }
MOExpressionWriter >> compare: aLeft is: anOperatorString than: aRight [

	^ builder comparisonOperatorBuilder
		  operator: anOperatorString asSymbol;
		  left: aLeft;
		  right: aRight;
		  build
]

{ #category : #writing }
MOExpressionWriter >> initializeWriteBuilder [

]

{ #category : #'as yet unclassified' }
MOExpressionWriter >> installCopyingBuilder [

	copyHelper := builder expressionCopyHelper
		              writer: self;
		              yourself
]

{ #category : #'as yet unclassified' }
MOExpressionWriter >> invocation: aString arguments: anExpressionBuildingBlock [

	^ builder invocationBuilder
		  selector: aString;
		  arguments: (self writeExpression: anExpressionBuildingBlock);
		  build
]

{ #category : #'as yet unclassified' }
MOExpressionWriter >> invokeMethodNamed: aString receiver: aFullBlockClosure [

	^ builder methodInvocationBuilder
		  selector: aString;
		  receiverReference: (self writeExpression: aFullBlockClosure);
		  build
]

{ #category : #'as yet unclassified' }
MOExpressionWriter >> invokeMethodNamed: aString receiver: anExpressionBuildingBlock arguments: anOtherExpressionBuildingBlock [

	^ builder methodInvocationBuilder
		  selector: aString;
		  receiverReference:
			  (self writeExpression: anExpressionBuildingBlock);
		  arguments: (self writeExpression: anOtherExpressionBuildingBlock);
		  build
]

{ #category : #'as yet unclassified' }
MOExpressionWriter >> invokeNamed: aString arguments: anOtherExpressionBuildingBlock [

	^ builder invocationBuilder
		  selector: aString;
		  arguments: (self writeExpression: anOtherExpressionBuildingBlock);
		  build
]

{ #category : #'as yet unclassified' }
MOExpressionWriter >> invokeNewExpressionOnType: aTypeReference withArguments: aCollection [

	^ builder newExpressionBuilder
		  typeReference: aTypeReference;
		  arguments: aCollection;
		  build
]

{ #category : #'as yet unclassified' }
MOExpressionWriter >> isuable [
	^ true 
]

{ #category : #'as yet unclassified' }
MOExpressionWriter >> labelReference: aString [

	^ builder labelReferenceBuilder
		  label: aString;
		  build
]

{ #category : #'as yet unclassified' }
MOExpressionWriter >> let: aVariableReferenceOrBlock beAssignedWith: aValueExpressionOrBlock [

	^ builder assignmentBuilder
		  write: (self writeExpression: aVariableReferenceOrBlock);
		  read: (self writeExpression: aValueExpressionOrBlock);
		  build
]

{ #category : #'instance creation' }
MOExpressionWriter >> new: aMOTypeReference [

	^ builder newExpressionBuilder
		  typeReference: aMOTypeReference;
		  build
]

{ #category : #'as yet unclassified' }
MOExpressionWriter >> nullLiteral [

	^ builder nullLiteralBuilder build
]

{ #category : #'as yet unclassified' }
MOExpressionWriter >> operate: aFullBlockClosure operator: anOperator order: anOrder [

	^ builder arithmeticUnaryOperationBuilder
		  operand: (self writeExpression: aFullBlockClosure);
		  operator: anOperator;
		  order: anOrder;
		  build
]

{ #category : #'as yet unclassified' }
MOExpressionWriter >> operate: anExpressionBuildingBlock operator: anOperatorString with: anOtherExpressionBuildingBlock [

	^ builder arithmeticOperatorBuilder
		  operator: anOperatorString asSymbol;
		  left: (self writeExpression: anExpressionBuildingBlock);
		  right: (self writeExpression: anOtherExpressionBuildingBlock);
		  build
]

{ #category : #'as yet unclassified' }
MOExpressionWriter >> operateBoolean: anExpressionBuildingBlock operator: anOperatorString with: anOtherExpressionBuildingBlock [

	^ builder arithmeticBooleanOperatorBuilder
		  operator: anOperatorString asSymbol;
		  left: (self writeExpression: anExpressionBuildingBlock);
		  right: (self writeExpression: anOtherExpressionBuildingBlock);
		  build
]

{ #category : #'as yet unclassified' }
MOExpressionWriter >> referenceToSelf [

	^ builder referenceToSelf
]

{ #category : #'as yet unclassified' }
MOExpressionWriter >> writeCopyOf: aProvenanceEntity readingValues: aChildDelegateLoadingBlock [

	self installCopyingBuilder.


	^ copyHelper
		  buildCopyOf: aProvenanceEntity
		  readingValues: aChildDelegateLoadingBlock
		  into: self
]

{ #category : #writing }
MOExpressionWriter >> writeExpression: aFullBlockClosure [ 
	^ aFullBlockClosure cull: self 
]

{ #category : #'as yet unclassified' }
MOExpressionWriter >> writenExpression: aMOVariableReference [

	^ aMOVariableReference
]
