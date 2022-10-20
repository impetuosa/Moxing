Class {
	#name : #MOCodeGenerator,
	#superclass : #Object,
	#instVars : [
		'stream',
		'indentation',
		'indentationString',
		'isCommenting',
		'versionedAccessorHandler'
	],
	#category : #'Moxing-LanguageModel-Writting'
}

{ #category : #visiting }
MOCodeGenerator >> blockDelimiterClose [

	^ '}'
]

{ #category : #visiting }
MOCodeGenerator >> blockDelimiterOpen [

	^ '{'
]

{ #category : #accessing }
MOCodeGenerator >> comment: aFullBlockClosure [
  isCommenting ifFalse: [ self openComment.
        stream nextPutAll: 'TODO '.
        isCommenting := true.
        aFullBlockClosure value.
        self closeComment.
        isCommenting := false ] ifTrue: [ aFullBlockClosure value ]
]

{ #category : #'as yet unclassified' }
MOCodeGenerator >> increaseDeepDuring: aFullBlockClosure [

	indentation := indentation + 1.
	aFullBlockClosure value.
	indentation := indentation - 1
]

{ #category : #'as yet unclassified' }
MOCodeGenerator >> indentationString [

	^ indentationString ifNil: [ indentationString := String tab ]
]

{ #category : #accessing }
MOCodeGenerator >> initialize [
  super initialize.
  stream := '' writeStream.
  indentation := 0.
  isCommenting := false
]

{ #category : #visiting }
MOCodeGenerator >> lineDelimiter [  
	^ ';' 
]

{ #category : #'as yet unclassified' }
MOCodeGenerator >> newLine [

	^ stream newLine
]

{ #category : #visiting }
MOCodeGenerator >> nextPut: aChar [

	^ stream nextPut: aChar
]

{ #category : #'as yet unclassified' }
MOCodeGenerator >> nextPutAll: aString [

	^ stream nextPutAll: aString
]

{ #category : #visiting }
MOCodeGenerator >> print: aPrintalbe [

	^ stream print: aPrintalbe
]

{ #category : #'as yet unclassified' }
MOCodeGenerator >> printClassHeader: name extends: superClassRef implements: types [

	self nextPutAll: (' class {1} ' format: { name }).
	superClassRef ifNotNil: [ 
		self
			nextPutAll: ' extends ';
			nextPutAll: superClassRef name ].
	types ifNotEmpty: [ 
		self
			nextPutAll: ' implements ';
			nextPutAll: (',' join: (types collect: #name)) ]
]

{ #category : #printing }
MOCodeGenerator >> printIndentation [

	indentation timesRepeat: [ 
		self nextPutAll: self indentationString ]
]

{ #category : #visiting }
MOCodeGenerator >> printSelf [

	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
MOCodeGenerator >> produceCodeFor: aMOPackage [

	| element |
	element := versionedAccessorHandler
		           ifNil: [ aMOPackage ]
		           ifNotNil: [ 
			           AvDelegationProxy
				           target: aMOPackage
				           handler: versionedAccessorHandler ].
	element acceptVisitor: self.
	^ self sourceCode
]

{ #category : #visiting }
MOCodeGenerator >> requiresTerminator: aStatement [

	^ { 
		  MOBlock.
		  MOIfElse.
		  MONoOp } noneSatisfy: [ :s | aStatement isKindOf: s ]
]

{ #category : #accessing }
MOCodeGenerator >> sourceCode [
	^ stream contents 
]

{ #category : #'as yet unclassified' }
MOCodeGenerator >> stream: aCollection splitingWith: aBlock [

	aCollection isEmptyOrNil ifTrue: [ ^ self ].
	aCollection allButLast do: [ :e | 
		e acceptVisitor: self.
		aBlock value ].
	aCollection last acceptVisitor: self
]

{ #category : #'as yet unclassified' }
MOCodeGenerator >> stream: aCollection splitingWith: aBlock enclosingWith: anEnclosingBlock [
  aCollection isEmptyOrNil ifTrue: [ ^self ].
  aCollection allButLast do: [:e |  anEnclosingBlock value.
        e acceptVisitor: self.
        anEnclosingBlock value.
        aBlock value ].
  anEnclosingBlock value.
  aCollection last acceptVisitor: self.
  anEnclosingBlock value
]

{ #category : #'as yet unclassified' }
MOCodeGenerator >> streamArguments: aCollection [

	self stream: aCollection splitingWith: [ stream nextPutAll: ', ' ]
]

{ #category : #'as yet unclassified' }
MOCodeGenerator >> useModel: aMOModelDerivative [

	self
		assert: stream isEmpty
		description:
		'A code generator with model behaves really different. should not be mixing visiting with and without model '.
	self
		assert: aMOModelDerivative isDerivativeModel
		description:
		'The versioned model usage makes sense only for derivative models '.

	versionedAccessorHandler := MOVersionedAccessHandler new
		                           model: aMOModelDerivative;
		                           yourself
]

{ #category : #visiting }
MOCodeGenerator >> visitAssignment: aMOAssignment [

	aMOAssignment write acceptVisitor: self.
	self
		nextPutAll: ' ';
		nextPutAll: #=;
		nextPutAll: ' '.
	aMOAssignment read acceptVisitor: self
]

{ #category : #visiting }
MOCodeGenerator >> visitBinaryArithmeticOperation: aMOBinaryArithmeticOperation [

	aMOBinaryArithmeticOperation left acceptVisitor: self.
	self
		nextPutAll: ' ';
		nextPutAll: aMOBinaryArithmeticOperation operator;
		nextPutAll: ' '.
	aMOBinaryArithmeticOperation right acceptVisitor: self
]

{ #category : #visiting }
MOCodeGenerator >> visitBlock: aMOBlock [

	self
		nextPutAll: self blockDelimiterOpen;
		newLine.
	self increaseDeepDuring: [ 
		aMOBlock statements do: [ :s | 
			self printIndentation.
			s acceptVisitor: self.

			(self requiresTerminator: s) ifTrue: [ 
				self nextPutAll: self lineDelimiter ].
			self newLine ] ].
	self printIndentation.
	self
		nextPutAll: self blockDelimiterClose;
		newLine
]

{ #category : #visiting }
MOCodeGenerator >> visitBooleanLiteral: aMOBooleanLiteral [

	self nextPutAll: aMOBooleanLiteral literal asString asLowercase
]

{ #category : #visiting }
MOCodeGenerator >> visitCollection: aCollection [

	aCollection isString
		ifTrue: [ self nextPutAll: aCollection ]
		ifFalse: [ aCollection do: [ :a | a acceptVisitor: self ] ]
]

{ #category : #visiting }
MOCodeGenerator >> visitFloatLiteral: aMOIntegerLiteral [

	self print: aMOIntegerLiteral literal
]

{ #category : #visiting }
MOCodeGenerator >> visitIfElse: aMOIfElse [


	self nextPutAll: 'if ('.
	aMOIfElse condition acceptVisitor: self.
	self nextPutAll: ')'.
	aMOIfElse ifTrue acceptVisitor: self.
	aMOIfElse ifFalse statements isEmpty ifFalse: [ 
		self printIndentation.
		self nextPutAll:' else '.
		aMOIfElse ifFalse acceptVisitor: self.
	 ]
]

{ #category : #visiting }
MOCodeGenerator >> visitIntegerLiteral: aMOIntegerLiteral [

	self print: aMOIntegerLiteral literal
]

{ #category : #'as yet unclassified' }
MOCodeGenerator >> visitLiteral: aMOTypescriptLiteral [
	self nextPutAll: aMOTypescriptLiteral literal asString
]

{ #category : #visiting }
MOCodeGenerator >> visitMissingVariable: aFylgjaMissingVariable [

	self nextPutAll: aFylgjaMissingVariable variableName
]

{ #category : #'as yet unclassified' }
MOCodeGenerator >> visitNewExpression: aMOTypescriptNewExpression [

	stream
		nextPutAll: 'new ';
		nextPutAll: aMOTypescriptNewExpression typeReference name;
		nextPutAll: '('.

	self streamArguments: aMOTypescriptNewExpression arguments.

	stream nextPutAll: ')'
]

{ #category : #visiting }
MOCodeGenerator >> visitNoOp: aMONoOp [

	" used to replace nodes with nothing "

	^ self
		  nextPutAll: 'NoOP: ';
		  nextPutAll: aMONoOp description
]

{ #category : #visiting }
MOCodeGenerator >> visitOperator: aFylgjaMissingOperator [

	aFylgjaMissingOperator left acceptVisitor: self.
	self
		nextPutAll: ' ';
		nextPutAll: aFylgjaMissingOperator operator;
		nextPutAll: ' '.
	aFylgjaMissingOperator right acceptVisitor: self
]

{ #category : #'as yet unclassified' }
MOCodeGenerator >> visitRemovedStatement: aStatement [

	
]

{ #category : #'as yet unclassified' }
MOCodeGenerator >> visitReplacedStatement: aStatement [

	aStatement newStatement acceptVisitor: aStatement
]

{ #category : #visiting }
MOCodeGenerator >> visitReturn: aMOReturn [

	self nextPutAll: 'return '.
	aMOReturn expression acceptVisitor: self
]

{ #category : #visiting }
MOCodeGenerator >> visitSelfReference: aMOSelf [

	self printSelf
]

{ #category : #visiting }
MOCodeGenerator >> visitStringLiteral: aMOStringLiteral [

	| str |
	str := ((aMOStringLiteral literal beginsWith: '"') and: [ 
		        aMOStringLiteral literal endsWith: '"' ])
		       ifTrue: [ 
			       aMOStringLiteral literal
				       copyFrom: 2
				       to: aMOStringLiteral literal size - 1 ]
		       ifFalse: [ aMOStringLiteral literal ].
	self
		nextPutAll: '"';
		nextPutAll: str;
		nextPutAll: '"'
]

{ #category : #visiting }
MOCodeGenerator >> visitUnaryArithmeticExpression: aMOUnaryArithmeticOperation [

	aMOUnaryArithmeticOperation isPrefix
		ifTrue: [ 
			self
				nextPutAll: aMOUnaryArithmeticOperation operator;
				nextPutAll: '('.
			aMOUnaryArithmeticOperation operand acceptVisitor: self.
			self nextPutAll: ')' ]
		ifFalse: [ 
			self nextPutAll: '('.
			aMOUnaryArithmeticOperation operand acceptVisitor: self.
			self
				nextPutAll: ')';
				nextPutAll: aMOUnaryArithmeticOperation operator;
				nextPutAll: ' ' ]
]

{ #category : #visiting }
MOCodeGenerator >> visitVariableReference: aMOVariableRererence [

	(aMOVariableRererence candidate isKindOf: MOSelfReference)
		ifTrue: [ aMOVariableRererence candidate acceptVisitor: self ]
		ifFalse: [ 
			(#( Null Nothing ) includes: aMOVariableRererence name)
				ifTrue: [ self nextPutAll: 'null' ]
				ifFalse: [ self nextPutAll: aMOVariableRererence name ] ]
]
