Class {
	#name : #MOStatementWriterTestCase,
	#superclass : #MOMicroWriterTestCase,
	#category : #'Moxing-MicroWritersTest'
}

{ #category : #tests }
MOStatementWriterTestCase >> testWriteArithemtic [

	| fn expression |
	fn := writer writeFunction: [ :function | 
		      function selector: #hello.
		      function returnTypeReference:
			      (function typeReferenceNamed: #int).

		      function writeBlock: [ :block | 
			      block writeStatement: [ :statements | 
				      statements
					      operate: [ :e | e numericLiteral: 30 ]
					      operator: #**
					      with: [ :e | e variableReferenceNamed: #p ] ] ] ].
	expression := fn block statements first.
	self assert: expression parent equals: fn block.
	self assert: (expression expression isKindOf: MOBinaryArithmeticOperation).
	self assert: expression expression operator equals: #**.
	self assertAllAnchorsAreSet.
	self assertAllParentsAreSet
]

{ #category : #tests }
MOStatementWriterTestCase >> testWriteAssignment [

	| fn assignment |
	fn := writer writeFunction: [ :function | 
		      function selector: #hello.
		      function returnTypeReference:
			      (function typeReferenceNamed: #int).

		      function writeBlock: [ :block | 
			      block writeStatement: [ :statements | 
				      statements
					      let: [ :exp | exp variableReferenceNamed: #p ]
					      beAssignedWith: [ :exp | exp numericLiteral: 30 ] ] ] ].
	assignment := fn block statements first.
	self assert: assignment parent equals: fn block.
	self assert: (assignment expression isKindOf: MOAssignment).
	self assert: assignment expression read literal equals: 30.
	self assert: assignment expression write name equals: #p.
	self assertAllAnchorsAreSet.
	self assertAllParentsAreSet
]

{ #category : #tests }
MOStatementWriterTestCase >> testWriteBooleanArithemtic [

	| fn expression |
	fn := writer writeFunction: [ :function | 
		      function selector: #hello.
		      function returnTypeReference:
			      (function typeReferenceNamed: #int).

		      function writeBlock: [ :block | 
			      block writeStatement: [ :statements | 
				      statements
					      operateBoolean: [ :exp | exp booleanLiteral: true ]
					      operator: #&&
					      with: [ :exp | exp variableReferenceNamed: #p ] ] ] ].
	expression := fn block statements first.
	self assert: expression parent equals: fn block.
	self assert: expression expression parent equals: expression.
	self assert:
		(expression expression isKindOf: MOBinaryBooleanOperation).
	self assert: expression expression operator equals: #&&.
	self assertAllAnchorsAreSet.
	self assertAllParentsAreSet
]

{ #category : #tests }
MOStatementWriterTestCase >> testWriteComparison [

	| fn expression |
	fn := writer writeFunction: [ :function | 
		      function selector: #hello.
		      function returnTypeReference:
			      (function typeReferenceNamed: #int).

		      function writeBlock: [ :block | 
			      block writeStatement: [ :statements | 
				      statements
					      compare: (statements numericLiteral: 10)
					      is: #>
					      than: [ statements variableReferenceNamed: #p ] ] ] ].
	expression := fn block statements first.
	self assert: expression parent equals: fn block.
	self assert: (expression expression isKindOf: MOBinaryComparisonOperation).
	self assert: expression expression operator equals: #>.
	self assertAllAnchorsAreSet.
	self assertAllParentsAreSet
]

{ #category : #tests }
MOStatementWriterTestCase >> testWriteInvokeFunction [

	| fn return |
	fn := writer writeFunction: [ :function | 
		      function selector: #selector.
		      function returnTypeReference:
			      (function typeReferenceNamed: #int).

		      function writeBlock: [ :block | 
			      block writeStatement: [ :statements | 
				      statements
					      invokeNamed: #fnExample
					      arguments: [ :exp | {  } ] ] ] ].

	return := fn block statements first.
	self assert: return parent equals: fn block.
	self assert: (return isKindOf: MOStatementExpression).
	self assert: (return expression isKindOf: MOInvocation).
	self assert: return expression selector equals: #fnExample.
	self assertAllAnchorsAreSet.
	self assertAllParentsAreSet
]

{ #category : #tests }
MOStatementWriterTestCase >> testWriteInvokeMethod [

	| fn return |
	fn := writer writeFunction: [ :function | 
		      function selector: #selector.
		      function returnTypeReference:
			      (function typeReferenceNamed: #int).
		      function writeBlock: [ :block | 
			      block writeStatement: [ :statements | 
				      statements
					      invokeMethodNamed: #mthInvocationSelector
					      receiver: [ :exp | exp referenceToSelf ]
					      arguments: [ :exp | {  } ] ] ] ].
	return := fn block statements first.
	self assert: return parent equals: fn block.
	self assert: (return isKindOf: MOStatementExpression).
	self assert: (return expression isKindOf: MOMethodInvocation).
	self
		assert: return expression selector
		equals: #mthInvocationSelector.
	self assert:
		(return expression receiverReference isKindOf: MOSelfReference).
	self assertAllAnchorsAreSet.
	self assertAllParentsAreSet
]

{ #category : #tests }
MOStatementWriterTestCase >> testWriteReturn [

	| fn return |
	fn := writer writeFunction: [ :function | 
		      function selector: #hello.
		      function returnTypeReference:
			      (function typeReferenceNamed: #int).

		      function writeBlock: [ :block | 
			      block writeStatement: [ :statements | 
				      statements return: [ :exp | 
					      exp
						      operate: [ exp numericLiteral: 30 ]
						      operator: #+
						      with: [ exp variableReferenceNamed: #p ] ] ] ] ].
	return := fn block statements first.
	self assert: return parent equals: fn block.
	self assert: (return isKindOf: MOReturn).
	self assert:
		(return expression isKindOf: MOBinaryArithmeticOperation).
	self assertAllAnchorsAreSet.
	self assertAllParentsAreSet
]

{ #category : #tests }
MOStatementWriterTestCase >> testWriteSetToReturn [

	| fn return |
	fn := writer writeFunction: [ :function | 
		      function selector: #hello.
		      function returnTypeReference:
			      (function typeReferenceNamed: #int).

		      function writeBlock: [ :block | 
			      block writeStatement: [ :statements | 
				      statements setToReturn: [ :expression | 
					      expression
						      operate: [ expression numericLiteral: 30 ]
						      operator: #+
						      with: [ expression variableReferenceNamed: #p ] ] ] ] ].
	return := fn block statements first.
	self assert: return parent equals: fn block.
	self assert: (return isKindOf: MOSetToReturn).
	self assert:
		(return expression isKindOf: MOBinaryArithmeticOperation).
	self assertAllAnchorsAreSet.
	self assertAllParentsAreSet
]

{ #category : #tests }
MOStatementWriterTestCase >> testWriteVariable [

	| fn expression |
	fn := writer writeFunction: [ :function | 
		      function selector: #hello.
		      function returnTypeReference:
			      (function typeReferenceNamed: #int).

		      function writeBlock: [ :block | 
			      block writeStatement: [ :statements | 
				      statements
					      variable: #name
					      typeReference: (statements typeReferenceNamed: #int) ] ] ].
	expression := fn block statements first.
	self assert: expression parent equals: fn block.
	self assert: (expression isKindOf: MOVariable).
	self assert: expression name equals: #name.
	self assertAllAnchorsAreSet.
	self assertAllParentsAreSet
]
