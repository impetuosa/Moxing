Class {
	#name : #MOTypescriptCodeGenerator,
	#superclass : #Object,
	#instVars : [
		'stream',
		'indentation',
		'indentationString'
	],
	#category : #'Moxing-Typescript-Writting'
}

{ #category : #'as yet unclassified' }
MOTypescriptCodeGenerator >> increaseDeepDuring: aFullBlockClosure [

	indentation := indentation + 1.
	aFullBlockClosure value.
	indentation := indentation - 1
]

{ #category : #'as yet unclassified' }
MOTypescriptCodeGenerator >> indentationString [

	^ indentationString ifNil: [ indentationString := String tab ]
]

{ #category : #accessing }
MOTypescriptCodeGenerator >> initialize [

	super initialize.
	stream := '' writeStream.
	indentation := 0
]

{ #category : #printing }
MOTypescriptCodeGenerator >> printIndentation [

	indentation timesRepeat: [ 
		stream nextPutAll: self indentationString ]
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> requiresTerminator: aStatement [

	^ { 
		  MOBlock.
		  MOIfElse } noneSatisfy: [ :s | aStatement isKindOf: s ]
]

{ #category : #accessing }
MOTypescriptCodeGenerator >> sourceCode [
	^ stream contents 
]

{ #category : #'as yet unclassified' }
MOTypescriptCodeGenerator >> streamArguments: aCollection [

	aCollection ifEmpty: [ ^ self ].
	aCollection allButLast do: [ :e | 
		e acceptVisitor: self.
		stream nextPutAll: ', ' ].
	aCollection last acceptVisitor: self
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitAssignment: aMOAssignment [

	aMOAssignment write acceptVisitor: self.
	stream
		nextPutAll: ' ';
		nextPutAll: #=;
		nextPutAll: ' '.
	aMOAssignment read acceptVisitor: self
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitBlock: aMOBlock [

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
MOTypescriptCodeGenerator >> visitClass: aJinTypescriptClass [
	aJinTypescriptClass dependencies do: [ :i | i acceptVisitor: self ].
	aJinTypescriptClass decorator
		ifNotNil: [ :d | d acceptVisitor: self ].
	stream
		nextPutAll: (' export class {1}  ' format: {aJinTypescriptClass name}).
	aJinTypescriptClass types
		ifNotEmpty: [ stream
				nextPutAll: ' implements ';
				nextPutAll: (',' join: (aJinTypescriptClass types collect: #name)) ].
	stream
		nextPutAll: ' {';
		newLine.
	aJinTypescriptClass properties
		do: [ :m | 
			m acceptVisitor: self.
			stream
				nextPutAll: ';';
				newLine ].
	aJinTypescriptClass methods
		do: [ :m | 
			m acceptVisitor: self.
			stream newLine ].
	stream nextPutAll: '}'
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitCollection: aCollection [

	aCollection isString
		ifTrue: [ stream nextPutAll: aCollection ]
		ifFalse: [ aCollection do: [ :a | a acceptVisitor: self ] ]
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitDecorator: aJinTypescriptDecorator [

	stream
		cr;
		nextPutAll: '    ';
		nextPutAll: '@';
		nextPutAll: aJinTypescriptDecorator name;
		nextPutAll: '(';
		nextPutAll: (STONJSON toString: aJinTypescriptDecorator attributes);
		nextPutAll: ')';
		cr
]

{ #category : #'as yet unclassified' }
MOTypescriptCodeGenerator >> visitDependency: aMOTypescriptImport [
	stream
		nextPutAll: 'import {';
		nextPutAll: (',' join: (aMOTypescriptImport types collect: [ :t | t name ]));
		nextPutAll: '} from "';
		nextPutAll: aMOTypescriptImport from;
		nextPutAll: '";';
		newLine
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitIfElse: aMOIfElse [

	self assert: aMOIfElse ifFalse isNil.
	stream nextPutAll: 'if ('.
	aMOIfElse condition acceptVisitor: self.
	stream nextPutAll: ')'.
	aMOIfElse ifTrue acceptVisitor: self.
	
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitInvocableInvocation: aFylgjaMissingInvocableInvocation [

	stream
		nextPutAll: aFylgjaMissingInvocableInvocation fullSelector;
		nextPutAll: '('.
	self streamArguments: aFylgjaMissingInvocableInvocation arguments.
	stream nextPutAll: ')'
]

{ #category : #'as yet unclassified' }
MOTypescriptCodeGenerator >> visitLiteral: aMOTypescriptLiteral [
	stream nextPutAll: aMOTypescriptLiteral literal asString
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitMethod: aJinTypescriptMethod [

	self printIndentation.
	stream
		newLine;
		nextPutAll: '';
		nextPutAll: aJinTypescriptMethod visibility;
		nextPutAll: ' ';
		nextPutAll: aJinTypescriptMethod selector;
		nextPutAll: '('.
	self streamArguments: aJinTypescriptMethod parameters.


	stream nextPutAll: ') '.
	aJinTypescriptMethod type acceptVisitor: self.
	aJinTypescriptMethod block acceptVisitor: self.
	stream
		nextPutAll: '';
		newLine
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitMissingVariable: aFylgjaMissingVariable [

	stream nextPutAll: aFylgjaMissingVariable variableName
]

{ #category : #'as yet unclassified' }
MOTypescriptCodeGenerator >> visitNewExpression: aMOTypescriptNewExpression [
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

{ #category : #'as yet unclassified' }
MOTypescriptCodeGenerator >> visitObjectLiteral: aMOTypescriptObjectLiteral [
	stream nextPutAll: '{'.
	aMOTypescriptObjectLiteral literal
		do: [ :l | 
			l key acceptVisitor: self.
			stream nextPutAll: ':'.
			l value acceptVisitor: self.
			stream newLine  ].
	stream nextPutAll: '}'
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitOperator: aFylgjaMissingOperator [

	aFylgjaMissingOperator left acceptVisitor: self.
	stream
		nextPutAll: ' ';
		nextPutAll: aFylgjaMissingOperator operator;
		nextPutAll: ' '.
	aFylgjaMissingOperator right acceptVisitor: self
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitReturn: aMOReturn [

	stream nextPutAll: 'return '.
	aMOReturn expression acceptVisitor: self
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitStringLiteral: aMOStringLiteral [

	stream
		nextPutAll: '"';
		nextPutAll: aMOStringLiteral literal;
		nextPutAll: '"'
]

{ #category : #'as yet unclassified' }
MOTypescriptCodeGenerator >> visitTemplatedConstructor: aMOTypescriptTemplatedConstructor [
	stream nextPutAll: 'constructor ('.
	aMOTypescriptTemplatedConstructor parameters allButLast
		do: [ :p | 
			p acceptVisitor: self.
			stream nextPutAll: ', ' ].
	aMOTypescriptTemplatedConstructor parameters last acceptVisitor: self.
	stream
		nextPutAll: '){ ';
		newLine;
		nextPutAll: aMOTypescriptTemplatedConstructor body;
		newLine;
		nextPutAll: '}'
]

{ #category : #'as yet unclassified' }
MOTypescriptCodeGenerator >> visitTemplatedMethod: aMOTypescriptTemplatedMethod [
	stream
		newLine;
		nextPutAll: '    ';
		nextPutAll: aMOTypescriptTemplatedMethod visibility;
		nextPutAll: ' ';
		nextPutAll: aMOTypescriptTemplatedMethod selector;
		nextPutAll: '('.
	stream
		nextPutAll:
			(','
				join:
					(aMOTypescriptTemplatedMethod parameters
						collect: [ :p | p name , ': ' , p type name ])).
	stream nextPutAll: ')'.
	aMOTypescriptTemplatedMethod type
		ifNotNil: [ :t | 
			stream
				nextPutAll: ': ';
				nextPutAll: t asString ].
	stream
		nextPutAll: ' {';
		newLine;
		nextPutAll: aMOTypescriptTemplatedMethod body;
		newLine;
		nextPutAll: '    }';
		newLine
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitTypeReference: aFylgjaMissingType [

	stream
		nextPutAll: ': ';
		nextPutAll: aFylgjaMissingType name
]

{ #category : #'as yet unclassified' }
MOTypescriptCodeGenerator >> visitVariable: aMOTypescriptVariable [

	aMOTypescriptVariable visibility ifNotNil: [ 
		stream
			nextPutAll: aMOTypescriptVariable visibility;
			nextPutAll: ' ' ].
	stream nextPutAll: aMOTypescriptVariable name.

	aMOTypescriptVariable type ifNotNil: [ 
		aMOTypescriptVariable type acceptVisitor: self ].
	aMOTypescriptVariable defaultValue ifNotNil: [ 
		stream nextPutAll: '='.
		aMOTypescriptVariable defaultValue acceptVisitor: self ]
]

{ #category : #visiting }
MOTypescriptCodeGenerator >> visitVariableReference: aMOVariableRererence [

	stream nextPutAll: aMOVariableRererence variable name
]
