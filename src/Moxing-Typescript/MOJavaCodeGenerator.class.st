Class {
	#name : #MOJavaCodeGenerator,
	#superclass : #MOCodeGenerator,
	#instVars : [
		'aTryCatch',
		'isCommenting'
	],
	#category : #'Moxing-Typescript-Writting'
}

{ #category : #accessing }
MOJavaCodeGenerator >> comment: aFullBlockClosure [

	isCommenting
		ifFalse: [ 
			stream nextPutAll: '/* TODO '.
			isCommenting := true.
			aFullBlockClosure value.
			stream nextPutAll: '*/'.
			isCommenting := false ]
		ifTrue: [ aFullBlockClosure value ]
]

{ #category : #visiting }
MOJavaCodeGenerator >> initialize [

	super initialize.
	isCommenting := false
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitAccessor: aMOAccessor [

	self visitMethod: aMOAccessor
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitAnnotation: aMOAnnotationInstance [
	self printIndentation.
	stream
		nextPutAll: '@';
		nextPutAll: aMOAnnotationInstance typeReference name.
	aMOAnnotationInstance arguments ifNotEmpty: [ 
		stream nextPutAll: '('.
		self streamArguments: aMOAnnotationInstance arguments.
		stream nextPutAll: ')' ]
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitArrayAccess: aMOArrayAccess [ 
	aMOArrayAccess receiverReference acceptVisitor: self. 
	stream nextPutAll: '['.
	self streamArguments: aMOArrayAccess arguments. 
	stream nextPutAll: ']'.
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitAssignment: anAssignment [
	anAssignment write isInvocation ifTrue: [ stream nextPutAll:'/* TODO '.].
	super visitAssignment: anAssignment.
	anAssignment write isInvocation ifTrue: [ stream nextPutAll:'*/'.].
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitAttribute: aMOAttribute [

	aMOAttribute annotationInstances do: [ :m | 
		m acceptVisitor: self.
		stream newLine ].
	self printIndentation.
	aMOAttribute visibility ifNotNil: [ :v | 
		stream
			nextPutAll: v;
			nextPutAll: ' ' ].
	self visitVariable: aMOAttribute
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitAttributeAccess: aMOAttributeAccess [

	aMOAttributeAccess receiverReference acceptVisitor: self.
	stream
		nextPutAll: '.';
		nextPutAll: aMOAttributeAccess name
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitBinaryArithmeticOperation: aMOBinaryArithmeticOperation [

	aMOBinaryArithmeticOperation left acceptVisitor: self.
	stream
		nextPutAll: ' ';
		nextPutAll: aMOBinaryArithmeticOperation operator;
		nextPutAll: ' '.
	aMOBinaryArithmeticOperation right acceptVisitor: self
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitCase: aMOCase [

	self assert: aMOCase expressions size <= 1.
	self increaseDeepDuring: [ 
		self printIndentation.
		aMOCase expressions
			ifEmpty: [ stream nextPutAll: 'default: ' ]
			ifNotEmpty: [ 
				stream nextPutAll: 'case '.
				aMOCase expressions first acceptVisitor: self.
				stream nextPutAll: ':' ].
		stream newLine.
		self increaseDeepDuring: [ 
			aMOCase block statements do: [ :s | 
				self printIndentation.
				s acceptVisitor: self.

				(self requiresTerminator: s) ifTrue: [ 
					stream nextPutAll: self lineDelimiter ].
				stream newLine ].
			self printIndentation.
			stream nextPutAll: ' break;'.
			stream newLine ] ]
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitCatch: aMOCatch [ 
	self printIndentation.
	stream nextPutAll: 'catch ('.
	self streamArguments: aMOCatch parameters. 
	stream nextPutAll: ')'.
	aMOCatch block acceptVisitor: self.
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitClass: aJinTypescriptClass [

	aJinTypescriptClass annotationInstances do: [ :m | 
		m acceptVisitor: self.
		stream newLine ].
	aJinTypescriptClass modifiers do: [ :m | 
		stream
			nextPutAll: m;
			nextPutAll: ' ' ].
	stream nextPutAll: aJinTypescriptClass visibility asLowercase.
	self
		printClassHeader: aJinTypescriptClass name
		extends: aJinTypescriptClass superclassReference
		implements: aJinTypescriptClass superTypeReferences.

	stream
		nextPutAll: ' {';
		newLine.
	self increaseDeepDuring: [ 
		aJinTypescriptClass attributes do: [ :m | 
			m acceptVisitor: self.
			stream
				nextPutAll: ';';
				newLine ].
		aJinTypescriptClass methods do: [ :m | 
			m acceptVisitor: self.
			stream newLine ].
		stream nextPutAll: '}' ]
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitConstant: aMOConstant [

	stream nextPutAll: 'const '.
	self visitVariable: aMOConstant
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitConstantAttribute: aMOConstantAttribute [

	stream nextPutAll: 'final '.
	self visitVariable: aMOConstantAttribute
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitConstantReference: aMOConstantReference [

	^ self visitVariableReference: aMOConstantReference
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitDeclarationUnit: aMODeclarationUnit [

	stream
		nextPutAll: 'package ';
		nextPutAll: aMODeclarationUnit types anyOne packageReference name;
		nextPutAll: ';';
		newLine.
	self visitCollection: aMODeclarationUnit imports.
	self visitCollection: aMODeclarationUnit types
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitEmptyBlock: aMOEmptyBlock [ 
	stream nextPutAll: '{}'
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitEnum: aMOEnum [

	stream
		newLine;
		nextPutAll: aMOEnum visibility;
		nextPutAll: ' enum ';
		nextPutAll: aMOEnum name.
	stream
		nextPutAll: ' {';
		newLine.
	self increaseDeepDuring: [ 
		aMOEnum entries do: [ :m | 
			self printIndentation.
			m acceptVisitor: self.
			stream
				nextPutAll: ',';
				newLine ].
		stream newLine.
		self printIndentation.
		stream nextPutAll: '}' ]
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitEnumEntry: aMOEnumEntry [ 
	stream nextPutAll: aMOEnumEntry name .
	aMOEnumEntry value ifNotNil: [ 
		stream nextPutAll: ' = '. 	
		stream nextPutAll: aMOEnumEntry value
	 ]
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitExit: aMOAlceExit [ 
	self comment: [ stream nextPutAll: ' Exit ' ]
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitForm: aMOAlceForm [

	self visitClass: aMOAlceForm
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitFunction: aMOFunction [ 
	self visitMethod: aMOFunction
]

{ #category : #'as yet unclassified' }
MOJavaCodeGenerator >> visitImport: aMOImport [

	stream
		nextPutAll: 'import ';
		nextPutAll: aMOImport packageReference name;
		nextPutAll: '.'.

	aMOImport types size = 1
		ifTrue: [ stream nextPutAll: aMOImport types first name ]
		ifFalse: [ stream nextPutAll: '*' ].
	stream nextPutAll: ';'.
	stream newLine
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitIntegerLiteral: aMOIntegerLiteral [ 
	stream print: aMOIntegerLiteral literal 
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitInvocation: aMOInvocation [

	"self assert: (aMOInvocation candidate modifiers includes: #static)."

	stream
		nextPutAll:
			' /** TODO Function Invocation Is not valid in Java. Must be transformed to Method Invocation ';
		newLine;
		nextPutAll: aMOInvocation selector;
		nextPutAll: '('.
	self streamArguments: aMOInvocation arguments.
	stream
		nextPutAll: ')';
		newLine;
		nextPutAll: '*/'
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitLabelReference: aMOAlceLabelReference [

	^ self comment: [ 
		  stream
			  nextPutAll: ' Label Usage:   ';
			  nextPutAll: aMOAlceLabelReference name ]
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitLocalVariable: aMOLocalVariable [

	^ self visitVariable: aMOLocalVariable
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitMethod: aJinTypescriptMethod [

	aJinTypescriptMethod annotationInstances do: [ :m | 
		m acceptVisitor: self.
		stream newLine ].
	self printIndentation.
	stream
		nextPutAll: aJinTypescriptMethod visibility;
		nextPutAll: ' '.
	aJinTypescriptMethod modifiers do: [ :m | 
		stream
			nextPutAll: m;
			nextPutAll: ' ' ].
	aJinTypescriptMethod isStaticBinding ifTrue: [ 
		stream nextPutAll: ' static ' ].
	aJinTypescriptMethod returnTypeReference
		ifNil: [ stream nextPutAll: 'UNKNOWN' ]
		ifNotNil: [ :rt | rt acceptVisitor: self ].
	stream
		nextPutAll: ' ';
		nextPutAll: aJinTypescriptMethod selector;
		nextPutAll: '('.
	self streamArguments: aJinTypescriptMethod parameters.


	stream nextPutAll: ') '.

	aJinTypescriptMethod block acceptVisitor: self.
	stream
		nextPutAll: '';
		newLine
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitMethodInvocation: aMOMethodInvocation [
	aMOMethodInvocation receiverReference acceptVisitor: self.
	stream
		nextPutAll: '.';
		nextPutAll: aMOMethodInvocation selector;
		nextPutAll: '('.
	self streamArguments: aMOMethodInvocation arguments.
	stream nextPutAll: ')'
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitModule: aMOModule [

	self comment: [ 
		stream nextPutAll:
			' Modules define functions. Java does not allow such kind of structure. It must be transformed into a Class '.
		self visitCollection: aMOModule allContainments ]
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitNamedArgument: aMONamedArgument [

	stream
		nextPutAll: aMONamedArgument name;
		nextPutAll: ' = '.
	self visitCollection: aMONamedArgument argumentExpressions
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitNullLiteral: aMONullLiteral [ 
	stream nextPutAll: 'null'
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitOnErrorGoToLabel: aMOAlceOnErrorGoToLabel [

	self comment: [ 
		stream
			nextPutAll: 'When ever there is an error, the code after ';
			nextPutAll: aMOAlceOnErrorGoToLabel destination name;
			nextPutAll: ' should be executed ' ]
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitOnErrorResumeNext: aMOAlceOnErrorResumeNext [ 
	self comment: [ stream nextPutAll: ' TODO: On error we should execute the next statement ' ]
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitParameter: aMOParameter [

	aMOParameter typeReference acceptVisitor: self.

	stream
		nextPutAll: ' ';
		nextPutAll: aMOParameter name
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitPrimitiveTypeReference: aMOPrimitiveTypeReference [

	stream nextPutAll: aMOPrimitiveTypeReference name
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitProcedure: aMOProcedure [ 

	self printIndentation.
	stream
		nextPutAll: aMOProcedure visibility;
		nextPutAll: ' '.
	aMOProcedure modifiers do: [ :m | 
		stream
			nextPutAll: m;
			nextPutAll: ' ' ].
	aMOProcedure isStaticBinding ifTrue: [ 
		stream nextPutAll: ' static ' ].
	
	stream
		nextPutAll: ' void ';
		nextPutAll: aMOProcedure selector;
		nextPutAll: '('.
	self streamArguments: aMOProcedure parameters.


	stream nextPutAll: ') '.

	aMOProcedure block acceptVisitor: self.
	stream
		nextPutAll: '';
		newLine
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitResume: aMOAlceResume [ 
	self comment: [ stream nextPutAll: ' #resume  ' ]
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitResumeFromLabel: aMOResumeFromLabel [ 
	stream nextPutAll:' /** TODO RESUME FROM LABEL IS NOT A COMPATIBLE! */'
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitResumeLabel: aMOAlceResumeLabel [

	self comment: [ 
		stream nextPutAll: ' Resume '.
		aMOAlceResumeLabel destinations do: [ :a | 
			stream
				nextPutAll: ' Label ';
				nextPutAll: a name ] ]
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitReturnEmpty: aMOReturnEmpty [ 
	stream nextPutAll:'return'
]

{ #category : #enumerating }
MOJavaCodeGenerator >> visitSelect: aMOSelect [

	stream nextPutAll: 'switch ('.
	aMOSelect expression acceptVisitor: self.
	stream nextPutAll: ') {'.
	stream newLine.
	self visitCollection: aMOSelect cases.
	self printIndentation.
	stream nextPutAll: '}'
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitSelfReference: aMOSelf [

	stream nextPutAll: 'this'
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitSetToReturn: aMOSetToReturn [

	stream
		nextPutAll: aMOSetToReturn invocableSelector;
		nextPutAll: ' = '.
	aMOSetToReturn expression acceptVisitor: self
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitStatementExpression: aMOStatementExpression [

	^ aMOStatementExpression expression acceptVisitor: self
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitStructure: aMOStructure [

	self comment: [ 
		stream nextPutAll: 'TODO '.

		stream
			nextPutAll: 'struct ';
			nextPutAll: aMOStructure name;
			nextPutAll: '{';
			newLine.
		self increaseDeepDuring: [ 
			self printIndentation.
			self stream: aMOStructure attributes splitingWith: [ 
				stream
					nextPutAll: self lineDelimiter;
					newLine.
				self printIndentation ] ] ].
	stream newLine.
	self printIndentation.
	stream nextPutAll: '}'
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitTemplatedMethod: aMOTypescriptTemplatedMethod [

	stream
		newLine;
		nextPutAll: '    ';
		nextPutAll: aMOTypescriptTemplatedMethod visibility;
		nextPutAll: ' '.
	aMOTypescriptTemplatedMethod type acceptVisitor: self.
	stream
		nextPutAll: aMOTypescriptTemplatedMethod selector;
		nextPutAll: '('.
	stream nextPutAll:
		(',' join:
			 (aMOTypescriptTemplatedMethod parameters collect: [ :p | 
				  p name , ': ' , p type name ])).
	stream nextPutAll: ')'.


	stream
		nextPutAll: ' {';
		newLine;
		nextPutAll: aMOTypescriptTemplatedMethod body;
		newLine;
		nextPutAll: '    }';
		newLine
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitTryCatch: aMOTryCatch [

	stream nextPutAll: 'try'.
	aMOTryCatch try acceptVisitor: self.
	
	self visitCollection: aMOTryCatch catches 
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitTypeReference: aFylgjaMissingType [

	stream
		nextPutAll: aFylgjaMissingType name
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitUnaryArithmeticExpression: aMOUnaryArithmeticOperation [

	aMOUnaryArithmeticOperation isPrefix
		ifTrue: [ 
			stream
				nextPutAll: aMOUnaryArithmeticOperation operator;
				nextPutAll: '('.
			aMOUnaryArithmeticOperation operand acceptVisitor: self.
			stream nextPutAll: ')' ]
		ifFalse: [ 
			stream nextPutAll: '('.
			aMOUnaryArithmeticOperation operand acceptVisitor: self.
			stream
				nextPutAll: ')';
				nextPutAll: aMOUnaryArithmeticOperation operator;
				nextPutAll: ' ' ]
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitVarArgParameter: aMOVariableArgumentsParameter [

	aMOVariableArgumentsParameter typeReference acceptVisitor: self.

	stream
		nextPutAll: '... ';
		nextPutAll: aMOVariableArgumentsParameter name
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitVariable: aMOTypescriptVariable [

	
	aMOTypescriptVariable modifiers do: [ :m | 
		stream
			nextPutAll: m;
			nextPutAll: ' ' ].

	aMOTypescriptVariable typeReference ifNotNil: [ 
		aMOTypescriptVariable typeReference acceptVisitor: self.
		stream nextPutAll: ' ' ].


	stream nextPutAll: aMOTypescriptVariable name.


	aMOTypescriptVariable initializer ifNotNil: [ 
		stream nextPutAll: '='.
		aMOTypescriptVariable initializer acceptVisitor: self ]
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitWhile: aMOWhile [ 
	stream nextPutAll: 'while ('.
	aMOWhile condition acceptVisitor: self. 
	stream nextPutAll: ')'.
	aMOWhile loopingBlock  acceptVisitor: self 
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitWith: aMOAlceWith [

	self comment: [ 
		stream nextPutAll: ' TODO: With ('.
		aMOAlceWith expression acceptVisitor: self.
		stream nextPutAll: ')'.
		aMOAlceWith block acceptVisitor: self ]
]
