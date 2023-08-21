Class {
	#name : #MOSwitchWriter,
	#superclass : #MOAbstractStatementWriter,
	#category : #'Moxing-Language-MicroWriters-Statements'
}

{ #category : #writing }
MOSwitchWriter >> acceptWritingVisitor: aVisitor [

	^ aVisitor visitSwitchWriter: self
]

{ #category : #'as yet unclassified' }
MOSwitchWriter >> accessAttribute: aString receiver: anExpressionBuildingBlock [ 

	^ builder attributeAccessBuilder
		  name: aString;
		  receiverReference:
			  (self writeExpression: anExpressionBuildingBlock);
		  build
]

{ #category : #writing }
MOSwitchWriter >> addCase: aMOCase [

	writeBuilder addCase: aMOCase
]

{ #category : #'as yet unclassified' }
MOSwitchWriter >> arrayAccess: anExpressionBuildingBlock arguments: anArgumentsBlock [

	^ builder arrayAccessBuilder
		  arguments: (self writeUnregisteredExpression: anArgumentsBlock);
		  receiverReference:
			  (self writeUnregisteredExpression: anExpressionBuildingBlock);
		  build
]

{ #category : #writing }
MOSwitchWriter >> expression: anExpression [

	writeBuilder expression: anExpression
]

{ #category : #writing }
MOSwitchWriter >> initializeWriteBuilder [

	writeBuilder := builder switchBuilder 
]

{ #category : #expressions }
MOSwitchWriter >> invokeMethodNamed: aString receiver: anExpressionBuildingBlock arguments: anOtherExpressionBuildingBlock [

	^ builder methodInvocationBuilder
		  selector: aString;
		  receiverReference:
			  (self writeExpression: anExpressionBuildingBlock);
		  arguments: (self writeExpression: anOtherExpressionBuildingBlock);
		  build
]

{ #category : #expressions }
MOSwitchWriter >> operate: anExpressionBuildingBlock operator: anOperatorString with: anOtherExpressionBuildingBlock [

	^ builder arithmeticOperatorBuilder
		  operator: anOperatorString asSymbol;
		  left: (self writeUnregisteredExpression:  anExpressionBuildingBlock);
		  right: (self writeUnregisteredExpression: anOtherExpressionBuildingBlock);
		  build
]

{ #category : #'as yet unclassified' }
MOSwitchWriter >> prefixOperate: aFullBlockClosure operator: anOperator [ 

	^ builder arithmeticUnaryOperationBuilder
		  operand: (self writeExpression: aFullBlockClosure);
		  operator: anOperator;
		  setAsPrefixOperator;
		  build
]

{ #category : #writing }
MOSwitchWriter >> writeCase: aBlock [

	^ self write: aBlock inSubWriter: MOSwitchCaseWriter
]

{ #category : #writing }
MOSwitchWriter >> writeCondition: aConditionBlock [
	writeBuilder expression: (self writeExpression: aConditionBlock)
]
