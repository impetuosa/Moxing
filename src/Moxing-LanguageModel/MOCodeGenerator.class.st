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
MOCodeGenerator >> printClassHeader: name extends: superClassRef implements: types [

	stream nextPutAll: (' class {1} ' format: { name }).
	superClassRef ifNotNil: [ 
		stream
			nextPutAll: ' extends ';
			nextPutAll: superClassRef name ].
	types ifNotEmpty: [ 
		stream
			nextPutAll: ' implements ';
			nextPutAll: (',' join: (types collect: #name)) ]
]

{ #category : #printing }
MOCodeGenerator >> printIndentation [

	indentation timesRepeat: [ 
		stream nextPutAll: self indentationString ]
]

{ #category : #visiting }
MOCodeGenerator >> printSelf [

	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
MOCodeGenerator >> produceCodeFor: aMOPackage [

	(versionedAccessorHandler ifNil: [ aMOPackage ] ifNotNil: [ 
		 AvDelegationProxy
			 target: aMOPackage
			 handler: versionedAccessorHandler ]) acceptVisitor: self.
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
	stream
		nextPutAll: ' ';
		nextPutAll: #=;
		nextPutAll: ' '.
	aMOAssignment read acceptVisitor: self
]

{ #category : #visiting }
MOCodeGenerator >> visitBinaryArithmeticOperation: aMOBinaryArithmeticOperation [

	aMOBinaryArithmeticOperation left acceptVisitor: self.
	stream
		nextPutAll: ' ';
		nextPutAll: aMOBinaryArithmeticOperation operator;
		nextPutAll: ' '.
	aMOBinaryArithmeticOperation right acceptVisitor: self
]

{ #category : #visiting }
MOCodeGenerator >> visitBlock: aMOBlock [

	stream
		nextPutAll: self blockDelimiterOpen ;
		newLine.
	self increaseDeepDuring: [ 
		aMOBlock statements do: [ :s | 
			self printIndentation.
			s acceptVisitor: self.

			(self requiresTerminator: s) ifTrue: [ stream nextPutAll: self lineDelimiter].
			stream newLine ] ].
	self printIndentation.
	stream
		nextPutAll: self blockDelimiterClose ;
		newLine

]

{ #category : #visiting }
MOCodeGenerator >> visitBooleanLiteral: aMOBooleanLiteral [

	stream nextPutAll: aMOBooleanLiteral literal asString asLowercase
]

{ #category : #visiting }
MOCodeGenerator >> visitCollection: aCollection [

	aCollection isString
		ifTrue: [ stream nextPutAll: aCollection ]
		ifFalse: [ aCollection do: [ :a | a acceptVisitor: self ] ]
]

{ #category : #visiting }
MOCodeGenerator >> visitIfElse: aMOIfElse [


	stream nextPutAll: 'if ('.
	aMOIfElse condition acceptVisitor: self.
	stream nextPutAll: ')'.
	aMOIfElse ifTrue acceptVisitor: self.
	aMOIfElse ifFalse statements isEmpty ifFalse: [ 
		self printIndentation.
		stream nextPutAll:' else '.
		aMOIfElse ifFalse acceptVisitor: self.
	 ]
]

{ #category : #visiting }
MOCodeGenerator >> visitIntegerLiteral: aMOIntegerLiteral [ 
	stream print: aMOIntegerLiteral literal 
]

{ #category : #visiting }
MOCodeGenerator >> visitInvocableInvocation: aFylgjaMissingInvocableInvocation [

	stream
		nextPutAll: aFylgjaMissingInvocableInvocation fullSelector;
		nextPutAll: '('.
	self streamArguments: aFylgjaMissingInvocableInvocation arguments.
	stream nextPutAll: ')'
]

{ #category : #'as yet unclassified' }
MOCodeGenerator >> visitLiteral: aMOTypescriptLiteral [
	stream nextPutAll: aMOTypescriptLiteral literal asString
]

{ #category : #visiting }
MOCodeGenerator >> visitMissingVariable: aFylgjaMissingVariable [

	stream nextPutAll: aFylgjaMissingVariable variableName
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
]

{ #category : #visiting }
MOCodeGenerator >> visitOperator: aFylgjaMissingOperator [

	aFylgjaMissingOperator left acceptVisitor: self.
	stream
		nextPutAll: ' ';
		nextPutAll: aFylgjaMissingOperator operator;
		nextPutAll: ' '.
	aFylgjaMissingOperator right acceptVisitor: self
]

{ #category : #visiting }
MOCodeGenerator >> visitPackage: aMOPackage [ 
	self halt .
]

{ #category : #visiting }
MOCodeGenerator >> visitReturn: aMOReturn [

	stream nextPutAll: 'return '.
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
	stream
		nextPutAll: '"';
		nextPutAll: str;
		nextPutAll: '"'
]

{ #category : #visiting }
MOCodeGenerator >> visitTransientClass: aMOTransientClass [

	^ self visitClass: aMOTransientClass
]

{ #category : #visiting }
MOCodeGenerator >> visitVariableReference: aMOVariableRererence [

	(aMOVariableRererence candidate isKindOf: MOSelfReference)
		ifTrue: [ aMOVariableRererence candidate acceptVisitor: self ]
		ifFalse: [ stream nextPutAll: aMOVariableRererence name ]
]
