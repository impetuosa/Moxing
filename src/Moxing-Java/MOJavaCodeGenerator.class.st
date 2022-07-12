Class {
	#name : #MOJavaCodeGenerator,
	#superclass : #MOCodeGenerator,
	#category : #'Moxing-Java-Writer'
}

{ #category : #visiting }
MOJavaCodeGenerator >> closeComment [
  self nextPutAll: '*/'
]

{ #category : #visiting }
MOJavaCodeGenerator >> initialize [

	super initialize.
	isCommenting := false
]

{ #category : #visiting }
MOJavaCodeGenerator >> openComment [
  self nextPutAll: '/*'
]

{ #category : #visiting }
MOJavaCodeGenerator >> printClassHeader: name types: parameterTypes extends: superClassRef implements: types [

	self nextPutAll: (' class {1} <' format: { name }).
	self streamArguments: parameterTypes.
	self nextPutAll: '>'.
	superClassRef ifNotNil: [ 
		self
			nextPutAll: ' extends ';
			nextPutAll: superClassRef name ].
	types ifNotEmpty: [ 
		self
			nextPutAll: ' implements ';
			nextPutAll: (',' join: (types collect: #name)) ]
]

{ #category : #visiting }
MOJavaCodeGenerator >> printInterfaceHeader: name implements: types [

	self nextPutAll: (' interface {1} ' format: { name }).

	types ifNotEmpty: [ 
		self
			nextPutAll: ' extends ';
			nextPutAll: (',' join: (types collect: #name)) ]
]

{ #category : #printing }
MOJavaCodeGenerator >> printInterfaceHeader: name types: parameterTypes implements: types [

	self nextPutAll: (' interface {1} <' format: { name }).
	self streamArguments: parameterTypes.
	self nextPutAll: '> '.
	types ifNotEmpty: [ 
		self
			nextPutAll: ' extends ';
			nextPutAll: (',' join: (types collect: #name)) ]
]

{ #category : #visiting }
MOJavaCodeGenerator >> printSelf [

	self nextPutAll: 'this'
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitAccessor: aMOAccessor [

	self visitMethod: aMOAccessor
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitAnnotation: aMOAnnotationInstance [

	self printIndentation.
	self
		nextPutAll: '@';
		nextPutAll: aMOAnnotationInstance typeReference name.
	aMOAnnotationInstance arguments ifNotEmpty: [ 
		self nextPutAll: '('.
		self streamArguments: aMOAnnotationInstance arguments.
		self nextPutAll: ')' ]
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitArrayAccess: aMOArrayAccess [ 
	aMOArrayAccess receiverReference acceptVisitor: self. 
	self nextPutAll: '['.
	self streamArguments: aMOArrayAccess arguments. 
	self nextPutAll: ']'.
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitArrayTypeReference: aMOArrayTypeReference [

	self assert: aMOArrayTypeReference argumentTypeReferences size = 1.
	aMOArrayTypeReference argumentTypeReferences first acceptVisitor:
		self.
	self nextPutAll: '[]'
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitAssignment: anAssignment [
	anAssignment write isInvocation ifTrue: [ self nextPutAll:'/* TODO '.].
	super visitAssignment: anAssignment.
	anAssignment write isInvocation ifTrue: [ self nextPutAll:'*/'.].
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitAttribute: aMOAttribute [

	aMOAttribute annotationInstances do: [ :m | 
		m acceptVisitor: self.
		self newLine ].
	self printIndentation.
	aMOAttribute isStaticBinding ifTrue: [ self nextPutAll: 'static ' ].
	aMOAttribute visibility ifNotNil: [ :v | 
		self
			nextPutAll: v;
			nextPutAll: ' ' ].
	self visitVariable: aMOAttribute
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitAttributeAccess: aMOAttributeAccess [

	aMOAttributeAccess receiverReference acceptVisitor: self.
	self
		nextPutAll: '.';
		nextPutAll: aMOAttributeAccess name
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitBinaryArithmeticOperation: aMOBinaryArithmeticOperation [

	aMOBinaryArithmeticOperation left acceptVisitor: self.
	self
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
			ifEmpty: [ self nextPutAll: 'default: ' ]
			ifNotEmpty: [ 
				self nextPutAll: 'case '.
				aMOCase expressions first acceptVisitor: self.
				self nextPutAll: ':' ].
		self newLine.
		self increaseDeepDuring: [ 
			aMOCase block statements do: [ :s | 
				self printIndentation.
				s acceptVisitor: self.

				(self requiresTerminator: s) ifTrue: [ 
					self nextPutAll: self lineDelimiter ].
				self newLine ].
			self printIndentation.
			self nextPutAll: ' break;'.
			self newLine ] ]
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitCatch: aMOCatch [

	self printIndentation.
	self nextPutAll: 'catch ('.
	self streamArguments: aMOCatch parameters.
	self nextPutAll: ')'.
	aMOCatch block acceptVisitor: self
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitClass: aJinTypescriptClass [

	aJinTypescriptClass annotationInstances do: [ :m | 
		m acceptVisitor: self.
		self newLine ].

	(aJinTypescriptClass modifiers reject: [ :a | a = #default ]) do: [ 
		:m | 
		self
			nextPutAll: m;
			nextPutAll: ' ' ].
	aJinTypescriptClass visibility asLowercase = #default ifFalse: [ 
		self nextPutAll: aJinTypescriptClass visibility asLowercase ].
	self
		printClassHeader: aJinTypescriptClass name
		extends: aJinTypescriptClass superclassReference
		implements: aJinTypescriptClass superTypeReferences.

	self
		nextPutAll: ' {';
		newLine.
	self increaseDeepDuring: [ 
		aJinTypescriptClass attributes do: [ :m | 
			m acceptVisitor: self.
			self
				nextPutAll: ';';
				newLine ].
		aJinTypescriptClass methods do: [ :m | 
			m acceptVisitor: self.
			self newLine ].
		self nextPutAll: '}' ]
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitClassType: aMOClassType [

	aMOClassType modifiers do: [ :m | 
		self
			nextPutAll: m;
			nextPutAll: ' ' ].
	self nextPutAll: aMOClassType visibility asLowercase.
	self
		printInterfaceHeader: aMOClassType name
		implements: aMOClassType superTypeReferences.

	self
		nextPutAll: ' {';
		newLine.
	self increaseDeepDuring: [ 
		aMOClassType attributes do: [ :m | 
			m acceptVisitor: self.
			self
				nextPutAll: ';';
				newLine ].
		aMOClassType methods do: [ :m | 
			m acceptVisitor: self.
			self newLine ].
		self nextPutAll: '}' ]
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitConstant: aMOConstant [

	self nextPutAll: 'const '.
	self visitVariable: aMOConstant
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitConstantAttribute: aMOConstantAttribute [

	self nextPutAll: 'final '.
	self visitVariable: aMOConstantAttribute
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitConstantReference: aMOConstantReference [

	^ self visitVariableReference: aMOConstantReference
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitConstructor: aMOConstructor [

	self printIndentation.
	self
		nextPutAll: aMOConstructor visibility;
		nextPutAll: ' '.
	aMOConstructor modifiers do: [ :m | 
		self
			nextPutAll: m;
			nextPutAll: ' ' ].
	self
		nextPutAll: ' ';
		nextPutAll: aMOConstructor parent name;
		nextPutAll: '('.
	self streamArguments: aMOConstructor parameters.


	self nextPutAll: ') '.

	aMOConstructor block acceptVisitor: self.
	self
		nextPutAll: '';
		newLine
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitDeclarationUnit: aMODeclarationUnit [

	self
		nextPutAll: 'package ';
		nextPutAll: aMODeclarationUnit types anyOne packageReference name;
		nextPutAll: ';';
		newLine.
	self visitCollection: aMODeclarationUnit imports.
	self visitCollection: aMODeclarationUnit types
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitEmptyBlock: aMOEmptyBlock [ 
	self nextPutAll: '{}'
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitEnum: aMOEnum [

	self
		newLine;
		nextPutAll: aMOEnum visibility;
		nextPutAll: ' enum ';
		nextPutAll: aMOEnum name.
	self
		nextPutAll: ' {';
		newLine.
	self increaseDeepDuring: [ 
		aMOEnum entries do: [ :m | 
			self printIndentation.
			m acceptVisitor: self.
			self
				nextPutAll: ',';
				newLine ].
		self newLine.
		self printIndentation.
		self nextPutAll: '}' ]
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitEnumEntry: aMOEnumEntry [ 
	self nextPutAll: aMOEnumEntry name .
	aMOEnumEntry value ifNotNil: [ 
		self nextPutAll: ' = '. 	
		self nextPutAll: aMOEnumEntry value
	 ]
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitExit: aMOAlceExit [

	self comment: [ self nextPutAll: ' Exit ' ]
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

	self
		nextPutAll: 'import ';
		nextPutAll: aMOImport packageReference name;
		nextPutAll: '.'.

	aMOImport types size = 1
		ifTrue: [ self nextPutAll: aMOImport types first name ]
		ifFalse: [ self nextPutAll: '*' ].
	self nextPutAll: ';'.
	self newLine
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitInvocation: aMOInvocation [

	"self assert: (aMOInvocation candidate modifiers includes: #static)."

	self
		nextPutAll:
			' /** TODO Function Invocation Is not valid in Java. Must be transformed to Method Invocation ';
		newLine;
		nextPutAll: aMOInvocation selector;
		nextPutAll: '('.
	self streamArguments: aMOInvocation arguments.
	self
		nextPutAll: ')';
		newLine;
		nextPutAll: '*/'
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitJavaClass: aJinTypescriptClass [

	aJinTypescriptClass annotationInstances do: [ :m | 
		m acceptVisitor: self.
		self newLine ].

	(aJinTypescriptClass modifiers reject: [ :a | a = #default ]) do: [ 
		:m | 
		self
			nextPutAll: m;
			nextPutAll: ' ' ].
	aJinTypescriptClass visibility asLowercase = #default ifFalse: [ 
		self nextPutAll: aJinTypescriptClass visibility asLowercase ].
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
MOJavaCodeGenerator >> visitLabelReference: aMOAlceLabelReference [

	^ self comment: [ 
		  self
			  nextPutAll: ' Label Usage:   ';
			  nextPutAll: aMOAlceLabelReference name ]
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitLocalVariable: aMOLocalVariable [

	^ self visitVariable: aMOLocalVariable
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitMethod: aMOMethod [

	aMOMethod annotationInstances do: [ :m | 
		m acceptVisitor: self.
		self newLine ].
	self printIndentation.
	self
		nextPutAll: aMOMethod visibility;
		nextPutAll: ' '.

	(aMOMethod modifiers reject: [ :a | a = aMOMethod visibility ]) do: [ 
		:m | 
		self
			nextPutAll: m;
			nextPutAll: ' ' ].
	aMOMethod isStaticBinding ifTrue: [ self nextPutAll: ' static ' ].
	aMOMethod returnTypeReference
		ifNil: [ self nextPutAll: 'UNKNOWN' ]
		ifNotNil: [ :rt | rt acceptVisitor: self ].
	self
		nextPutAll: ' ';
		nextPutAll: aMOMethod selector;
		nextPutAll: '('.
	self streamArguments: aMOMethod parameters.


	self nextPutAll: ') '.

	aMOMethod isOnlySignature
		ifTrue: [ self nextPutAll: ';' ]
		ifFalse: [ aMOMethod block acceptVisitor: self ].

	self
		nextPutAll: '';
		newLine
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitMethodInvocation: aMOMethodInvocation [
	aMOMethodInvocation receiverReference acceptVisitor: self.
	self
		nextPutAll: '.';
		nextPutAll: aMOMethodInvocation selector;
		nextPutAll: '('.
	self streamArguments: aMOMethodInvocation arguments.
	self nextPutAll: ')'
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitModule: aMOModule [

	self comment: [ 
		self nextPutAll:
			' Modules define functions. Java does not allow such kind of structure. It must be transformed into a Class '.
		self visitCollection: aMOModule allContainments ]
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitNamedArgument: aMONamedArgument [

	self
		nextPutAll: aMONamedArgument name;
		nextPutAll: ' = '.
	aMONamedArgument isArrayArgument ifTrue: [ self nextPutAll: '{' ].
	self stream: aMONamedArgument argumentExpressions splitingWith: [ 
		self
			nextPutAll: ', ';
			newLine ].
	aMONamedArgument isArrayArgument ifTrue: [ self nextPutAll: '}' ]
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitNullLiteral: aMONullLiteral [

	self nextPutAll: 'null'
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitOnErrorGoToLabel: aMOAlceOnErrorGoToLabel [

	self comment: [ 
		self
			nextPutAll: 'When ever there is an error, the code after ';
			nextPutAll: aMOAlceOnErrorGoToLabel destination name;
			nextPutAll: ' should be executed ' ]
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitOnErrorResumeNext: aMOAlceOnErrorResumeNext [

	self comment: [ 
		self nextPutAll:
			' TODO: On error we should execute the next statement ' ]
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitParameter: aMOParameter [

	aMOParameter typeReference acceptVisitor: self.

	self
		nextPutAll: ' ';
		nextPutAll: aMOParameter name
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitParametrizableClass: aMOParametrizableClass [

	aMOParametrizableClass annotationInstances do: [ :m | 
		m acceptVisitor: self.
		self newLine ].
	aMOParametrizableClass modifiers do: [ :m | 
		self
			nextPutAll: m;
			nextPutAll: ' ' ].
	self nextPutAll: aMOParametrizableClass visibility asLowercase.
	self
		printClassHeader: aMOParametrizableClass name
		types: aMOParametrizableClass typeParameters
		extends: aMOParametrizableClass superclassReference
		implements: aMOParametrizableClass superTypeReferences.

	self
		nextPutAll: ' {';
		newLine.
	self increaseDeepDuring: [ 
		aMOParametrizableClass attributes do: [ :m | 
			m acceptVisitor: self.
			self
				nextPutAll: ';';
				newLine ].
		aMOParametrizableClass methods do: [ :m | 
			m acceptVisitor: self.
			self newLine ].
		self nextPutAll: '}' ]
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitParametrizableClassType: aMOClassType [ 

	aMOClassType modifiers do: [ :m | 
		self
			nextPutAll: m;
			nextPutAll: ' ' ].
	self nextPutAll: aMOClassType visibility asLowercase.
	self
		printInterfaceHeader: aMOClassType name
		types: aMOClassType typeParameters 
		implements: aMOClassType superTypeReferences.

	self
		nextPutAll: ' {';
		newLine.
	self increaseDeepDuring: [ 
		aMOClassType attributes do: [ :m | 
			m acceptVisitor: self.
			self
				nextPutAll: ';';
				newLine ].
		aMOClassType methods do: [ :m | 
			m acceptVisitor: self.
			self newLine ].
		self nextPutAll: '}' ]
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitParametrizableMethod: aMOParametrizableMethod [

	aMOParametrizableMethod annotationInstances do: [ :m | 
		m acceptVisitor: self.
		self newLine ].
	self printIndentation.
	self
		nextPutAll: aMOParametrizableMethod visibility;
		nextPutAll: ' '.
	aMOParametrizableMethod modifiers do: [ :m | 
		self
			nextPutAll: m;
			nextPutAll: ' ' ].
	aMOParametrizableMethod isStaticBinding ifTrue: [ 
		self nextPutAll: ' static ' ].

	self nextPutAll: '<'.
	self streamArguments: aMOParametrizableMethod typeParameters.
	self nextPutAll: '>'.
	aMOParametrizableMethod returnTypeReference
		ifNil: [ self nextPutAll: 'UNKNOWN' ]
		ifNotNil: [ :rt | rt acceptVisitor: self ].
	self
		nextPutAll: ' ';
		nextPutAll: aMOParametrizableMethod selector;
		nextPutAll: '('.
	self streamArguments: aMOParametrizableMethod parameters.


	self nextPutAll: ') '.
	aMOParametrizableMethod isOnlySignature
		ifTrue: [ self nextPutAll: ';' ]
		ifFalse: [ aMOParametrizableMethod block acceptVisitor: self ].

	self
		nextPutAll: '';
		newLine
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitParametrizedTypeReference: aMOParametrizedTypeReference [

	self
		nextPutAll: aMOParametrizedTypeReference name;
		nextPutAll: '<'.
	self streamArguments:
		aMOParametrizedTypeReference argumentTypeReferences.
	self nextPutAll: '>'
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitPrimitiveTypeReference: aMOPrimitiveTypeReference [

	self nextPutAll: aMOPrimitiveTypeReference name
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitProcedure: aMOProcedure [

	self printIndentation.
	self
		nextPutAll: aMOProcedure visibility;
		nextPutAll: ' '.
	aMOProcedure modifiers do: [ :m | 
		self
			nextPutAll: m;
			nextPutAll: ' ' ].
	aMOProcedure isStaticBinding ifTrue: [ self nextPutAll: ' static ' ].

	self
		nextPutAll: ' void ';
		nextPutAll: aMOProcedure selector;
		nextPutAll: '('.
	self streamArguments: aMOProcedure parameters.


	self nextPutAll: ') '.

	aMOProcedure block acceptVisitor: self.
	self
		nextPutAll: '';
		newLine
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitResume: aMOAlceResume [

	self comment: [ self nextPutAll: ' #resume  ' ]
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitResumeFromLabel: aMOResumeFromLabel [

	self nextPutAll:
		' /** TODO RESUME FROM LABEL IS NOT A COMPATIBLE! */'
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitResumeLabel: aMOAlceResumeLabel [

	self comment: [ 
		self nextPutAll: ' Resume '.
		aMOAlceResumeLabel destinations do: [ :a | 
			self
				nextPutAll: ' Label ';
				nextPutAll: a name ] ]
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitReturnEmpty: aMOReturnEmpty [ 
	self nextPutAll:'return'
]

{ #category : #enumerating }
MOJavaCodeGenerator >> visitSelect: aMOSelect [

	self nextPutAll: 'switch ('.
	aMOSelect expression acceptVisitor: self.
	self nextPutAll: ') {'.
	self newLine.
	self visitCollection: aMOSelect cases.
	self printIndentation.
	self nextPutAll: '}'
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitSetToReturn: aMOSetToReturn [

	self
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
		self nextPutAll: 'TODO '.

		self
			nextPutAll: 'struct ';
			nextPutAll: aMOStructure name;
			nextPutAll: '{';
			newLine.
		self increaseDeepDuring: [ 
			self printIndentation.
			self stream: aMOStructure attributes splitingWith: [ 
				self
					nextPutAll: self lineDelimiter;
					newLine.
				self printIndentation ] ] ].
	self newLine.
	self printIndentation.
	self nextPutAll: '}'
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitTemplatedMethod: aMOTypescriptTemplatedMethod [

	self
		newLine;
		nextPutAll: '    ';
		nextPutAll: aMOTypescriptTemplatedMethod visibility;
		nextPutAll: ' '.
	aMOTypescriptTemplatedMethod type acceptVisitor: self.
	self
		nextPutAll: aMOTypescriptTemplatedMethod selector;
		nextPutAll: '('.
	self nextPutAll:
		(',' join:
			 (aMOTypescriptTemplatedMethod parameters collect: [ :p | 
				  p name , ': ' , p type name ])).
	self nextPutAll: ')'.


	self
		nextPutAll: ' {';
		newLine;
		nextPutAll: aMOTypescriptTemplatedMethod body;
		newLine;
		nextPutAll: '    }';
		newLine
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitTryCatch: aMOTryCatch [

	self nextPutAll: 'try'.
	aMOTryCatch try acceptVisitor: self.
	
	self visitCollection: aMOTryCatch catches 
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitTypeParameter: aMOTypeParameter [

	self nextPutAll: aMOTypeParameter name
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitTypeReference: aFylgjaMissingType [

	self nextPutAll: aFylgjaMissingType name
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitUnaryArithmeticExpression: aMOUnaryArithmeticOperation [

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
MOJavaCodeGenerator >> visitVarArgParameter: aMOVariableArgumentsParameter [

	aMOVariableArgumentsParameter typeReference acceptVisitor: self.

	self
		nextPutAll: '... ';
		nextPutAll: aMOVariableArgumentsParameter name
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitVariable: aMOTypescriptVariable [

	
	aMOTypescriptVariable modifiers do: [ :m | 
		self
			nextPutAll: m;
			nextPutAll: ' ' ].

	aMOTypescriptVariable typeReference ifNotNil: [ 
		aMOTypescriptVariable typeReference acceptVisitor: self.
		self nextPutAll: ' ' ].


	self nextPutAll: aMOTypescriptVariable name.


	aMOTypescriptVariable initializer ifNotNil: [ 
		self nextPutAll: '='.
		aMOTypescriptVariable initializer acceptVisitor: self ]
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitWhile: aMOWhile [ 
	self nextPutAll: 'while ('.
	aMOWhile condition acceptVisitor: self. 
	self nextPutAll: ')'.
	aMOWhile loopingBlock  acceptVisitor: self 
]

{ #category : #visiting }
MOJavaCodeGenerator >> visitWith: aMOAlceWith [

	self comment: [ 
		self nextPutAll: ' TODO: With ('.
		aMOAlceWith expression acceptVisitor: self.
		self nextPutAll: ')'.
		aMOAlceWith block acceptVisitor: self ]
]
