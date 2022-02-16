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
		'context'
	],
	#category : #'Moxing-MicroWriters'
}

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> copyStatement [

	^ writer writeStatement: [ :stmt | 
		  stmt anchor: context anchor.
		  writingBlock value: stmt ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> defaultCopy [

	^ writer writeCopy: [ :c | 
		  c anchor: context anchor.
		  writingBlock value: c ]
]

{ #category : #'as yet unclassified' }
MOModelWriteTypeBasedCopyResolver >> resolveWriterFor: aMOVariable context: aMOBlock writingContext: aMOBlockWriter do: aFullBlockClosure [

	context := aMOBlock.
	writer := aMOBlockWriter.
	writingBlock := aFullBlockClosure.
	^ aMOVariable acceptVisitor: self
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitAccessor: aMOAccessor [ 
	
	^ writer writeAttributeAccessor: [ : method  | 
		  method anchor: context anchor.
		  writingBlock value: method ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitArrayAccess: aMOArrayAccess [

	^ self defaultCopy
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitAssignment: aMOAssignment [

	^ self defaultCopy
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitAttribute: aMOAttribute [

	^ writer writeAttribute: [ :variable | 
		  variable anchor: context anchor.
		  writingBlock value: variable ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitAttributeAccess: aMOAttributeAccess [

	^ self defaultCopy
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitBinaryArithmeticOperation: aMOBinaryArithmeticOperation [

	^ self defaultCopy
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitBlock: aMOBlock [

	^ writer writeBlock: [ :block | 
		  block anchor: context anchor.
		  writingBlock value: block ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitBooleanLiteral: aMOBooleanLiteral [ 
	^ self defaultCopy 
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitCase: aMOCase [

	^ writer writeCase: [ :variable | 
		  variable anchor: context anchor.
		  writingBlock value: variable ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitClass: aMOClass [
	^ writer writeClass: [ :class | 
		  class anchor: context anchor.
		  writingBlock value: class ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitConstant: aMOConstant [ 

	^ writer writeConstant: [ :variable | 
		  variable anchor: context anchor.
		  writingBlock value: variable ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitEmptyBlock: aMOEmptyBlock [ 
^ self defaultCopy 
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitEnum: aMOEnum [

	^ writer writeEnum: [ :class | 
		  class anchor: context anchor.
		  writingBlock value: class ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitEnumEntry: aMOEnumEntry [

	^ writer writeEntry: [ :variable | 
		  variable anchor: context anchor.
		  writingBlock value: variable ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitExit: aMOAlceExit [ 
	^ self copyStatement 
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitFunction: aMOFunction [

	^ writer writeFunction: [ :function | 
		  function anchor: context anchor.
		  writingBlock value: function ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitIfElse: aMOIfElse [
"
	^ self defaultCopy"

	^ writer writeIfElse: [ :block | 
		  block anchor: context anchor.
		  writingBlock value: block ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitInvocation: aMOInvocation [

	^ self defaultCopy
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitLabelReference: aMOAlceLabelReference [

	^ self defaultCopy
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitLiteral: aMONullLiteral [ 
	^ self defaultCopy 
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitMethod: aMOMethod [

	^ writer writeMethod: [ : method  | 
		  method anchor: context anchor.
		  writingBlock value: method ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitMethodInvocation: aMOMethodInvocation [

	^ self defaultCopy
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitModule: aMOModule [ 
	^ writer writeModule: [ :class | 
		  class anchor: context anchor.
		  writingBlock value: class ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitNewExpression: aMONewInvocation [ 

	^ self defaultCopy  
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitNullLiteral: aMONullLiteral [

	^ self visitLiteral: aMONullLiteral
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitOnErrorGoToLabel: aMOAlceOnErrorGoToLabel [ 
	^ self copyStatement 
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitOnErrorResumeNext: aMOAlceOnErrorResumeNext [

	^ self copyStatement
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitParameter: aMOParameter [

	^ writer writeParameter: [ :parameter | 
		  parameter anchor: context anchor.
		  writingBlock value: parameter ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitPrimitiveTypeReference: aMOPrimitiveTypeReference [

	^ writer primitiveTypeReferenceNamed: aMOPrimitiveTypeReference name
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitProcedure: aMOProcedure [

	^ writer writeSubprocedure: [ :procedure | 
		  procedure anchor: context anchor.
		  writingBlock value: procedure ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitResume: aMOAlceResume [

	^ self copyStatement 
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitResumeLabel: aMOAlceResumeLabel [

	^ self copyStatement
]

{ #category : #enumerating }
MOModelWriteTypeBasedCopyResolver >> visitSelect: aMOSelect [

	^ writer writeSelect: [ :block | 
		  block anchor: context anchor.
		  writingBlock value: block ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitSetToReturn: aMOSetToReturn [ 
	^ self copyStatement
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitStatementExpression: aMOStatementExpression [

	^ self copyStatement
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitStringLiteral: aMOStringLiteral [ 
	^ self defaultCopy 
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitStructure: aMOStructure [

	^ writer writeStructure: [ :structure | 
		  structure anchor: context anchor.
		  writingBlock cull: structure ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitTypeReference: aMOTypeReference [ 
	^ self defaultCopy 
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitUnaryArithmeticExpression: aMOUnaryArithmeticOperation [

	^ self defaultCopy
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitUnaryExpression: aMOUnaryArithmeticOperation [ 
	self shouldBeImplemented.
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitVariable: aMOVariable [

	^ writer writeVariable: [ :variable | 
		  variable anchor: context anchor.
		  writingBlock value: variable ]
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitVariableReference: aMOVariableReference [

	^ self defaultCopy
]

{ #category : #visiting }
MOModelWriteTypeBasedCopyResolver >> visitWhile: aMOWhile [

	^ writer writeWhile: [ :while | 
		  while anchor: context anchor.
		  writingBlock value: while ]
]
