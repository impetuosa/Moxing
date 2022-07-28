Class {
	#name : #MOModelControlFlowTestCase,
	#superclass : #MOMicroWriterTestCase,
	#category : #'Moxing-MicroWritersTest'
}

{ #category : #'if ' }
MOModelControlFlowTestCase >> testWriteDoUntil [

	| fn doUntil |
	fn := writer writeSubprocedure: [ :function | 
		      function selector: #hello.
		      function writeBlock: [ :block | 
			      block writeDoUntil: [ : do | 
				      do
					      writeBlock: [ :loopingBlock |  ];
					      writeCondition: [ :expression | 
						      expression
							      compare: (expression numericLiteral: 30)
							      is: #>
							      than: (expression numericLiteral: 10) ] ] ] ].
	doUntil := fn block statements first.
	self assert: doUntil parent equals: fn block.
	self assert: fn block parent equals: fn.
	self assert: (doUntil isKindOf: MODoUntil).
	self assert: (doUntil loopingBlock isKindOf: MOEmptyBlock ).
	self assert:
		(doUntil condition isKindOf: MOBinaryComparisonOperation).
	self assert: doUntil condition left literal equals: 30.
	self assert: doUntil condition right literal equals: 10.
	self assert: doUntil condition operator equals: #>.

	self assertAllAnchorsAreSet.
	self assertAllParentsAreSet
]

{ #category : #'if ' }
MOModelControlFlowTestCase >> testWriteFor [

	| fn for |
	fn := writer writeSubprocedure: [ :function | 
		      function selector: #hello.
		      function writeBlock: [ :block | 
			      block writeFor: [ : forWriter  | 
				      forWriter
					      writeInitializeOperation: [ :expression |  ];
					      writeCondition: [ :expression | 
						      expression
							      compare: (expression numericLiteral: 30)
							      is: #>
							      than: (expression numericLiteral: 10) ];
					      writeUpdateOperation: [ :expression |  ];
					      writeBlock: [ :loopingBlock |  ] ] ] ].
	for := fn block statements first.
	self assert: for parent equals: fn block.
	self assert: (for isKindOf: MOFor).
	self assert: (for loopingBlock isKindOf: MOEmptyBlock).
	self assert: (for condition isKindOf: MOBinaryComparisonOperation).
	self assert: for condition left literal equals: 30.
	self assert: for condition right literal equals: 10.
	self assert: for condition operator equals: #>.
	self assertAllAnchorsAreSet.
	self assertAllParentsAreSet
]

{ #category : #'if ' }
MOModelControlFlowTestCase >> testWriteForEach [

	| fn forEach |
	fn := writer writeSubprocedure: [ :function | 
		      function selector: #hello.
		      function writeBlock: [ :block | 
			      block writeForEach: [ :forEachWriter | 
				      forEachWriter
					      writeEach: [ :expression | 
						      expression variableReferenceNamed: #i ];
					      writeCollection: [ :expression | 
						      expression variableReferenceNamed: #c ];
					      writeBlock: [ :looping |  ] ] ] ].
	forEach := fn block statements first.
	self assert: forEach parent equals: fn block.
	self assert: (forEach isKindOf: MOForEach).
	self assert: (forEach loopingBlock isKindOf: MOEmptyBlock).
	self assert: (forEach each isKindOf: MOVariableReference).
	self assert: (forEach collection isKindOf: MOVariableReference).
	self assertAllAnchorsAreSet.
	self assertAllParentsAreSet
]

{ #category : #'if ' }
MOModelControlFlowTestCase >> testWriteIfElse [

	| fn if |
	fn := writer writeSubprocedure: [ :function | 
		      function selector: #hello.
		      function writeBlock: [ :block | 
			      block writeIfElse: [ :ifElseWriter | 
				      ifElseWriter
					      writeCondition: [ :expression | 
						      expression
							      compare: (expression numericLiteral: 30)
							      is: #>
							      than: (expression numericLiteral: 10) ];
					      writeIfTrueBlock: [ :ifTrueBlock |  ];
					      writeIfFalseBlock: [ :ifFalseBlock |  ] ] ] ].
	if := fn block statements first.
	self assert: if parent equals: fn block.
	self assert: (if isKindOf: MOIfElse).
	self assert: (if ifTrue isKindOf: MOEmptyBlock).
	self assert: (if ifFalse isKindOf: MOEmptyBlock).
	self assert: (if condition isKindOf: MOBinaryComparisonOperation).
	self assert: if condition left literal equals: 30.
	self assert: if condition right literal equals: 10.
	self assert: if condition operator equals: #>.
	self assertAllAnchorsAreSet.
	self assertAllParentsAreSet
]

{ #category : #'if ' }
MOModelControlFlowTestCase >> testWriteIfNoElse [

	| fn if |
	fn := writer writeSubprocedure: [ :function | 
		      function selector: #hello.
		      function writeBlock: [ :block | 
			      block writeIfElse: [ :ifElseWriter | 
				      ifElseWriter
					      writeCondition: [ :expression | 
						      expression
							      compare: (expression numericLiteral: 30)
							      is: #>
							      than: (expression numericLiteral: 10) ];
					      writeIfTrueBlock: [ :ifTrueBlock |  ] ] ] ].
	if := fn block statements first.
	self assert: if parent equals: fn block.
	self assert: (if isKindOf: MOIfElse).
	self assert: (if ifTrue isKindOf: MOEmptyBlock).
	self assert: (if ifFalse isKindOf: MOEmptyBlock).
	self assert: (if condition isKindOf: MOBinaryComparisonOperation).
	self assert: if condition left literal equals: 30.
	self assert: if condition right literal equals: 10.
	self assert: if condition operator equals: #>.
	self assertAllAnchorsAreSet.
	self assertAllParentsAreSet
]

{ #category : #'if ' }
MOModelControlFlowTestCase >> testWriteIfOnlyElse [

	| fn if |
	fn := writer writeSubprocedure: [ :function | 
		      function selector: #hello.
		      function writeBlock: [ :block | 
			      block writeIfElse: [ :ifElseWriter | 
				      ifElseWriter
					      writeCondition: [ :expression | 
						      expression
							      compare: (expression numericLiteral: 30)
							      is: #>
							      than: (expression numericLiteral: 10) ];
					      writeIfFalseBlock: [ :ifTrueBlock |  ] ] ] ].
	if := fn block statements first.
	self assert: if parent equals: fn block.
	self assert: (if isKindOf: MOIfElse).
	self assert: (if ifTrue isKindOf: MOEmptyBlock).
	self assert: (if ifFalse isKindOf: MOEmptyBlock).
	self assert: (if condition isKindOf: MOBinaryComparisonOperation).
	self assert: if condition left literal equals: 30.
	self assert: if condition right literal equals: 10.
	self assert: if condition operator equals: #>.
	self assertAllAnchorsAreSet.
	self assertAllParentsAreSet
]

{ #category : #'if ' }
MOModelControlFlowTestCase >> testWriteWhile [

	| fn while |
	fn := writer writeSubprocedure: [ :function | 
		      function selector: #hello.
		      function writeBlock: [ :block | 
			      block writeWhile: [ :whileWriter | 
				      whileWriter
					      writeCondition: [ :expression | 
						      expression
							      compare: (expression numericLiteral: 30)
							      is: #>
							      than: (expression numericLiteral: 10) ];
					      writeBlock: [ :loopingBlock |  ] ] ] ].
	while := fn block statements first.
	self assert: while parent equals: fn block.
	self assert: (while isKindOf: MOWhile).
	self assert: (while loopingBlock isKindOf: MOEmptyBlock).
	self assert: (while condition isKindOf: MOBinaryComparisonOperation).
	self assert: while condition left literal equals: 30.
	self assert: while condition right literal equals: 10.
	self assert: while condition operator equals: #>.
	self assertAllAnchorsAreSet.
	self assertAllParentsAreSet
]
