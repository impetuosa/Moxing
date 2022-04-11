Class {
	#name : #MOExpressionWriter,
	#superclass : #MOModelProceduralWriter,
	#instVars : [
		'shouldRegisterResult',
		'writingRelation'
	],
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

{ #category : #adding }
MOExpressionWriter >> addAnnotationInstance: aMOAnnotationInstance [

	^ aMOAnnotationInstance
]

{ #category : #'as yet unclassified' }
MOExpressionWriter >> argumentNamed: anArgumentName expression: aFullBlockClosure [

	^ builder namedArgumentBuilder
		  name: anArgumentName;
		  argumentExpressions: (self writeExpression: aFullBlockClosure);
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
MOExpressionWriter >> classExpression: aMOTypeReference [

	^ builder classExpressionBuilder
]

{ #category : #'as yet unclassified' }
MOExpressionWriter >> compare: aLeft is: anOperatorString than: aRight [

	^ builder comparisonOperatorBuilder
		  operator: anOperatorString asSymbol;
		  left: aLeft;
		  right: aRight;
		  build
]

{ #category : #'as yet unclassified' }
MOExpressionWriter >> doNotRegister [

	shouldRegisterResult := false
]

{ #category : #'as yet unclassified' }
MOExpressionWriter >> forUpdate: aMOVariableReference [ 
	writeBuilder forUpdate: aMOVariableReference 
]

{ #category : #'as yet unclassified' }
MOExpressionWriter >> initialize [

	super initialize.
	shouldRegisterResult := true 
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

{ #category : #generated }
MOExpressionWriter >> operator: aString [ 
	writeBuilder operator: aString 
]

{ #category : #'as yet unclassified' }
MOExpressionWriter >> pragma: aString arguments: aFullBlockClosure [

	| arguments |
	arguments := self writeExpression: aFullBlockClosure.

	^ builder pragmaBuilder
		  selector: aString;
		  arguments: arguments;
		  build
]

{ #category : #writing }
MOExpressionWriter >> privateWriteToSurface: anEntity [

	shouldRegisterResult ifTrue: [ surface expression: anEntity ]
]

{ #category : #accessing }
MOExpressionWriter >> receiverReference: aMOTypeReference [ 
	writeBuilder receiverReference: aMOTypeReference 
]

{ #category : #'as yet unclassified' }
MOExpressionWriter >> referenceToSelf [

	^ builder referenceToSelf
]

{ #category : #'as yet unclassified' }
MOExpressionWriter >> referenceToThisContext [

	^ builder referenceToThisContext
]

{ #category : #initialization }
MOExpressionWriter >> setWriteVariable: aMOVariableReference [

	writeBuilder write: aMOVariableReference
]

{ #category : #'as yet unclassified' }
MOExpressionWriter >> stArrayExpression: aFullBlockClosure [

	| elements |
	elements := self writeExpression: aFullBlockClosure.
	^ builder stArrayExpressionBuilder
		  elements: elements;
		  build
]

{ #category : #'as yet unclassified' }
MOExpressionWriter >> stCascadeWith: aFullBlockClosure [

	| messages |
	messages := self writeExpression: aFullBlockClosure.
	^ builder stCascadeBuilder
		  invocations: messages;
		  build
]

{ #category : #writing }
MOExpressionWriter >> writeAnnotation: aFullBlockClosure [ 
	
	^ self write: aFullBlockClosure inSubWriter: MOAnnotationWriter
]

{ #category : #writing }
MOExpressionWriter >> writeBlockClosure: aFullBlockClosure [

	^ self write: aFullBlockClosure inSubWriter: MOBlockClosureWriter
]

{ #category : #writing }
MOExpressionWriter >> writeExpression: aFullBlockClosure [ 

	^ self writeUnregisteredExpression: aFullBlockClosure
]

{ #category : #writing }
MOExpressionWriter >> writeLiteralForValue: aString [

	^ self literalForValue: aString
]

{ #category : #'as yet unclassified' }
MOExpressionWriter >> writeMethod: aM [.
	 self halt. 
]

{ #category : #writing }
MOExpressionWriter >> writeReferenceToSelf [

	^ self referenceToSelf
]

{ #category : #writing }
MOExpressionWriter >> writeReferenceToSuper [

	^ self referenceToSuper
]

{ #category : #writing }
MOExpressionWriter >> writeReferenceToThisContext [

	^ self referenceToThisContext
]

{ #category : #writing }
MOExpressionWriter >> writeVariableAccess: aFullBlockClosure [ 
	self shouldBeImplemented.
]

{ #category : #writing }
MOExpressionWriter >> writeVariableAccessNamed: aString [

	^ self typeReferenceNamed: aString
]

{ #category : #'as yet unclassified' }
MOExpressionWriter >> writenExpression: aMOVariableReference [

	^ aMOVariableReference
]

{ #category : #'as yet unclassified' }
MOExpressionWriter >> writingType [

	^ nil
]
