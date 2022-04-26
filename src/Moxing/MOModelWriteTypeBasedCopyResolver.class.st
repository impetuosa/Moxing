"
I know what writer to use for copying a specific entity based on type by using the visitor pattern
"
Class {
	#name : #MOModelWriteTypeBasedCopyResolver,
	#superclass : #Object,
	#instVars : [
		'writingBlock',
		'writer',
		'mainWriter',
		'lookup'
	],
	#category : #'Moxing-MicroWriters'
}

{ #category : #copying }
MOModelWriteTypeBasedCopyResolver >> copyExpression [

	^ writer writeUnregisteredExpression:  [ :exp | writingBlock value: exp ]
]

{ #category : #copying }
MOModelWriteTypeBasedCopyResolver >> copyExpressionStatement [

	^ writer writeExpressionStatement: [ :stmt | writingBlock value: stmt ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> copyStatement [
self error: ' Cannot '.
	^ writer writeExpressionStatement: [ :stmt | 
		  writingBlock value: stmt ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> defaultCopy [
	self halt .
	^ writer writeCopy: [ :c | 
		  writingBlock value: c ]
]

{ #category : #'as yet unclassified' }
MOModelWriteTypeBasedCopyResolver >> resolveWriterFor: aProvenanceEntity writingContext: aDestinationContexWriter do: aFullBlockClosure [

	writer := aDestinationContexWriter.
	writingBlock := aFullBlockClosure.
	^ aProvenanceEntity to acceptVisitor: self
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitAccessor: aMOAccessor [ 
	
	^ writer writeAttributeAccessor: [ : method  | 
		  writingBlock value: method ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitArrayAccess: aMOArrayAccess [

	^ self copyExpression
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitArrayLiteral: aMOArrayLiteral [ 
^ self visitLiteral: aMOArrayLiteral
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitAssignment: aMOAssignment [

	^ self copyExpression
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitAttribute: aMOAttribute [

	^ writer writeAttribute: [ :variable | 
		  writingBlock value: variable ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitAttributeAccess: aMOAttributeAccess [

	^ self copyExpression
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitBinaryArithmeticOperation: aMOBinaryArithmeticOperation [

	^ self copyExpression
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitBlock: aMOBlock [

	^ writer writeBlock: [ :block | writingBlock value: block ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitBlockClosure: aMOStBlockClosure [
  ^writer writeBlockClosure: [:proc |  writingBlock value: proc ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitBooleanLiteral: aMOBooleanLiteral [ 
	^ self copyExpression  
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitCase: aMOCase [

	^ writer writeCase: [ :variable | writingBlock value: variable ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitCharacterLiteral: aMOCharacterLiteral [ 
	^ self visitLiteral: aMOCharacterLiteral
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitClass: aMOClass [

	^ writer writeClass: [ :class | writingBlock value: class ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitClassFunction: aMOClassFunction [

	^ writer writeClassFunction: [ :function | 
		  writingBlock value: function ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitClassProcedure: aMOClassProcedure [

	^ writer writeClassProcedure: [ :proc | writingBlock value: proc ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitConstant: aMOConstant [

	^ writer writeLocalConstant: [ :variable | writingBlock value: variable ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitConstantReference: aMOConstantReference [ 
	
	^ self copyExpression 
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitDeclarationUnit: aMODeclarationUnit [ 
	^ writer writeDeclarationUnit: [ : unit | writingBlock value: unit ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitEmptyBlock: aMOEmptyBlock [ 
	^ self visitBlock: aMOEmptyBlock 
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitEnum: aMOEnum [

	^ writer writeEnum: [ :class | writingBlock value: class ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitEnumEntry: aMOEnumEntry [

	^ writer writeEntry: [ :variable | writingBlock value: variable ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitExit: aMOAlceExit [

	^ writer writeExit: [ :exit | writingBlock cull: exit ] 
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitFloatLiteral: aMOFloatLiteral [ 
^ self visitLiteral: aMOFloatLiteral 
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitForm: aMOAlceForm [ 
	
	^ writer writeForm: [ :class | writingBlock value: class ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitFunction: aMOFunction [

	^ writer writeFunction: [ :function | writingBlock value: function ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitGlobalConstant: aMOGlobalConstant [

	^ writer writeGlobalConstant: [ :const | writingBlock value: const ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitGlobalVariable: aMOGlobalVariable [ 
	^ writer writeGlobalVariable: [ :const | writingBlock value: const ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitIfElse: aMOIfElse [

	"
	^ self defaultCopy"

	^ writer writeIfElse: [ :block | writingBlock value: block ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitIntegerLiteral: aMOIntegerLiteral [ 
	^ self visitLiteral: aMOIntegerLiteral 
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitInvocation: aMOInvocation [

	^ self copyExpression 
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitLabelReference: aMOAlceLabelReference [

	^ self copyExpression 
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitLiteral: aMONullLiteral [ 
	| lit | 
	lit := self copyExpression .
	self assert: lit literal isNotNil. 
	^ lit.
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitLocalVariable: aMOLocalVariable [

	^ writer writeVariable: [ :variable | writingBlock value: variable ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitMetaClass: aMOMetaClass [
  ^writer writeMetaclass: [:class |  writingBlock value: class ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitMethod: aMOMethod [

	^ writer writeMethod: [ :method | writingBlock value: method ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitMethodInvocation: aMOMethodInvocation [

	^ self copyExpression 
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitModule: aMOModule [

	^ writer writeModule: [ :class | writingBlock value: class ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitNewExpression: aMONewInvocation [ 

	^ self copyExpression  
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitNullLiteral: aMONullLiteral [

	^ self visitLiteral: aMONullLiteral
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitOnErrorGoToLabel: aMOAlceOnErrorGoToLabel [

	^ writer writeOnErrorGoTo: [ :goto | writingBlock cull: goto ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitOnErrorResumeNext: aMOAlceOnErrorResumeNext [


	^ writer writeOnErrorResumeNext:  [ :goto | writingBlock cull: goto ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitPackageReference: aMOPackageReference [
  ^self copyExpression
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitParameter: aMOParameter [

	^ writer writeParameter: [ :parameter | 
		  writingBlock value: parameter ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitPragma: aMOPhPragma [
  ^self copyExpression
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitPrimitiveTypeReference: aMOPrimitiveTypeReference [

	^ writer writeUnregisteredExpression: [ :e | writingBlock cull: e ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitProcedure: aMOProcedure [

	^ writer writeSubprocedure: [ :procedure | 
		  writingBlock value: procedure ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitResume: aMOAlceResume [

	 ^ writer writeResume: [ : resume | writingBlock cull: resume ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitResumeLabel: aMOAlceResumeLabel [

	^ writer writeResume:  [ : resume | writingBlock value: resume  ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitReturn: aMOReturn [
  ^writer writeReturn: [:return |  writingBlock cull: return ]
]

{ #category : #enumerating }
MOModelWriteTypeBasedCopyResolver >> visitSelect: aMOSelect [

	^ writer writeSelect: [ :block | writingBlock value: block ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitSelfReference: aMOSelfReference [

	^ self copyExpression
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitSetToReturn: aMOSetToReturn [ 

	^ writer writeSetToReturn: [ :block | writingBlock value: block ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitSharedVariable: aMOSharedVariable [ 
 ^writer writeSharedVariable:  [:var |  writingBlock value: var ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitStCascade: aMOStCascade [
  ^self copyExpression
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitStClass: aMOStClass [
  ^writer writeStClass: [:class |  writingBlock value: class ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitStExensionMethodDeclarationUnit: aMOStExensionMethodDeclarationUnit [
  ^writer writeStExensionMethodDeclarationUnit: [:method |  writingBlock value: method ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitStMethod: aMOStMethod [
  ^writer writeStMethod: [:method |  writingBlock value: method ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitStatementExpression: aMOStatementExpression [

	^ self copyExpressionStatement 
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitStringLiteral: aMOStringLiteral [

	^ self visitLiteral: aMOStringLiteral
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitStructure: aMOStructure [

	^ writer writeStructure: [ :structure | writingBlock cull: structure ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitSymbolicArrayLiteral: aMOArrayLiteral [ 
^ self visitLiteral: aMOArrayLiteral
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitTypeReference: aMOTypeReference [ 
	^ self copyExpression  
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitUnaryArithmeticExpression: aMOUnaryArithmeticOperation [

	^ self copyExpression 
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitUnaryExpression: aMOUnaryArithmeticOperation [ 
	self shouldBeImplemented.
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitVarArgParameter: aMOVariableArgumentsParameter [

	^ writer writeParameter: [ :parameter | 
		  parameter mapsToVariableArguments.
		  writingBlock value: parameter ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitVariable: aMOVariable [

	^ writer writeVariable: [ :variable | writingBlock value: variable ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitVariableAccessor: aMOVariableAccessor [

	^ writer writeAttributeAccessor: [ :acc | writingBlock value: acc ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitVariableReference: aMOVariableReference [

	^ self copyExpression 
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitWhile: aMOWhile [

	^ writer writeWhile: [ :while | writingBlock value: while ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitWith: aMOAlceWith [

	^ writer writeWith: [ :with | writingBlock value: with ]
]
