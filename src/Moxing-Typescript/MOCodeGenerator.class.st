Class {
	#name : #MOCodeGenerator,
	#superclass : #Object,
	#instVars : [
		'stream',
		'indentation',
		'indentationString'
	],
	#category : #'Moxing-Typescript-Writting'
}

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
	indentation := 0
]

{ #category : #printing }
MOCodeGenerator >> printIndentation [

	indentation timesRepeat: [ 
		stream nextPutAll: self indentationString ]
]

{ #category : #'as yet unclassified' }
MOCodeGenerator >> produceCodeFor: aMOPackage [

	aMOPackage acceptVisitor: self.
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
MOCodeGenerator >> streamArguments: aCollection [

	aCollection isEmptyOrNil ifTrue: [ ^ self ].
	aCollection allButLast do: [ :e | 
		e acceptVisitor: self.
		stream nextPutAll: ', ' ].
	aCollection last acceptVisitor: self
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
MOCodeGenerator >> visitBlock: aMOBlock [

	stream
		nextPutAll: '{';
		newLine.
	self increaseDeepDuring: [ 
		aMOBlock statements do: [ :s | 
			self printIndentation.
			s acceptVisitor: self.

			(self requiresTerminator: s) ifTrue: [ stream nextPutAll: ';' ].
			stream newLine ] ].
	self printIndentation.
	stream
		nextPutAll: '}';
		newLine
]

{ #category : #visiting }
MOCodeGenerator >> visitBooleanLiteral: aMOBooleanLiteral [

	stream nextPutAll: aMOBooleanLiteral literal asLowercase
]

{ #category : #visiting }
MOCodeGenerator >> visitCollection: aCollection [

	aCollection isString
		ifTrue: [ stream nextPutAll: aCollection ]
		ifFalse: [ aCollection do: [ :a | a acceptVisitor: self ] ]
]

{ #category : #visiting }
MOCodeGenerator >> visitIfElse: aMOIfElse [

	self assert: aMOIfElse ifFalse isNil.
	stream nextPutAll: 'if ('.
	aMOIfElse condition acceptVisitor: self.
	stream nextPutAll: ')'.
	aMOIfElse ifTrue acceptVisitor: self.
	
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
		nextPutAll: aMOTypescriptNewExpression type name;
		nextPutAll: '('.
	aMOTypescriptNewExpression arguments allButLast
		do: [ :a | 
			a acceptVisitor: self.
			stream nextPutAll: ', ' ].
	aMOTypescriptNewExpression arguments last acceptVisitor: self.
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
MOCodeGenerator >> visitStringLiteral: aMOStringLiteral [

	stream
		nextPutAll: '"';
		nextPutAll: aMOStringLiteral literal;
		nextPutAll: '"'
]

{ #category : #visiting }
MOCodeGenerator >> visitVariableReference: aMOVariableRererence [

	stream nextPutAll: aMOVariableRererence variable name
]
