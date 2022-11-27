Class {
	#name : #MOSwitchWriter,
	#superclass : #MOAbstractStatementWriter,
	#category : #'Moxing-MicroWriters'
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

{ #category : #writing }
MOSwitchWriter >> writeCase: aBlock [

	^ self write: aBlock inSubWriter: MOSwitchCaseWriter
]

{ #category : #writing }
MOSwitchWriter >> writeCondition: aConditionBlock [
	writeBuilder expression: (self writeExpression: aConditionBlock)
]
