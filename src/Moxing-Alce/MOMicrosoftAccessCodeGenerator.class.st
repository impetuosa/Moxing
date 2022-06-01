Class {
	#name : #MOMicrosoftAccessCodeGenerator,
	#superclass : #MOCodeGenerator,
	#category : #'Moxing-Alce'
}

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> blockDelimiterClose [

	^ ''
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> blockDelimiterOpen [

	^ ''
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> lineDelimiter [

	^ ''
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> printSelf [

	stream nextPutAll: 'Me'
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> produceCodeFor: anTree [
	^ super produceCodeFor: anTree."
	anTree acceptVisitor: self.
	^ self sourceCode"
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitAccessor: aMOAttributeAccessor [

	stream
		nextPutAll: 'Property ';
		nextPutAll: aMOAttributeAccessor kind;
		nextPutAll: ' ';
		nextPutAll: aMOAttributeAccessor selector ; nextPutAll: ' ('.
	
	self streamArguments: aMOAttributeAccessor parameters.
	stream  nextPutAll: ')'.
	(aMOAttributeAccessor kind = #Get and: [ 
		 aMOAttributeAccessor returnTypeReference isNotNil ]) ifTrue: [ 
		stream
			nextPutAll: ' As ';
			nextPutAll: aMOAttributeAccessor returnTypeReference name ].
	
	aMOAttributeAccessor block acceptVisitor: self.
	stream nextPutAll: 'End Property'.
	stream newLine.
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitArrayAccess: aMOArrayAccess [

	aMOArrayAccess receiverReference acceptVisitor: self.
	stream nextPutAll: '('.
	self streamArguments: aMOArrayAccess arguments.
	stream nextPutAll: ')'
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitAttribute: aMOAttribute [ 
	^ self visitVariable: aMOAttribute 
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitAttributeAccess: aMOAttributeAccess [

	aMOAttributeAccess receiverReference acceptVisitor: self.
	stream
		nextPutAll: '.';
		nextPutAll: aMOAttributeAccess name
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitBooleanLiteral: aMOBooleanLiteral [

	stream nextPutAll:
		aMOBooleanLiteral literal asString capitalized
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitCase: aMOCase [


	stream nextPutAll: 'Case '.

	aMOCase expressions
		ifEmpty: [ stream nextPutAll: 'Else ' ]
		ifNotEmpty: [ self streamArguments: aMOCase expressions ].
	aMOCase block acceptVisitor: self
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitClass: aJinTypescriptClass [

	
	aJinTypescriptClass attributes do: [ :m | 
		m acceptVisitor: self.
		stream newLine ].
	aJinTypescriptClass methods do: [ :m | 
		m acceptVisitor: self.
		stream newLine ]
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitClassFunction: aMOClassFunction [ 
	self visitFunction: aMOClassFunction 
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitClassProcedure: aMOClassFunction [ 
	self visitProcedure: aMOClassFunction 
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitConstantReference: aMOConstantReference [ 
	stream nextPutAll: aMOConstantReference name
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitDeclarationUnit: aMODeclarationUnit [ 
stream nextPutAll: 'Option Compare Database
Option Explicit

'.
	self visitCollection: aMODeclarationUnit types
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitEmptyBlock: aMOEmptyBlock [

	stream newLine
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitEnum: aMOEnum [

	stream
		nextPutAll: 'Enum ';
		nextPutAll: aMOEnum name;
		newLine.
	self increaseDeepDuring: [ 
		self printIndentation.
		aMOEnum entries do: [ :e | 
			e acceptVisitor: self.
			stream newLine ] ].
	stream
		nextPutAll: 'End Enum';
		newLine;
		newLine
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitEnumEntry: aMOEnumEntry [

	stream
		nextPutAll: aMOEnumEntry name;
		nextPutAll: ' '.
	aMOEnumEntry value ifNotNil: [ :e | 
		stream nextPutAll: '= '.
		e acceptVisitor: self ]
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitExit: aMOAlceExit [

	stream nextPutAll: #'Exit '.
	({ 
		 MOFunction.
		 MOClassFunction } includes: aMOAlceExit invocableKind) ifTrue: [ 
		stream nextPutAll: 'Function'.
		^ self ].
	self error: #implement
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitForm: aMOAlceForm [

	self visitClass: aMOAlceForm
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitFunction: aMOFunction [

	stream nextPutAll: aMOFunction visibility capitalized.
	aMOFunction modifiers do: [ :m | 
		stream
			nextPutAll: m;
			nextPutAll: ' ' ].
	stream
		nextPutAll: ' Function ';
		nextPutAll: aMOFunction selector;
		nextPutAll: ' ('.

	self streamArguments: aMOFunction parameters.
	stream nextPutAll: ') '.

	aMOFunction returnTypeReference ifNotNil: [ :rtr | 
		stream
			nextPutAll: ' As ';
			nextPutAll: rtr name ].
	aMOFunction block acceptVisitor: self.
	stream nextPutAll: 'End Function'.
	stream newLine
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitGlobalConstant: aMOGlobalConstant [

	stream
		nextPutAll: 'Global Const ';
		nextPutAll: aMOGlobalConstant name;
		nextPutAll: ' '.
	aMOGlobalConstant typeReference ifNotNil: [ :tr | 
		stream
			nextPutAll: 'As ';
			nextPutAll: tr name ].
	stream nextPutAll: ' = '.
	aMOGlobalConstant initializer acceptVisitor: self
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitGlobalVariable: aMOGlobalVariable [

	stream
		nextPutAll: 'Global ';
		nextPutAll: aMOGlobalVariable name.
	aMOGlobalVariable typeReference ifNotNil: [ :tr | 
		stream
			nextPutAll: ' As ';
			nextPutAll: tr name ].
	aMOGlobalVariable initializer ifNotNil: [ 
		stream nextPutAll: ' = '.
		aMOGlobalVariable initializer acceptVisitor: self ]
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitIfElse: aMOIfElse [

	stream nextPutAll: 'If '.
	aMOIfElse condition acceptVisitor: self.
	stream nextPutAll: ' Then '.
	aMOIfElse ifTrue acceptVisitor: self.
	aMOIfElse ifFalse statements isEmpty ifFalse: [ 
		self printIndentation.
		stream nextPutAll: 'Else '.
		aMOIfElse ifFalse acceptVisitor: self ].
	self printIndentation.
	stream nextPutAll: 'End If'.
	stream newLine.
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitInvocation: aMOInvocation [

	aMOInvocation parent isStatementExpression
		ifTrue: [ stream nextPutAll: 'Call ' ]
		ifFalse: [  ].
	stream
		nextPutAll: aMOInvocation selector;
		nextPutAll: ' ( '.
	self streamArguments: aMOInvocation arguments.
	stream nextPutAll: ' ) '.
	aMOInvocation parent isStatement ifFalse: [ ]
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitLabelReference: aMOAlceLabelReference [

	stream
		nextPutAll: aMOAlceLabelReference name;
		nextPutAll: #':'
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitLocalVariable: aMOLocalVariable [

	self visitVariable: aMOLocalVariable
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitMethodInvocation: aMOMethodInvocation [

	aMOMethodInvocation parent isStatementExpression
		ifTrue: [ stream nextPutAll: 'Call ' ]
		ifFalse: [  ].

	aMOMethodInvocation receiverReference acceptVisitor: self.
	stream
		nextPutAll: '.';
		nextPutAll: aMOMethodInvocation selector;
		nextPutAll: ' ( '.
	self streamArguments: aMOMethodInvocation arguments.
	stream nextPutAll: ' ) '.
	aMOMethodInvocation parent isStatement ifFalse: [ 
	 ]
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitModule: aMOModule [

	aMOModule types do: [ :m | 
		m acceptVisitor: self.
		stream newLine ].
	aMOModule constants do: [ :m | 
		m acceptVisitor: self.
		stream newLine ].
	aMOModule variables do: [ :m | 
		m acceptVisitor: self.
		stream newLine ].
	aMOModule invocables do: [ :m | 
		m acceptVisitor: self.
		stream newLine ]
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitNullLiteral: aMONullLiteral [

	stream nextPutAll: #None
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitOnErrorGoToLabel: aMOAlceOnErrorGoToLabel [

	stream nextPutAll: 'ON ERROR GOTO '.
	stream nextPutAll: aMOAlceOnErrorGoToLabel destination name 
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitOnErrorResumeNext: aMOAlceOnErrorResumeNext [ 
	stream nextPutAll: 'On Error Resume Next'
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitParameter: aMOParameter [

	stream
		nextPutAll: aMOParameter name;
		nextPutAll: ' As '.
	stream nextPutAll: ((aMOParameter typeReference isNil or: [ 
			  aMOParameter typeReference name = '#_TypeUndefined' ])
			 ifTrue: [ 'Variant' ]
			 ifFalse: [ aMOParameter typeReference name ])
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitProcedure: aMOProcedure [

	stream nextPutAll: aMOProcedure visibility.
	aMOProcedure modifiers do: [ :m | 
		stream
			nextPutAll: m;
			nextPutAll: ' ' ].
	stream
		nextPutAll: ' Sub ';
		nextPutAll: aMOProcedure selector;
		nextPutAll: ' ('.
	self streamArguments: aMOProcedure parameters.
	stream nextPutAll: ')'.
	aMOProcedure block acceptVisitor: self.
	stream nextPutAll: 'End Sub'.
	stream newLine.
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitReport: aMOAlceReport [

	self visitClass: aMOAlceReport
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitResume: aMOAlceResume [ 
	stream nextPutAll: #Resume 
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitResumeLabel: aMOAlceResumeLabel [

	self assert: aMOAlceResumeLabel destinations size = 1.
	stream
		nextPutAll: 'Resume ';
		nextPutAll: aMOAlceResumeLabel destinations first name
]

{ #category : #enumerating }
MOMicrosoftAccessCodeGenerator >> visitSelect: aMOSelect [

	stream nextPutAll: 'Select Case '.
	aMOSelect expression acceptVisitor: self.
	stream newLine.
	self increaseDeepDuring: [ 
		aMOSelect cases do: [ :case | 
			self printIndentation.
			case acceptVisitor: self ] ].
	stream
		nextPutAll: 'End Select ';
		newLine
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitSetToReturn: aMOSetToReturn [ 
	stream nextPutAll: aMOSetToReturn invocableSelector; nextPutAll: ' = '. 
	aMOSetToReturn expression acceptVisitor: self 
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitStatementExpression: aMOStatementExpression [

	aMOStatementExpression expression acceptVisitor: self
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitStructure: aMOStructure [

	stream
		nextPutAll: 'Type ';
		nextPutAll: aMOStructure name;
		newLine.
	self increaseDeepDuring: [ 
		aMOStructure attributes do: [ :a | 
			self printIndentation.
			stream
				nextPutAll: a name;
				nextPutAll: ' As '.
			stream nextPutAll:
				(a typeReference
					 ifNil: [ 'Variant' ]
					 ifNotNil: [ :t | t type name ]).
			stream newLine ] ].
	stream
		nextPutAll: 'End Type';
		newLine;
		newLine
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitTypeReference: aMOTypeReference [

	stream nextPutAll: aMOTypeReference name
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitUnaryArithmeticExpression: aMOUnaryArithmeticOperation [

	self visitUnaryExpression: aMOUnaryArithmeticOperation
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitUnaryExpression: aMOUnaryArithmeticOperation [

	aMOUnaryArithmeticOperation isPrefix ifTrue: [ 
		stream
			nextPutAll: aMOUnaryArithmeticOperation operator;
			nextPutAll: ' ' ].
	aMOUnaryArithmeticOperation operand acceptVisitor: self.
	aMOUnaryArithmeticOperation isPostfix ifTrue: [ 
		stream
			nextPutAll: aMOUnaryArithmeticOperation operator;
			nextPutAll: ' ' ]
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitVarArgParameter: aMOVariableArgumentsParameter [

	stream nextPutAll: 'ParamArray '.
	self visitParameter: aMOVariableArgumentsParameter
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitVariable: aMOVariable [

	| name |
	name := aMOVariable sanitizedName = aMOVariable name
		        ifTrue: [ aMOVariable name ]
		        ifFalse: [ 
			        '[' , (aMOVariable name first isDigit
				         ifTrue: [ '_' ]
				         ifFalse: [ '' ]) , aMOVariable name , ']' ].
	stream
		nextPutAll: 'Dim ';
		nextPutAll: name;
		nextPutAll: ' As '.
	stream nextPutAll: (aMOVariable typeReference
			 ifNil: [ 'Variant' ]
			 ifNotNil: [ :t | t name ])
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitVariableAccessor: aMOVariableAccessor [

	self visitAccessor: aMOVariableAccessor
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitWhile: aMOWhile [

	stream nextPutAll: 'Do While '.
	aMOWhile condition acceptVisitor: self.
	aMOWhile loopingBlock  acceptVisitor: self.
	stream
		nextPutAll: 'Loop';
		newLine
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitWith: aMOAlceWith [

	stream nextPutAll: 'With '.
	aMOAlceWith expression acceptVisitor: self.
	stream newLine.
	aMOAlceWith block acceptVisitor: self.
	stream
		nextPutAll: 'End With ';
		newLine
]
