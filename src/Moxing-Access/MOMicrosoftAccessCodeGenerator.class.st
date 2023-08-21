Class {
	#name : #MOMicrosoftAccessCodeGenerator,
	#superclass : #MOCodeGenerator,
	#category : #'Moxing-Access-Importers'
}

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> blockDelimiterClose [

	^ ''
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> blockDelimiterOpen [

	^ ''
]

{ #category : #accessing }
MOMicrosoftAccessCodeGenerator >> comment: aFullBlockClosure [

	isCommenting
		ifFalse: [ 
			self
				nextPut: $';
				nextPutAll: ' TODO '.
			isCommenting := true.
			aFullBlockClosure value.
			isCommenting := false ]
		ifTrue: [ aFullBlockClosure value ]
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> lineDelimiter [

	^ ''
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> newLine [

	stream newLine.
	isCommenting ifTrue: [ 
		self
			nextPut: $';
			nextPutAll: ' ' ]
]

{ #category : #accessing }
MOMicrosoftAccessCodeGenerator >> nextPutAll: aText [

	^ stream nextPutAll: aText
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> printSelf [

	self nextPutAll: 'Me'
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> produceCodeFor: anTree [
	^ super produceCodeFor: anTree."
	anTree acceptVisitor: self.
	^ self sourceCode"
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> variableBody: aMOLocalConstant [

	(aMOLocalConstant initializer isNotNil and: [ 
		 aMOLocalConstant initializer isKindOf: MONewInvocation ])
		ifTrue: [ 
			aMOLocalConstant typeReference isUnknown ifFalse: [ 
				self nextPutAll: ' As New '.
				self nextPutAll: (aMOLocalConstant typeReference
						 ifNil: [ 'Variant' ]
						 ifNotNil: [ :t | t name ]) ] ]
		ifFalse: [ 
			aMOLocalConstant typeReference isUnknown ifFalse: [ 
				self nextPutAll: ' As '.
				self nextPutAll: (aMOLocalConstant typeReference
						 ifNil: [ 'Variant' ]
						 ifNotNil: [ :t | t name ]) ].
			aMOLocalConstant initializer ifNotNil: [ :init | 
				self nextPutAll: ' = '.
				aMOLocalConstant initializer acceptVisitor: self ] ]
]

{ #category : #accessing }
MOMicrosoftAccessCodeGenerator >> variableName: aMOVariable [

	^ aMOVariable sanitizedName = aMOVariable name
		  ifTrue: [ aMOVariable name ]
		  ifFalse: [ 
			  '[' , (aMOVariable name first isDigit
				   ifTrue: [ '_' ]
				   ifFalse: [ '' ]) , aMOVariable name , ']' ]
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitAccessor: aMOAttributeAccessor [

	self
		nextPutAll: 'Property ';
		nextPutAll: aMOAttributeAccessor kind;
		nextPutAll: ' ';
		nextPutAll: aMOAttributeAccessor selector ; nextPutAll: '('.
	
	self streamArguments: aMOAttributeAccessor parameters.
	self  nextPutAll: ')'.
	(aMOAttributeAccessor kind = #Get and: [ 
		 aMOAttributeAccessor returnTypeReference isNotNil ]) ifTrue: [ 
		self
			nextPutAll: ' As ';
			nextPutAll: aMOAttributeAccessor returnTypeReference name ].
	
	aMOAttributeAccessor block acceptVisitor: self.
	self nextPutAll: 'End Property'.
	self newLine.
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitArrayAccess: aMOArrayAccess [

	aMOArrayAccess receiverReference acceptVisitor: self.
	self nextPutAll: '('.
	self streamArguments: aMOArrayAccess arguments.
	self nextPutAll: ')'
]

{ #category : #accessing }
MOMicrosoftAccessCodeGenerator >> visitAssignment: aMOAssignment [

	(aMOAssignment read isKindOf: MONoOp)
		ifTrue: [ 
			self comment: [ 
				aMOAssignment write acceptVisitor: self.
				self
					nextPutAll: ' ';
					nextPutAll: #=;
					nextPutAll: ' '.
				aMOAssignment read acceptVisitor: self ] ]
		ifFalse: [ 
			aMOAssignment write acceptVisitor: self.
			self
				nextPutAll: ' ';
				nextPutAll: #=;
				nextPutAll: ' '.
			aMOAssignment read acceptVisitor: self ]
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitAttribute: aMOAttribute [ 
	^ self visitVariable: aMOAttribute 
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitAttributeAccess: aMOAttributeAccess [

	aMOAttributeAccess receiverReference acceptVisitor: self.
	self
		nextPutAll: '.';
		nextPutAll: aMOAttributeAccess name
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitBooleanLiteral: aMOBooleanLiteral [

	self nextPutAll:
		aMOBooleanLiteral literal asString capitalized
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitCase: aMOCase [


	self nextPutAll: 'Case '.

	aMOCase expressions
		ifEmpty: [ self nextPutAll: 'Else ' ]
		ifNotEmpty: [ self streamArguments: aMOCase expressions ].
	aMOCase block acceptVisitor: self
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitClass: aJinTypescriptClass [

	
	aJinTypescriptClass attributes do: [ :m | 
		m acceptVisitor: self.
		self newLine ].
	aJinTypescriptClass methods do: [ :m | 
		m acceptVisitor: self.
		self newLine ]
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
MOMicrosoftAccessCodeGenerator >> visitColorLiteral: aMOAlceColorLiteral [

	self nextPutAll: aMOAlceColorLiteral literal
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitConstantAttribute: aMOConstantAttribute [

	^ self visitLocalConstant: aMOConstantAttribute
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitConstantReference: aMOConstantReference [ 
	self nextPutAll: aMOConstantReference name
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitDateLiteral: aMOAlceDateLiteral [

	self nextPutAll: aMOAlceDateLiteral literal
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitDeclarationUnit: aMODeclarationUnit [ 
self nextPutAll: 'Option Compare Database
Option Explicit

'.
	self visitCollection: aMODeclarationUnit types
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitEmptyBlock: aMOEmptyBlock [

	self newLine
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitEnum: aMOEnum [

	self
		nextPutAll: 'Enum ';
		nextPutAll: aMOEnum name;
		newLine.
	self increaseDeepDuring: [ 
		self printIndentation.
		aMOEnum entries do: [ :e | 
			e acceptVisitor: self.
			self newLine ] ].
	self
		nextPutAll: 'End Enum';
		newLine;
		newLine
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitEnumEntry: aMOEnumEntry [

	self
		nextPutAll: aMOEnumEntry name;
		nextPutAll: ' '.
	aMOEnumEntry value ifNotNil: [ :e | 
		self nextPutAll: '= '.
		e acceptVisitor: self ]
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitExit: aMOAlceExit [

	self nextPutAll: #'Exit '.
	({ 
		 MOAttributeAccessor.
		 MOFunction.
		 MOClassFunction } includes: aMOAlceExit invocableKind) ifTrue: [ 
		self nextPutAll: 'Function'.
		^ self ].

	({ 
		 MOProcedure.
		 MOClassProcedure } includes: aMOAlceExit invocableKind) ifTrue: [ 
		self nextPutAll: 'Sub'.
		^ self ].

	self halt
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitFloatLiteral: aMOFloatLiteral [

	self nextPutAll: aMOFloatLiteral literal asString
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitForEach: aMOForEach [

	self nextPutAll: 'For Each '.
	aMOForEach each acceptVisitor: self.
	self nextPutAll: ' In '.
	aMOForEach collection acceptVisitor: self.
	aMOForEach loopingBlock acceptVisitor: self.
	self nextPutAll: 'Next'
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitForNext: aMOForNext [

	self nextPutAll: 'For '.
	aMOForNext counter acceptVisitor: self.
	self nextPutAll: ' = '.
	aMOForNext initialValue acceptVisitor: self.
	self nextPutAll: ' To '.
	aMOForNext limitValue acceptVisitor: self.
	aMOForNext step ifNotNil: [ 
		self nextPutAll: ' Step '.
		aMOForNext step acceptVisitor: self ].
	aMOForNext loopingBlock acceptVisitor: self.
	self nextPutAll: 'Next'
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitForm: aMOAlceForm [

	self visitClass: aMOAlceForm
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitFunction: aMOFunction [

	self nextPutAll: aMOFunction visibility capitalized.
	aMOFunction modifiers do: [ :m | 
		self
			nextPutAll: m;
			nextPutAll: ' ' ].
	self
		nextPutAll: ' Function ';
		nextPutAll: aMOFunction selector;
		nextPutAll: '('.

	self streamArguments: aMOFunction parameters.
	self nextPutAll: ')'.

	aMOFunction returnTypeReference ifNotNil: [ :rtr | 
		self
			nextPutAll: ' As ';
			nextPutAll: rtr name ].
	aMOFunction block acceptVisitor: self.
	self nextPutAll: 'End Function'.
	self newLine
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitGlobalConstant: aMOGlobalConstant [

	self nextPutAll: 'Global '.
	self visitLocalConstant: aMOGlobalConstant
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitGlobalVariable: aMOGlobalVariable [

	self
		nextPutAll: 'Global ';
		nextPutAll: (self variableName: aMOGlobalVariable).
	self variableBody: aMOGlobalVariable
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitGoSub: aMOAlceGoSubLabel [ 

	self nextPutAll: 'GoSub '.
	self nextPutAll: aMOAlceGoSubLabel destination name 
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitGoTo: aMOAlceGoToLabel [

	self nextPutAll: 'GoTo '.
	self nextPutAll: aMOAlceGoToLabel destination name
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitIfElse: aMOIfElse [

	self nextPutAll: 'If '.
	aMOIfElse condition acceptVisitor: self.
	self nextPutAll: ' Then '.
	aMOIfElse ifTrue acceptVisitor: self.
	aMOIfElse ifFalse statements isEmpty ifFalse: [ 
		self printIndentation.
		self nextPutAll: 'Else '.
		aMOIfElse ifFalse acceptVisitor: self ].
	self printIndentation.
	self nextPutAll: 'End If'.
	self newLine.
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitInvocation: aMOInvocation [

	aMOInvocation selector asLowercase = #beep ifTrue: [ 
		self nextPutAll: #Beep.
		^ self ].
	aMOInvocation parent isStatementExpression
		ifTrue: [ self nextPutAll: 'Call ' ]
		ifFalse: [  ].
	self
		nextPutAll: aMOInvocation selector;
		nextPutAll: '('.
	self streamArguments: aMOInvocation arguments.
	self nextPutAll: ')'.
	aMOInvocation parent isStatement ifFalse: [  ]
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitLabelReference: aMOAlceLabelReference [

	self
		nextPutAll: aMOAlceLabelReference name;
		nextPutAll: #':'
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitLocalConstant: aMOLocalConstant [

	| name |
	name := self variableName: aMOLocalConstant.
	self
		nextPutAll: 'Const ';
		nextPutAll: name.
	self variableBody: aMOLocalConstant
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitLocalVariable: aMOLocalVariable [

	self visitVariable: aMOLocalVariable
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitMethodInvocation: aMOMethodInvocation [

	aMOMethodInvocation selector asLowercase = #beep ifTrue: [ 
		self nextPutAll: #Beep.
		^ self ].
	aMOMethodInvocation parent isStatementExpression
		ifTrue: [ self nextPutAll: 'Call ' ]
		ifFalse: [  ].

	aMOMethodInvocation receiverReference acceptVisitor: self.
	self
		nextPutAll: '.';
		nextPutAll: aMOMethodInvocation selector;
		nextPutAll: '('.
	self streamArguments: aMOMethodInvocation arguments.
	self nextPutAll: ')'.
	aMOMethodInvocation parent isStatement ifFalse: [  ]
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitModule: aMOModule [

	aMOModule types do: [ :m | 
		m acceptVisitor: self.
		self newLine ].
	aMOModule constants do: [ :m | 
		m acceptVisitor: self.
		self newLine ].
	aMOModule variables do: [ :m | 
		m acceptVisitor: self.
		self newLine ].
	aMOModule invocables do: [ :m | 
		m acceptVisitor: self.
		self newLine ]
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitNoOp: aMONoOp [

	" used to replace nodes with nothing "

	isCommenting ifFalse: [ self nextPut: $' ].
	^ self
		  nextPutAll: 'NoOP: ';
		  nextPutAll: aMONoOp description
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitNullLiteral: aMONullLiteral [

	self nextPutAll: #None
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitOnErrorGoToLabel: aMOAlceOnErrorGoToLabel [

	self nextPutAll: 'On Error GoTo '.
	self nextPutAll: aMOAlceOnErrorGoToLabel destination name 
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitOnErrorResumeNext: aMOAlceOnErrorResumeNext [ 
	self nextPutAll: 'On Error Resume Next'
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitParameter: aMOParameter [

	self
		nextPutAll: aMOParameter name;
		nextPutAll: ' As '.
	self nextPutAll: ((aMOParameter typeReference isNil or: [ 
			  aMOParameter typeReference name = '#_TypeUndefined' ])
			 ifTrue: [ 'Variant' ]
			 ifFalse: [ aMOParameter typeReference name ])
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitProcedure: aMOProcedure [

	self nextPutAll: aMOProcedure visibility.
	aMOProcedure modifiers do: [ :m | 
		self
			nextPutAll: m;
			nextPutAll: ' ' ].
	self
		nextPutAll: ' Sub ';
		nextPutAll: aMOProcedure selector;
		nextPutAll: '('.
	self streamArguments: aMOProcedure parameters.
	self nextPutAll: ')'.
	aMOProcedure block acceptVisitor: self.
	self nextPutAll: 'End Sub'.
	self newLine.
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitRedimVariable: aMOAlceRedimVariable [

	self
		nextPutAll: 'ReDim ';
		nextPutAll: (self variableName: aMOAlceRedimVariable);
		nextPutAll: aMOAlceRedimVariable redimText.


	(aMOAlceRedimVariable typeReference isNil or: [ 
		 aMOAlceRedimVariable typeReference isUnknown ]) ifFalse: [ 
		self nextPutAll: ' As '.
		self nextPutAll: aMOAlceRedimVariable typeReference name ]
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitReport: aMOAlceReport [

	self visitClass: aMOAlceReport
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitResume: aMOAlceResume [ 
	self nextPutAll: #Resume 
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitResumeLabel: aMOAlceResumeLabel [

	self assert: aMOAlceResumeLabel destinations size = 1.
	self
		nextPutAll: 'Resume ';
		nextPutAll: aMOAlceResumeLabel destinations first name
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitReturnEmpty: aMOReturnEmpty [

	self nextPutAll: 'return'
]

{ #category : #enumerating }
MOMicrosoftAccessCodeGenerator >> visitSelect: aMOSelect [

	self nextPutAll: 'Select Case '.
	aMOSelect expression acceptVisitor: self.
	self newLine.
	self increaseDeepDuring: [ 
		aMOSelect cases do: [ :case | 
			self printIndentation.
			case acceptVisitor: self ] ].
	self
		nextPutAll: 'End Select ';
		newLine
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitSetToReturn: aMOSetToReturn [ 
	self nextPutAll: aMOSetToReturn invocableSelector; nextPutAll: ' = '. 
	aMOSetToReturn expression acceptVisitor: self 
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitStatementExpression: aMOStatementExpression [

	aMOStatementExpression expression acceptVisitor: self
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitStructure: aMOStructure [

	self
		nextPutAll: 'Type ';
		nextPutAll: aMOStructure name;
		newLine.
	self increaseDeepDuring: [ 
		aMOStructure attributes do: [ :a | 
			self printIndentation.
			self
				nextPutAll: a name;
				nextPutAll: ' As '.
			self nextPutAll:
				(a typeReference
					 ifNil: [ 'Variant' ]
					 ifNotNil: [ :t | t type name ]).
			self newLine ] ].
	self
		nextPutAll: 'End Type';
		newLine;
		newLine
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitTypeReference: aMOTypeReference [

	self nextPutAll: aMOTypeReference name
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitUnaryArithmeticExpression: aMOUnaryArithmeticOperation [

	self visitUnaryExpression: aMOUnaryArithmeticOperation
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitUnaryExpression: aMOUnaryArithmeticOperation [

	aMOUnaryArithmeticOperation isPrefix ifTrue: [ 
		self
			nextPutAll: aMOUnaryArithmeticOperation operator;
			nextPutAll:
				(aMOUnaryArithmeticOperation operator isAllAlphaNumerics
					 ifTrue: [ ' ' ]
					 ifFalse: [ '' ]) ].
	aMOUnaryArithmeticOperation operand acceptVisitor: self.
	aMOUnaryArithmeticOperation isPostfix ifTrue: [ 
		self
			nextPutAll: aMOUnaryArithmeticOperation operator;
			nextPutAll:
				(aMOUnaryArithmeticOperation operator isAllAlphaNumerics
					 ifTrue: [ ' ' ]
					 ifFalse: [ '' ]) ]
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitVarArgParameter: aMOVariableArgumentsParameter [

	self nextPutAll: 'ParamArray '.
	self visitParameter: aMOVariableArgumentsParameter
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitVariable: aMOVariable [

	| name |
	name := self variableName: aMOVariable.
	self
		nextPutAll: 'Dim ';
		nextPutAll: name.
	self variableBody: aMOVariable
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitVariableAccessor: aMOVariableAccessor [

	self visitAccessor: aMOVariableAccessor
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitWhile: aMOWhile [

	self nextPutAll: 'Do While '.
	aMOWhile condition acceptVisitor: self.
	aMOWhile loopingBlock  acceptVisitor: self.
	self
		nextPutAll: 'Loop';
		newLine
]

{ #category : #visiting }
MOMicrosoftAccessCodeGenerator >> visitWith: aMOAlceWith [

	self nextPutAll: 'With '.
	aMOAlceWith expression acceptVisitor: self.
	self newLine.
	aMOAlceWith block acceptVisitor: self.
	self
		nextPutAll: 'End With ';
		newLine
]
